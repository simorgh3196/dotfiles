PWD:=$(shell pwd)

#
# Install
#

test:
	@echo $(PWD)

.PHONY: install install/*

install: install/brew install/asdf install/python install/nvim install/fish install/git

install/brew:
	which brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=$(PWD)/brew/Brewfile

install/asdf:
	ln -siv $(PWD)/asdf/tool-versions ~/.tool-versions
	ln -siv $(PWD)/asdf/asdfrc ~/.asdfrc
	ln -siv $(PWD)/asdf/default-npm-packages ~/.default-npm-packages
	asdf install

install/python:
	uv pip install --python "$$(asdf which python)" --system -r $(PWD)/python/requirements.txt

install/nvim:
	mkdir -p ~/.config/
	ln -siv $(PWD)/nvim ~/.config

install/fish:
	mkdir -p ~/.config/
	ln -siv $(PWD)/fish ~/.config

install/ghostty:
	mkdir -p ~/.config/ghostty/
	ln -siv $(PWD)/ghostty/config ~/.config/ghostty/config

install/git:
	ln -siv $(PWD)/git/gitconfig ~/.gitconfig
	ln -siv $(PWD)/git/gitignore_global ~/.gitignore_global

#
# Export
#

.PHONY: export export/brew

export: export/brew export/asdf export/python

export/asdf:
	cp ~/.tool-versions $(PWD)/asdf/tool-versions
	cp ~/.asdfrc $(PWD)/asdf/asdfrc
	cp ~/.default-npm-packages $(PWD)/asdf/default-npm-packages

export/brew:
	brew bundle dump --force --no-vscode --file=$(PWD)/brew/Brewfile

export/python:
	uv pip freeze --python "$$(asdf which python)" > $(PWD)/python/requirements.txt
