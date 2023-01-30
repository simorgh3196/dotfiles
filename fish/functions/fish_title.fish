function fish_title \
    --description "Set title to current folder and shell name" \
    --argument-names last_command

    set --local basename (string replace -r '^.*/' '' -- $PWD)
    set --local current_command (status current-command 2>/dev/null; or echo $_)

    set --local prompt "$basename: $last_command - $current_command"

    if test -z "$last_command"
        set prompt "$current_command"
    end

    echo $prompt
end
