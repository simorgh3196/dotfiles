#!/usr/bin/env bash
input=$(cat)

# --- Extract data ---
model=$(echo "$input" | jq -r '.model.display_name // .model.id')
model_id=$(echo "$input" | jq -r '.model.id // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
worktree_name=$(echo "$input" | jq -r '.worktree.name // empty')

# --- Icons (Nerd Font, raw UTF-8 bytes) ---
icon_model=$(echo -e '\xEF\x84\xA1')        # U+F121 nf-fa-code
icon_ctx=$(echo -e '\xF3\xB0\xA7\x91')      # U+F09D1 nf-md-brain
icon_dir=$(echo -e '\xEF\x81\xBC')           # U+F07C nf-fa-folder_open
icon_branch=$(echo -e '\xEE\x9C\xA5')       # U+E725 nf-dev-git_branch
icon_worktree=$(echo -e '\xEF\x86\xBB')     # U+F1BB nf-fa-tree
icon_quota=$(echo -e '\xF3\xB0\xBB\x82')     # U+F0EC2 nf-md-ticket-percent

# --- Colors (Tokyo Night Storm) ---
reset=$'\033[0m'
dim=$'\033[2m'
green=$'\033[38;2;115;218;202m'   # #73daca
yellow=$'\033[38;2;224;175;104m'  # #e0af68
red=$'\033[38;2;247;118;142m'     # #f7768e
blue=$'\033[38;2;122;162;247m'    # #7aa2f7

sep="${dim} │ ${reset}"

# --- Model ---
model_section="${dim}${icon_model}${reset}  ${model}"

# --- Context usage (% only) ---
if [ -n "$used_pct" ] && [ "$used_pct" != "null" ]; then
  ui=${used_pct%.*}
  if [ "$ui" -ge 80 ]; then
    ctx_color=$red
  elif [ "$ui" -ge 50 ]; then
    ctx_color=$yellow
  else
    ctx_color=""
  fi
  ctx_section="${icon_ctx} ${ctx_color}${ui}%${reset}"
else
  ctx_section="${icon_ctx} --%"
fi

# --- Quota usage ---
model_id_lower=$(echo "$model_id" | tr '[:upper:]' '[:lower:]')
if [[ "$model_id_lower" == *"gemini"* ]]; then
  quota_key="gemini-5h"
else
  quota_key="3p-5h"
fi

remaining_fraction=$(echo "$input" | jq -r ".quota[\"${quota_key}\"].remaining_fraction // empty")
quota_section=""
if [ -n "$remaining_fraction" ] && [ "$remaining_fraction" != "null" ]; then
  quota_pct=$(echo "$input" | jq -r ".quota[\"${quota_key}\"].remaining_fraction * 100 | round")
  if [ "$quota_pct" -le 20 ]; then
    quota_color=$red
  elif [ "$quota_pct" -le 50 ]; then
    quota_color=$yellow
  else
    quota_color=$green
  fi
  quota_section="${dim}${icon_quota}${reset} ${quota_color}${quota_pct}%${reset}"
fi

# --- Directory ---
dir_name=$(basename "$cwd")
dir_section="${dim}${icon_dir}${reset}  ${dir_name}"

# --- Git ---
git_section=""
worktree_section=""
cd "$cwd" 2>/dev/null || cd /

if git rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_dir=$(git rev-parse --git-dir 2>/dev/null)
    in_worktree=false
    if [ -f "$cwd/.git" ] || [[ "$git_dir" == *"/worktrees/"* ]]; then
      in_worktree=true
      git_icon="${icon_worktree} ${icon_branch}"
    else
      git_icon="${icon_branch}"
    fi

    # --- GitHub repo link ---
    remote_url=$(git remote get-url origin 2>/dev/null)
    repo_url=""
    repo_name=""
    if [ -n "$remote_url" ]; then
      # Strip trailing .git if present
      clean_url="${remote_url%.git}"
      # Normalize SSH and HTTPS GitHub URLs
      if [[ "$clean_url" =~ ^git@github\.com:(.+)$ ]]; then
        repo_path="${BASH_REMATCH[1]}"
        repo_url="https://github.com/${repo_path}"
        repo_name="${repo_path##*/}"
      elif [[ "$clean_url" =~ ^https://github\.com/(.+)$ ]]; then
        repo_path="${BASH_REMATCH[1]}"
        repo_url="https://github.com/${repo_path}"
        repo_name="${repo_path##*/}"
      fi
    fi

    # --- Diff stats ---
    diff_stat=$(git diff --numstat 2>/dev/null | awk '{a+=$1; d+=$2} END {printf "%d %d", a+0, d+0}')
    additions=${diff_stat% *}
    deletions=${diff_stat#* }
    diff_info=""
    if [ "$additions" -gt 0 ] || [ "$deletions" -gt 0 ]; then
      diff_info=" ${green}+${additions}${reset} ${red}-${deletions}${reset}"
    fi

    git_section="${dim}${git_icon}${reset} ${branch}${diff_info}"

    # --- GitHub repo section ---
    if [ -n "$repo_url" ] && [ -n "$repo_name" ]; then
      # OSC 8 clickable hyperlink: \e]8;;URL\e\\text\e]8;;\e\\
      link_open=$'\033]8;;'"${repo_url}"$'\033\\'
      link_close=$'\033]8;;\033\\'
      repo_section="${dim}$(echo -e '\xEF\x82\x9B')${reset} ${link_open}${blue}${repo_name}${reset}${link_close}"
    fi

    # --- Worktree name from JSON ---
    if $in_worktree && [ -n "$worktree_name" ]; then
      worktree_section="${dim}${icon_worktree}${reset} ${worktree_name}"
    fi
  fi
fi

# --- Output ---
output="${model_section}${sep}${ctx_section}"
[ -n "$quota_section" ] && output="${output}${sep}${quota_section}"
output="${output}${sep}${dir_section}"
[ -n "$repo_section" ] && output="${output}${sep}${repo_section}"
[ -n "$worktree_section" ] && output="${output}${sep}${worktree_section}"
[ -n "$git_section" ] && output="${output}${sep}${git_section}"

printf '%s\n' "$output"
