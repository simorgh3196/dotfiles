function ghq
  command ghq $argv
  if string match -q 'get*' -- "$argv[1]"
    command ghq list > "$TMPDIR/.ghq_list_cache"
  end
end
