function peco_select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list | peco $peco_flags | read line

  if [ $line ]
    ghq root | read dir
    cd $dir/$line
    commandline -f repaint
  end
end
