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

# for Composer
set -x PATH $HOME/.config/composer/vendor/bin $PATH

# for Rust
set -x PATH $HOME/.cargo/bin $PATH

# for Aleph.js
set -x PATH $HOME/.deno/bin $PATH

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

# for nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH


# ====================
# Settings
# ====================

# for iTerm2
#echo -e "\033]6;1;bg;red;brightness;40\a"
#echo -e "\033]6;1;bg;green;brightness;44\a"
#echo -e "\033]6;1;bg;blue;brightness;52\a"

# for rbenv
rbenv init - | source

# for pyenv
status is-interactive; and pyenv init --path | source
pyenv init - | source

# for jenv
jenv init - | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/t-hayakawa/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/t-hayakawa/google-cloud-sdk/path.fish.inc'; else; . '/Users/t-hayakawa/google-cloud-sdk/path.fish.inc'; end; end

# Remove duplicate PATH
set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/tomoya-hayakawa/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

