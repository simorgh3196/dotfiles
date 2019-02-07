PWD:=`pwd`

#
# Install
#

.PHONY: install install/brew install/nvim install/fish install/git install/tmux install/vscode
install: install/brew install/nvim install/fish install/git install/tmux install/vscode

install/brew:
	@if [ ! -x "`command -v brew 2>/dev/null`" ]; then \
		$(shell /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"); \
	fi
	brew bundle --file=${PWD}/brew/Brewfile

install/nvim:
	ln -siv ${PWD}/vim/vim ~/.vim
	mkdir -p ~/.config/nvim
	ln -siv ${PWD}/vim/vim/vimrc ~/.config/nvim/init.vim

install/fish:
	mkdir -p ~/.config/
	ln -siv ${PWD}/fish ~/.config/fish

install/git:
	ln -siv ${PWD}/git/gitconfig ~/.gitconfig
	ln -siv ${PWD}/git/gitignore_global ~/.gitignore_blobal

install/tmux:
	ln -siv ${PWD}/tmux/tmux ~/.tmux
	ln -siv ${PWD}/tmux/tmux.conf ~/.tmux.conf

install/vscode:
	ln -siv ${PWD}/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@cat ${PWD}/vscode/list-extensions | while read line; do \
		code --install-extension $$line; \
	done

#
# Export
#

.PHONY: exoprt export/brew export/vscode
export: export/brew export/vscode

export/brew:
	brew bundle dump --force --file=${PWD}/brew/Brewfile

export/vscode:
	code --list-extensions > ${PWD}/vscode/list-extensions
