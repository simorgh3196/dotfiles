function fzf_select_ghq_repository
  set -l query (commandline)

  ghq list | fzf --reverse --height 40% --query "$query" | read line

  if [ $line ]
    ghq root | read dir
    cd $dir/$line
    commandline -f repaint
  end
end
