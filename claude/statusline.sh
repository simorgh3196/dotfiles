#!/usr/bin/env bash
input=$(cat)

# --- Extract data ---
model=$(echo "$input" | jq -r '.model.display_name // .model.id')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# --- Icons (Nerd Font, raw UTF-8 bytes) ---
icon_model=$(echo -e '\xEF\x84\xA1')        # U+F121 nf-fa-code
icon_ctx=$(echo -e '\xF3\xB1\x83\xBE')      # U+F10FE nf-md-tank
icon_dir=$(echo -e '\xEF\x81\xBC')           # U+F07C nf-fa-folder_open
icon_branch=$(echo -e '\xEE\x9C\xA5')       # U+E725 nf-dev-git_branch
icon_worktree=$(echo -e '\xEF\x86\xBB')     # U+F1BB nf-fa-tree

# --- Colors (Tokyo Night Storm) ---
reset=$'\033[0m'
dim=$'\033[2m'
green=$'\033[38;2;115;218;202m'   # #73daca
yellow=$'\033[38;2;224;175;104m'  # #e0af68
red=$'\033[38;2;247;118;142m'     # #f7768e

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
  ctx_section="${dim}${icon_ctx}${reset} ${ctx_color}${ui}%${reset}"
else
  ctx_section="${dim}${icon_ctx}${reset} --%"
fi

# --- Directory ---
dir_name=$(basename "$cwd")
dir_section="${dim}${icon_dir}${reset}  ${dir_name}"

# --- Git ---
git_section=""
cd "$cwd" 2>/dev/null || cd /

if git rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_dir=$(git rev-parse --git-dir 2>/dev/null)
    if [ -f "$cwd/.git" ] || [[ "$git_dir" == *"/worktrees/"* ]]; then
      git_icon="${icon_worktree} ${icon_branch}"
    else
      git_icon="${icon_branch}"
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
  fi
fi

# --- Output ---
output="${model_section}${sep}${ctx_section}${sep}${dir_section}"
[ -n "$git_section" ] && output="${output}${sep}${git_section}"

printf '%s\n' "$output"
