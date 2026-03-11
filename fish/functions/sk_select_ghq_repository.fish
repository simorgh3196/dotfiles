function sk_select_ghq_repository
  set -l query (commandline)

  printf '%s\n' $GHQ_ROOT/*/*/* | sed "s|$GHQ_ROOT/||" | sk --reverse --height 40% --typos --query "$query" | read line

  if [ $line ]
    cd $GHQ_ROOT/$line
    commandline -f repaint
  end
end
