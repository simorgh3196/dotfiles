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

# for jenv
set -x PATH $HOME/.jenv/bin $PATH

# for rails
set -x LDFLAGS -L/usr/local/opt/openssl/lib
set -x CPPFLAGS -I/usr/local/opt/openssl/include

# for flutter
set -x PATH $HOME/.pub-cache/bin $PATH

# for Google Cloud SDK
set -x PATH $HOME/google-cloud-sdk/bin $PATH


# ====================
# Settings
# ====================

# for iTerm2
#echo -e "\033]6;1;bg;red;brightness;40\a"
#echo -e "\033]6;1;bg;green;brightness;44\a"
#echo -e "\033]6;1;bg;blue;brightness;52\a"

# for homebrew at M1
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# for rbenv
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
set -x RBENV_ROOT "$(brew --prefix rbenv)"
set -x PATH "$RBENV_ROOT/bin" $PATH
status --is-interactive; and rbenv init - fish | source

# for pyenv
status --is-interactive; and pyenv init --path | source

# for jenv
status --is-interactive; and jenv init - fish | source

# for asdf (version manager)
source $(brew --prefix asdf)/libexec/asdf.fish

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/t-hayakawa/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/t-hayakawa/#google-cloud-sdk/path.fish.inc'; else; . '/Users/t-hayakawa/google-cloud-sdk/path.fish.inc'; end; end

# Remove duplicate PATH
set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)

