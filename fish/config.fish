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
alias ls="exa --git --color=always --icons --group-directories-first"
alias la="exa -a --git --color=always --icons --group-directories-first"
alias ll="exa -hla --git --color=always --icons --group-directories-first"
abbr l ll

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim
abbr n nvim

# Development
abbr git hub
abbr g hub
abbr gl 'hub l --color | devmoji --log --color | less -rXF'
abbr st "hub st"
abbr commit "hub commit"
abbr fetch "hub fetch"
abbr push "hub push"
abbr pull "hub pull"

# Other
abbr bi "bundle install --jobs 4"
abbr be "bundle exec"

function github-copilot_helper
    set -l TMPFILE (mktemp)
    trap 'rm -f $TMPFILE' EXIT
    if github-copilot-cli $argv[1] "$argv[2..]" --shellout $TMPFILE
        if [ -e "$TMPFILE" ]
            set -l FIXED_CMD (cat $TMPFILE)
            eval "$FIXED_CMD"
        else
            echo "Apologies! Extracting command failed"
        end
    else
        return 1
    end
end
set -U fish_features qmark-noglob
alias ??='github-copilot_helper what-the-shell'
alias git?='github-copilot_helper git-assist'
alias gh?='github-copilot_helper gh-assist'

# ====================
# PATH
# ====================

fish_add_path $HOME/.local/bin

# for nvim
set -gx XDG_CONFIG_HOME $HOME/.config

# for ghq
set -gx GHQ_ROOT $HOME/go/src

# for Golang
fish_add_path $GOPATH/bin
set -gx GOPATH $HOME/go

# for Rust
fish_add_path $HOME/.cargo/bin

# for AndroidSDK
fish_add_path $ANDROID_HOME/platform-tools
set -gx ANDROID_HOME $HOME/Library/Android/sdk

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

# for asdf (version manager)
source $(brew --prefix asdf)/libexec/asdf.fish
set -gx FLUTTER_ROOT $(asdf where flutter)

# for ruby
set -gx OPENSSL_ROOT $(brew --prefix openssl@1.1)
set -gx LDFLAGS "-L$OPENSSL_ROOT/lib"
set -gx CPPFLAGS "-I$OPENSSL_ROOT/include"
set -gx PKG_CONFIG_PATH "$OPENSSL_ROOT/lib/pkgconfig"
set -gx LIBFFI_ROOT $(brew --prefix libffi)
set -gx LDFLAGS "-L$LIBFFI_ROOT/lib" $LDFLAGS
set -gx PKG_CONFIG_PATH "$LIBFFI_ROOT/lib/pkgconfig" $PKG_CONFIG_PATH
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_ROOT"
fish_add_path $OPENSSL_ROOT/bin
fish_add_path $LIBFFI_ROOT/bin

# for python
set -gx GRPC_PYTHON_BUILD_SYSTEM_OPENSSL 1
set -gx GRPC_PYTHON_BUILD_SYSTEM_ZLIB 1

# Remove duplicate PATH
set -gx PATH (echo $PATH | tr ' ' '\n' | sort -u)


# ====================
# Auto generated settings
# ====================

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/.asdf/installs/python/anaconda3-2022.05/bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hayakawa/google-cloud-sdk/path.fish.inc' ]
    . '/Users/hayakawa/google-cloud-sdk/path.fish.inc'
end
