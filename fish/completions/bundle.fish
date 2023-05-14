function __fish_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq (count $argv) ]
        for i in (seq (count $argv))
            if [ $cmd[$i] != $argv[$i] ]
                return 1
            end
        end
        return 0
    end
    return 1
end

complete -c bundle -n '__fish_using_command bundle exec' -f -a pod -d 'Build and run an executable product'
complete -c bundle -n '__fish_using_command bundle exec hoge' -f -a pod -d 'Build and run an executable product'
complete -c bundle -n '__fish_using_command bundle exec pod' -f -w pod
complete -c bundle -n '__fish_using_command bundle exec fastlane' -f -w fastlane
# complete -c bundle -n '__fish_using_command bundle exec pod' -f -w pod
# complete -c bundle -n '__fish_using_command bundle exec fastlane' -f -w fastlane
