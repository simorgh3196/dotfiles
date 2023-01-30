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

alias mkdir='mkdir -p'

alias l='exa -hla --git'
alias ls='exa --git'
alias la='exa -a --git'

alias vim='nvim'
alias be='bundle exec'
alias rn='react-native'


# ====================
# PATH
# ====================

set -x PATH $HOME/.local/bin $PATH

# for nvim
set -x XDG_CONFIG_HOME $HOME/.config

# for ghq
set -x GHQ_ROOT $HOME/go/src

# for Golang
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# for Rust
set -x PATH $HOME/.cargo/bin $PATH

# for AndroidSDK
# install by AndroidStudio
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $ANDROID_HOME/platform-tools $PATH

# for Flutter
set -x PATH $HOME/flutter/bin $PATH

# for Google Cloud SDK
set -x PATH $HOME/google-cloud-sdk/bin $PATH


# ====================
# Settings
# ====================

# prompt
starship init fish | source

# for homebrew at M1
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# for ruby
set -x OPENSSL_ROOT $(brew --prefix openssl@1.1)
set -x PATH $OPENSSL_ROOT/bin $PATH
set -x LDFLAGS "-L$OPENSSL_ROOT/lib"
set -x CPPFLAGS "-I$OPENSSL_ROOT/include"
set -x PKG_CONFIG_PATH "$OPENSSL_ROOT/lib/pkgconfig"
set -x LIBFFI_ROOT $(brew --prefix libffi)
set -x PATH $LIBFFI_ROOT/bin $PATH
set -x LDFLAGS "-L$LIBFFI_ROOT/lib" $LDFLAGS
set -x PKG_CONFIG_PATH "$LIBFFI_ROOT/lib/pkgconfig" $PKG_CONFIG_PATH
set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_ROOT"

# for python
set -x GRPC_PYTHON_BUILD_SYSTEM_OPENSSL 1
set -x GRPC_PYTHON_BUILD_SYSTEM_ZLIB 1

# for asdf (version manager)
source $(brew --prefix asdf)/libexec/asdf.fish
set -x FLUTTER_ROOT $(asdf where flutter)

# Remove duplicate PATH
set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/.asdf/installs/python/anaconda3-2022.05/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hayakawa/google-cloud-sdk/path.fish.inc' ]; . '/Users/hayakawa/google-cloud-sdk/path.fish.inc'; end
