install:
	install-nvim install-fish install-git

install-nvim:
	ln -s `pwd`/vim/vim ~/.vim
	ln -s `pwd`/vim/vim/vimrc ~/.config/nvim/init.vim

install-fish:
	ln -s `pwd`/fish ~/.config/fish

install-git:
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore_global ~/.gitignore_blobal

install-tmux:
	ln -s `pwd`/tmux/tmux ~/.tmux
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
