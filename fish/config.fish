# ====================
# Auto-start tmux
# ====================

if status is-interactive; and not set -q TMUX; and test "$TERM_PROGRAM" = ghostty
    tmux new-session -A -s main
end

# ====================
# Keybinding
# ====================

function fish_user_key_bindings
    for mode in insert default visual
        fish_default_key_bindings -M $mode

        bind -M $mode \cr peco_select_ghq_repository
        bind -M $mode \cg peco_open_gh_repository
        bind -M $mode \cf nextd-or-forward-word
        bind -M $mode \ce accept-autosuggestion
    end

    fish_vi_key_bindings --no-erase
end

# ====================
# Alias
# ====================

# General
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
abbr grep rg
alias ls="eza --git --color=always --icons --group-directories-first"
alias la="eza -a --git --color=always --icons --group-directories-first"
alias ll="eza -hla --git --color=always --icons --group-directories-first"
abbr l ll

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim
abbr n nvim

# ====================
# Config
# ====================

function fish_title
    # 現在のパスからフォルダ名だけを抽出 (例: /home/user/project -> project)
    set -l current_folder (basename $PWD)

    if set -q argv[1]
        # コマンド実行中: "nvim project"
        echo "$argv[1] - $current_folder"
    else
        # アイドル時: "project"
        echo "fish - $current_folder"
    end
end

# ====================
# PATH
# ====================

fish_add_path $HOME/.local/bin

# set command-line-tools path
set -gx SDKROOT $(xcrun --show-sdk-path)

# for nvim
set -gx XDG_CONFIG_HOME $HOME/.config

# for ghq
set -gx GHQ_ROOT $HOME/go/src

# for swift
fish_add_path $HOME/.swiftpm/bin
fish_add_path $HOME/.config/swiftpm/bin

# for Golang
fish_add_path $GOPATH/bin
set -gx GOPATH $HOME/go

# for Rust
fish_add_path $HOME/.cargo/bin

# for AndroidSDK
fish_add_path $ANDROID_HOME/platform-tools
set -gx JAVA_HOME /Applications/Android\ Studio.app/Contents/jbr/Contents/Home
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -gx NDK_HOME $ANDROID_HOME/ndk/(ls -1 $ANDROID_HOME/ndk)

# for Flutter
fish_add_path $HOME/flutter/bin

# for Google Cloud SDK
fish_add_path $HOME/google-cloud-sdk/bin

# for maestro (mobile ui testing)
fish_add_path $HOME/.maestro/bin

# ====================
# Settings
# ====================

# fish
starship init fish | source
set -U fish_emoji_width 2
set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# for asdf (version manager)
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
source (brew --prefix asdf)/libexec/asdf.fish

# for homebrew at M1
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
set -q MANPATH; or set MANPATH ''
set -gx MANPATH /opt/homebrew/share/man $MANPATH
set -q INFOPATH; or set INFOPATH ''
set -gx INFOPATH /opt/homebrew/share/info $INFOPATH
set -gx LIBRARY_PATH /opt/homebrew/lib
set -gx CPATH /opt/homebrew/include $CPATH

# for mysql
fish_add_path /opt/homebrew/opt/mysql@8.0/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/mysql@8.0/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/mysql@8.0/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

# for ruby
set -gx OPENSSL_ROOT $(brew --prefix openssl@3)
set -gx LDFLAGS "-L$OPENSSL_ROOT/lib" $LDFLAGS
set -gx CPPFLAGS "-I$OPENSSL_ROOT/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "$OPENSSL_ROOT/lib/pkgconfig" $PKG_CONFIG_PATH
set -gx LIBFFI_ROOT $(brew --prefix libffi)
set -gx LDFLAGS "-L$LIBFFI_ROOT/lib" $LDFLAGS
set -gx PKG_CONFIG_PATH "$LIBFFI_ROOT/lib/pkgconfig" $PKG_CONFIG_PATH
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_ROOT"
fish_add_path $OPENSSL_ROOT/bin
fish_add_path $LIBFFI_ROOT/bin
set -gx LIBRARY_PATH "$(brew --prefix zstd)/lib" $LIBRARY_PATH

# for python
set -gx GRPC_PYTHON_BUILD_SYSTEM_OPENSSL 1
set -gx GRPC_PYTHON_BUILD_SYSTEM_ZLIB 1

# for 1Password CLI (tokens)
source $HOME/.config/op/plugins.sh
if command -q op
    set -gx GITHUB_TOKEN (op read "op://Personal/GitHub PAT - MCP/credential" --no-newline 2>/dev/null)
end

# for Rust
fish_add_path $HOME/.cargo/bin

# for flutter
fish_add_path $HOME/fvm/default/bin
set -gx FLUTTER_ROOT $(which flutter)

# zoxide
zoxide init fish | source

# Added by Antigravity
fish_add_path $HOME/.antigravity/antigravity/bin

# Remove duplicate PATH (preserving order)
set -l unique_path
for p in $PATH
    if not contains $p $unique_path
        set -a unique_path $p
    end
end
set -gx PATH $unique_path

# ====================
# Auto generated settings
# ====================

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]
    . '$HOME/google-cloud-sdk/path.fish.inc'
end
