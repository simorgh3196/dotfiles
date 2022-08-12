function __fish_swift_using_command
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
complete -c swift -n '__fish_swift_using_command swift' -f -a 'run' -d 'Build and run an executable product'
complete -c swift -n '__fish_swift_using_command swift' -f -a 'build' -d 'Build sources into binary products'
complete -c swift -n '__fish_swift_using_command swift' -f -a 'test' -d 'Build and run tests'
complete -c swift -n '__fish_swift_using_command swift' -f -a 'package' -d 'Perform operations on Swift packages'
complete -c swift -n '__fish_swift_using_command swift' -f -a 'help' -d 'Show subcommand help information.'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift run --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift run -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift run --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift run --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift run --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift run --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift run --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift run' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift run --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift run --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift run --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift run' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift run' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift run' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift run' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift run' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift run' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift run' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift run' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift run' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift run' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift run' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift run --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift run' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift run' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift run' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift run --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift run' -f -l skip-build -d 'Skip building the executable product'
complete -c swift -n '__fish_swift_using_command swift run' -f -l build-tests -d 'Build both source and test targets'
complete -c swift -n '__fish_swift_using_command swift run' -f -l repl -d 'Launch Swift REPL for the package'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift build --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift build -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift build --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift build --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift build --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift build --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift build --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift build' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift build --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift build --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift build --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift build' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift build' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift build' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift build' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift build' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift build' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift build' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift build' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift build' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift build' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift build' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift build --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift build' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift build' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift build --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift build' -f -l build-tests -d 'Build both source and test targets'
complete -c swift -n '__fish_swift_using_command swift build' -f -l show-bin-path -d 'Print the binary output path'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l target -d 'Build the specified target'
complete -c swift -n '__fish_swift_using_command swift build' -f -r -l product -d 'Build the specified product'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift test --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift test -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift test --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift test --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift test --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift test --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift test --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift test' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift test --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift test --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift test --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift test' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift test' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift test' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift test' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift test' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift test' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift test' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift test' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift test' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift test' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift test' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift test --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift test' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift test' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift test --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift test' -f -l skip-build -d 'Skip building the test target'
complete -c swift -n '__fish_swift_using_command swift test' -f -l parallel -d 'Run the tests in parallel.'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l num-workers -d 'Number of tests to execute in parallel.'
complete -c swift -n '__fish_swift_using_command swift test' -f -l list-tests -s l -d 'Lists test methods in specifier format'
complete -c swift -n '__fish_swift_using_command swift test' -f -l generate-linuxmain
complete -c swift -n '__fish_swift_using_command swift test' -f -l show-codecov-path -d 'Print the path of the exported code coverage JSON file'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -s s -l specifier
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l filter -d 'Run test cases matching regular expression, Format: <test-target>.<test-case> or <test-target>.<test-case>/<test>'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l skip -d 'Skip test cases matching regular expression, Example: --skip PerformanceTests'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l xunit-output -d 'Path where the xUnit xml file should be generated.'
complete -c swift -n '__fish_swift_using_command swift test --xunit-output' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift test' -f -r -l test-product -d 'Test the specified product.'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'clean' -d 'Delete build artifacts'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'purge-cache' -d 'Purge the global repository cache.'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'reset' -d 'Reset the complete cache/build directory'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'update' -d 'Update package dependencies'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'describe' -d 'Describe the current package'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'init' -d 'Initialize a new package'
complete -c swift -n '__fish_swift_using_command swift package' -f -a '_format' -d ''
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'experimental-api-diff' -d ''
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'dump-symbol-graph' -d ''
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'dump-pif' -d ''
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'dump-package' -d 'Print parsed Package.swift as JSON'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'edit' -d 'Put a package in editable mode'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'unedit' -d 'Remove a package from editable mode'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'config' -d 'Manipulate configuration of the package'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'resolve' -d 'Resolve package dependencies'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'fetch' -d ''
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'show-dependencies' -d 'Print the resolved dependency graph'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'tools-version' -d 'Manipulate tools version of the current package'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'generate-xcodeproj' -d 'Generates an Xcode project. This command will be deprecated soon.'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'compute-checksum' -d 'Compute the checksum for a binary artifact.'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'completion-tool' -d 'Completion tool (for shell completions)'
complete -c swift -n '__fish_swift_using_command swift package' -f -a 'help' -d 'Show subcommand help information.'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package clean --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package clean -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package clean --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package clean --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package clean --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package clean --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package clean --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package clean --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package clean --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package clean --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package clean --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package clean' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package clean' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package clean --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package purge-cache --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package purge-cache -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package purge-cache --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package purge-cache --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package purge-cache --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package purge-cache --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package purge-cache --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package purge-cache --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package purge-cache --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package purge-cache --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package purge-cache --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package purge-cache' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package purge-cache --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package reset --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package reset -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package reset --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package reset --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package reset --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package reset --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package reset --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package reset --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package reset --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package reset --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package reset --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package reset' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package reset' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package reset --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package update --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package update -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package update --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package update --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package update --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package update --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package update --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package update' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package update --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package update --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package update --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package update' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package update' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package update' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package update' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package update' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package update' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package update' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package update' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package update' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package update --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package update' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package update' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package update --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package update' -f -l dry-run -s n -d 'Display the list of dependencies that can be updated'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package describe --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package describe -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package describe --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package describe --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package describe --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package describe --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package describe --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package describe --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package describe --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package describe --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package describe --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package describe' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package describe --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package describe' -f -r -l type
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package init --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package init -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package init --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package init --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package init --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package init --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package init --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package init' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package init --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package init --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package init --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package init' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package init' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package init' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package init' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package init' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package init' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package init' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package init' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package init' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package init --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package init' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package init' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package init --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l type
complete -c swift -n '__fish_swift_using_command swift package init' -f -r -l name -d 'Provide custom package name'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package _format --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package _format -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package _format --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package _format --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package _format --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package _format --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package _format --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package _format --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package _format --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package _format --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package _format --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package _format' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package _format' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package _format --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package experimental-api-diff' -f -l invert-baseline -d 'Invert the baseline which is helpful for determining API additions'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package dump-symbol-graph --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package dump-pif --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package dump-pif -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package dump-pif --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package dump-pif --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package dump-pif --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package dump-pif --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package dump-pif --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package dump-pif --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package dump-pif --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package dump-pif --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package dump-pif --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package dump-pif --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-pif' -f -l preserve-structure -d 'Preserve the internal structure of PIF'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package dump-package --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package dump-package -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package dump-package --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package dump-package --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package dump-package --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package dump-package --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package dump-package --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package dump-package --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package dump-package --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package dump-package --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package dump-package --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package dump-package' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package dump-package --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package edit --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package edit -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package edit --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package edit --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package edit --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package edit --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package edit --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package edit --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package edit --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package edit --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package edit --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package edit' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package edit --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l revision -d 'The revision to edit'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l branch -d 'The branch to create'
complete -c swift -n '__fish_swift_using_command swift package edit' -f -r -l path -d 'Create or use the checkout at this path'
complete -c swift -n '__fish_swift_using_command swift package edit --path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package unedit --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package unedit -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package unedit --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package unedit --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package unedit --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package unedit --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package unedit --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package unedit --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package unedit --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package unedit --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package unedit --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package unedit --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package unedit' -f -l force -d 'Unedit the package even if it has uncommited and unpushed changes'
complete -c swift -n '__fish_swift_using_command swift package config' -f -a 'set-mirror' -d 'Set a mirror for a dependency'
complete -c swift -n '__fish_swift_using_command swift package config' -f -a 'unset-mirror' -d 'Remove an existing mirror'
complete -c swift -n '__fish_swift_using_command swift package config' -f -a 'get-mirror' -d 'Print mirror configuration for the given package dependency'
complete -c swift -n '__fish_swift_using_command swift package config' -f -a 'help' -d 'Show subcommand help information.'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package config set-mirror --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l package-url -d 'The package dependency url'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l original-url -d 'The original url'
complete -c swift -n '__fish_swift_using_command swift package config set-mirror' -f -r -l mirror-url -d 'The mirror url'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l package-url -d 'The package dependency url'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l original-url -d 'The original url'
complete -c swift -n '__fish_swift_using_command swift package config unset-mirror' -f -r -l mirror-url -d 'The mirror url'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package config get-mirror --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l package-url -d 'The package dependency url'
complete -c swift -n '__fish_swift_using_command swift package config get-mirror' -f -r -l original-url -d 'The original url'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package resolve --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package resolve -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package resolve --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package resolve --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package resolve --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package resolve --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package resolve --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package resolve --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package resolve --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package resolve --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package resolve --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package resolve --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l version -d 'The version to resolve at'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l branch -d 'The branch to resolve at'
complete -c swift -n '__fish_swift_using_command swift package resolve' -f -r -l revision -d 'The revision to resolve at'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package fetch --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package fetch -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package fetch --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package fetch --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package fetch --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package fetch --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package fetch --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package fetch --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package fetch --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package fetch --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package fetch --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package fetch --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l version -d 'The version to resolve at'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l branch -d 'The branch to resolve at'
complete -c swift -n '__fish_swift_using_command swift package fetch' -f -r -l revision -d 'The revision to resolve at'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package show-dependencies --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package show-dependencies' -f -r -l format
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package tools-version --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package tools-version -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package tools-version --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package tools-version --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package tools-version --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package tools-version --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package tools-version --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package tools-version --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package tools-version --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package tools-version --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package tools-version --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package tools-version --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l format
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -l set-current -d 'Set tools version of package to the current tools version in use'
complete -c swift -n '__fish_swift_using_command swift package tools-version' -f -r -l set -d 'Set tools version of package to the given value'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l xcconfig-overrides -d 'Path to xcconfig file'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --xcconfig-overrides' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -r -l output -d 'Path where the Xcode project should be generated'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj --output' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l legacy-scheme-generator -d 'Use the legacy scheme generator'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l watch -d 'Watch for changes to the Package manifest to regenerate the Xcode project'
complete -c swift -n '__fish_swift_using_command swift package generate-xcodeproj' -f -l skip-extra-files -d 'Do not add file references for extra files to the generated Xcode project'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package compute-checksum' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package compute-checksum --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -o Xcc -d 'Pass flag through to all C compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -o Xswiftc -d 'Pass flag through to all Swift compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -o Xlinker -d 'Pass flag through to all linker invocations'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -o Xcxx -d 'Pass flag through to all C++ compiler invocations'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -o Xxcbuild -d 'Pass flag through to the Xcode build system invocations'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -o Xmanifest -d 'Pass flag to the manifest build invocation'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l configuration -s c -d 'Build with configuration'
complete -c swift -n '__fish_swift_using_command swift package completion-tool --configuration' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package completion-tool -c' -f -k -a 'debug release'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l build-path -d 'Specify build/cache directory'
complete -c swift -n '__fish_swift_using_command swift package completion-tool --build-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l cache-path -d 'Specify the shared cache directory'
complete -c swift -n '__fish_swift_using_command swift package completion-tool --cache-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-repository-cache -d 'Use a shared cache when fetching repositories'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-repository-cache
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l chdir -s C
complete -c swift -n '__fish_swift_using_command swift package completion-tool --chdir' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool -C' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l package-path -d 'Change working directory before any other operation'
complete -c swift -n '__fish_swift_using_command swift package completion-tool --package-path' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l multiroot-data-file
complete -c swift -n '__fish_swift_using_command swift package completion-tool --multiroot-data-file' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-prefetching
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-prefetching
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l verbose -s v -d 'Increase verbosity of informational output'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-sandbox -d 'Disable using the sandbox when executing subprocesses'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-package-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l manifest-cache -d 'Caching mode of Package.swift manifests (shared: shared cache, local: package\'s build directory, none: disabled'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l destination
complete -c swift -n '__fish_swift_using_command swift package completion-tool --destination' -f -a '(for i in *.{}; echo $i;end)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l triple
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l sdk
complete -c swift -n '__fish_swift_using_command swift package completion-tool --sdk' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l toolchain
complete -c swift -n '__fish_swift_using_command swift package completion-tool --toolchain' -f -a '(__fish_complete_directories)'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l arch -d 'Build the package for the these architectures'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l static-swift-stdlib -d 'Link Swift stdlib statically'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l no-static-swift-stdlib
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l skip-update -d 'Skip updating dependencies from their remote during a resolution'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l sanitize -d 'Turn on runtime checks for erroneous behavior, possible values: address, thread, undefined, scudo'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-code-coverage -d 'Enable code coverage'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-code-coverage
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l force-resolved-versions -l disable-automatic-resolution -d 'Disable automatic resolution if Package.resolved file is out-of-date'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-index-store -d 'Enable or disable  indexing-while-building feature'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-index-store
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-parseable-module-interfaces
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l trace-resolver
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l jobs -s j -d 'The number of jobs to spawn in parallel during the build process'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-test-discovery
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l enable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l disable-build-manifest-caching
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l emit-swift-module-separately
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l use-integrated-swift-driver
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l experimental-explicit-module-build
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l print-manifest-job-graph -d 'Write the command graph for the build manifest as a graphviz file'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l build-system
complete -c swift -n '__fish_swift_using_command swift package completion-tool --build-system' -f -k -a 'native xcode'
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l netrc
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -l netrc-optional
complete -c swift -n '__fish_swift_using_command swift package completion-tool' -f -r -l netrc-file
complete -c swift -n '__fish_swift_using_command swift package completion-tool --netrc-file' -f -a '(for i in *.{}; echo $i;end)'
