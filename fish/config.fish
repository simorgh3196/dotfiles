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


# ====================
# PATH
# ====================

# for Golang
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH


# ====================
# Settings
# ====================

# for rbenv
rbenv init - | source

# for pyenv
pyenv init - | source
