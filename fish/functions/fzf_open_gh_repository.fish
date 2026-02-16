function fzf_open_gh_repository
  set -l query (commandline)

  ghq list -e | fzf --reverse --height 40% --query "$query" | read line

  if [ $line ]
    open https://$line
    commandline -f repaint
  end
end
