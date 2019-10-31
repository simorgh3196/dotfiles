function __fish_bundle_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish_bundle_using_gem
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 2 ]
    return 0
  end
  return 1
end

if ! [ -e "$PWD/vendor/bundle/ruby/*/bin/" ]
  exit 1
end

function __gems
  echo (ls $PWD/vendor/bundle/*/*/bin/)
end

function __using_gem
  set cmd (commandline -opc)
  return cmd[-1]
end

complete -f -c be -n '__fish_bundle_needs_command' -a (__gems)
complete -f -c be -n '__fish_bundle_using_gem' -w (__using_gem)
