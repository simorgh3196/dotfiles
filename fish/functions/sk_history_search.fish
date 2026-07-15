function sk_history_search
  set -l query (commandline)

  history | sk --reverse --height 40% --typos --no-sort --query "$query" | read -l cmd

  if [ $cmd ]
    commandline -- $cmd
    commandline -f repaint
  end
end
