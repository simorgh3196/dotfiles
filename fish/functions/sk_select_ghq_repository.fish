function sk_select_ghq_repository
  set -l query (commandline)
  set -l cache "$TMPDIR/.ghq_list_cache"

  if not test -f $cache
    command ghq list > $cache
  else
    command fish -c "ghq list > $cache" &
    disown
  end

  cat $cache | sk --reverse --height 40% --typos --query "$query" | read line

  if [ $line ]
    cd $GHQ_ROOT/$line
    commandline -f repaint
  end
end
