install:
	install-nvim install-fish install-git

install-nvim:
	ln -siv `pwd`/vim/vim ~/.vim
	mkdir -p ~/.config/nvim
	ln -siv `pwd`/vim/vim/vimrc ~/.config/nvim/init.vim

install-fish:
	mkdir -p ~/.config/
	ln -siv `pwd`/fish ~/.config/fish

install-git:
	ln -siv `pwd`/git/gitconfig ~/.gitconfig
	ln -siv `pwd`/git/gitignore_global ~/.gitignore_blobal

install-tmux:
	ln -siv `pwd`/tmux/tmux ~/.tmux
	ln -siv `pwd`/tmux/tmux.conf ~/.tmux.conf
