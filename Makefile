PWD:=$(shell pwd)

#
# Install
#

test:
	@echo $(PWD)

.PHONY: install install/*

install: install/brew install/nvim install/fish install/git install/vscode

install/brew:
	which brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=$(PWD)/brew/Brewfile

install/nvim:
	mkdir -p ~/.config/
	ln -siv $(PWD)/nvim ~/.config

install/fish:
	mkdir -p ~/.config/
	ln -siv $(PWD)/fish ~/.config

install/wezterm:
	mkdir -p ~/.config/
	ln -siv $(PWD)/wezterm ~/.config

install/git:
	ln -siv $(PWD)/git/gitconfig ~/.gitconfig
	ln -siv $(PWD)/git/gitignore_global ~/.gitignore_global

install/vscode:
	mkdir -p ~/Library/Application\ Support/Code/User/
	ln -siv $(PWD)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	@cat $(PWD)/vscode/list-extensions | while read line; do \
		code --install-extension $$line; \
	done

#
# Export
#

.PHONY: export export/brew export/vscode

export: export/brew export/vscode

export/brew:
	brew bundle dump --force --file=$(PWD)/brew/Brewfile

export/vscode:
	code --list-extensions > $(PWD)/vscode/list-extensions
