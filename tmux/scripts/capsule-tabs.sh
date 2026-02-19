#!/usr/bin/env bash
# Wrap active tab format with rounded capsule characters (Nerd Font powerline)
# Run after TPM to override Tokyo Night theme's window-status-current-format

BG="#24283b"      # status bar background (storm)
TAB_BG="#414868"  # active tab background (bblack)

LEFT_ROUND=$'\xee\x82\xb6'  # U+E0B6
RIGHT_ROUND=$'\xee\x82\xb4' # U+E0B4

LEFT_CAP="#[fg=${TAB_BG},bg=${BG}]${LEFT_ROUND}"
RIGHT_CAP="#[fg=${TAB_BG},bg=${BG}]${RIGHT_ROUND}"

cur="$(tmux show -gv window-status-current-format)"

# Avoid double-wrapping on repeated source-file
if [[ "$cur" == *"$LEFT_ROUND"* ]]; then
  exit 0
fi

tmux set -g window-status-current-format "${LEFT_CAP}${cur}${RIGHT_CAP} "

# Capsule for session name (status-left)
SESSION_BG="#7aa2f7"  # blue
sl="$(tmux show -gv status-left)"
sl="#[fg=${SESSION_BG},bg=${BG}]${LEFT_ROUND}${sl}#[fg=${SESSION_BG},bg=${BG}]${RIGHT_ROUND} "
tmux set -g status-left "$sl"

# Remove last-window icon from inactive tabs
inactive="$(tmux show -gv window-status-format)"
inactive="$(echo "$inactive" | sed 's/#\[fg=#e0af68\]#{?window_last_flag,[^}]*}//')"
tmux set -g window-status-format "$inactive"
