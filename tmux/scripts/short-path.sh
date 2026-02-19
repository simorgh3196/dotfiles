#!/usr/bin/env bash
# Custom path widget for tmux status bar
# Shows last 2 path components with Tokyo Night Storm styling

path="${1}"
path="${path/#$HOME/\~}"

# Truncate to last 2 components
parts=$(echo "${path}" | sed 's#/$##' | awk -F'/' '{print NF}')
if [[ ${parts} -gt 2 ]]; then
  path="…/$(echo "${path}" | sed 's#/$##' | awk -F'/' '{print $(NF-1)"/"$NF}')"
fi

RESET="#[fg=brightwhite,bg=#15161e,nobold,noitalics,nounderscore,nodim]"
echo "#[fg=blue,bg=default]󰉋 ${RESET}#[bg=default]${path} "
