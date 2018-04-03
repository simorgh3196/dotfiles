# Pure
# by Rafael Rinaldi
# https://github.com/rafaelrinaldi/pure
# MIT License

# Whether or not is a fresh session
set -g __pure_fresh_session 1

# Deactivate the default virtualenv prompt so that we can add our own
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# Symbols

__pure_set_default pure_symbol_prompt "❯"
__pure_set_default pure_symbol_git_down_arrow "⇣"
__pure_set_default pure_symbol_git_up_arrow "⇡"
__pure_set_default pure_symbol_git_dirty "*"
__pure_set_default pure_symbol_horizontal_bar "—"

# Colors

__pure_set_default pure_color_red (set_color red)
__pure_set_default pure_color_green (set_color green)
__pure_set_default pure_color_blue (set_color blue)
__pure_set_default pure_color_yellow (set_color yellow)
__pure_set_default pure_color_cyan (set_color cyan)
__pure_set_default pure_color_gray (set_color 93A1A1)
__pure_set_default pure_color_normal (set_color normal)

__pure_set_default pure_username_color $pure_color_gray
__pure_set_default pure_host_color $pure_color_gray
__pure_set_default pure_root_color $pure_color_normal

# Determines whether the username and host are shown at the begining or end
# 0 - end of prompt, default
# 1 - start of prompt
# Any other value defaults to the default behaviour
__pure_set_default pure_user_host_location 0

# Max execution time of a process before its run time is shown when it exits
__pure_set_default pure_command_max_exec_time 5

function pre_prompt --on-event fish_prompt
  # Template
  set -l user_and_host ""
  set -l current_folder (__parse_current_folder)
  set -l git_branch_name ""
  set -l git_dirty ""
  set -l git_arrows ""
  set -l command_duration ""
  set -l pre_prompt ""

  # Do not add a line break to a brand new session
  if test $__pure_fresh_session -eq 0
    set pre_prompt $pre_prompt "\n"
  end

  # Check if user is in an SSH session
  if [ "$SSH_CONNECTION" != "" ]
    set -l host (hostname -s)
    set -l user (whoami)

    if [ "$user" = "root" ]
      set user "$pure_root_color$user"
    else
      set user "$pure_username_color$user"
    end

    # Format user and host part of prompt
    set user_and_host "$user$pure_color_gray@$pure_host_color$host$pure_color_normal "
  end

  if test $pure_user_host_location -eq 1
    set pre_prompt $pre_prompt $user_and_host
  end

  # Format current folder on prompt output
  set pre_prompt $pre_prompt "$pure_color_blue$current_folder$pure_color_normal "

  # Exit with code 1 if git is not available
  if not type -fq git
    return 1
  end

  # Check if is on a Git repository
  set -l is_git_repository (command git rev-parse --is-inside-work-tree ^/dev/null)

  if test -n "$is_git_repository"
    set git_branch_name (__parse_git_branch)

    # Check if there are files to commit
    set -l is_git_dirty (command git status --porcelain --ignore-submodules ^/dev/null)

    if test -n "$is_git_dirty"
      set git_dirty $pure_symbol_git_dirty
    end

    # Check if there is an upstream configured
    command git rev-parse --abbrev-ref '@{upstream}' >/dev/null ^&1; and set -l has_upstream
    if set -q has_upstream
      set -l git_status (string split ' ' (string replace -ar '\s+' ' ' (command git rev-list --left-right --count 'HEAD...@{upstream}')))

      set -l git_arrow_left $git_status[1]
      set -l git_arrow_right $git_status[2] 

      # If arrow is not "0", it means it's dirty
      if test $git_arrow_left != 0
        set git_arrows " $pure_symbol_git_up_arrow"
      end

      if test $git_arrow_right != 0
        set git_arrows " $git_arrows$pure_symbol_git_down_arrow"
      end
    end

    # Format Git prompt output
    set pre_prompt $pre_prompt "$pure_color_gray$git_branch_name$git_dirty$pure_color_normal$pure_color_cyan$git_arrows$pure_color_normal "
  end

  if test $pure_user_host_location -ne 1
    set pre_prompt $pre_prompt $user_and_host
  end

  # Prompt command execution duration
  if test -n "$CMD_DURATION"
    set command_duration (__format_time $CMD_DURATION $pure_command_max_exec_time)
  end

  set pre_prompt $pre_prompt "$pure_color_yellow$command_duration$pure_color_normal"

  echo -e -s $pre_prompt
end

function fish_prompt
  set -l prompt ""

  # Save previous exit code
  set -l exit_code $status

  # Set default color symbol to green meaning it's all good!
  set -l color_symbol $pure_color_green

  # Handle previous failed command
  if test $exit_code -ne 0
    # Symbol color is red when previous command fails
    set color_symbol $pure_color_red
  end

  # Show python virtualenv name (if activated)
  if test -n "$VIRTUAL_ENV"
    set prompt $prompt $pure_color_gray(basename "$VIRTUAL_ENV")"$pure_color_normal "
  end

  set prompt $prompt "$color_symbol$pure_symbol_prompt$pure_color_normal "

  echo -e -s $prompt

  set __pure_fresh_session 0
end


# wakatime for fish
#
# Add this to the fish_prompt function in
# ~/.config/fish/functions/fish_prompt.fish
# (or if it doesn't exist, create it).


# We've also included an example of how
# to determine the current project from the pwd.
# It'll only work without alterations if
# you happen to keep all your projects in
# ~/Sites/ on a Mac, but it's easy to modify

set -l project

if echo (pwd) | grep -qEi "^/Users/$USER/Sites/"
    set  project (echo (pwd) | sed "s#^/Users/$USER/Sites/\\([^/]*\\).*#\\1#")
else
    set  project "Terminal"
end

wakatime --write --plugin "fish-wakatime/0.0.1" --entity-type app --project "$project" --entity (echo $history[1] | cut -d ' ' -f1) 2>&1 > /dev/null&