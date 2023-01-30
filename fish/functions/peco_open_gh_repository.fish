function peco_open_gh_repository
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list -e | peco $peco_flags | read line

  if [ $line ]
    open https://$line
    commandline -f repaint
  end
end        
