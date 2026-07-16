# 1. ローカルの node_modules/.bin にあるコマンドを補完候補としてリストアップ
function __fish_npx_commands
    set -l dir (pwd)
    while test "$dir" != "/"
        set -l bin_dir "$dir/node_modules/.bin"
        if test -d "$bin_dir"
            for file in $bin_dir/*
                if test -f "$file" -a -x "$file"
                    basename $file
                end
            end
            break
        end
        set dir (dirname "$dir")
    end
end

# 2. npx 自体の主要なオプションの補完
complete -c npx -s p -l package -d "Specify package to install"
complete -c npx -s c -d "Run a command inside the package"
complete -c npx -s y -l yes -d "Skip installation prompt"
complete -c npx -l no -d "Do not install missing packages"

# 3. サブコマンドの位置でローカルコマンドを補完
complete -c npx -n "__fish_use_subcommand" -f -a "(__fish_npx_commands)" -d "Local package command"

# 4. npx の後ろに続くコマンド自体の補完定義を呼び出す（委譲する）
complete -c npx -a "(__fish_complete_subcommand)"
