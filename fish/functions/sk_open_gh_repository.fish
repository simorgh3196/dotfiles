function sk_open_gh_repository
  set -l query (commandline)

  printf '%s\n' $GHQ_ROOT/*/*/* | sed "s|$GHQ_ROOT/||" | sk --reverse --height 40% --typos --query "$query" | read line

  if [ $line ]
    open https://$line
    commandline -f repaint
  end
end
