PWD:=`pwd`

install:
	install/nvim install/fish install/git install/tmux

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

install/vscode-extensions:
	@cat ${PWD}/vscode/list-extensions | while read line; do echo $$line; done

export/vscode-extensions:
	code --list-extensions > ${PWD}/vscode/list-extensions

brew/init:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install carthage exa fish ghq gibo git neovim peco pyenv rbenv watchman yarn
