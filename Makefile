PWD:=$(shell pwd)

#
# Install
#

test:
	@echo $(PWD)

.PHONY: install install/*

install: install/brew install/mise install/python install/nvim install/fish install/git install/ghostty install/herdr install/claude install/vscode

install/brew:
	which brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=$(PWD)/brew/Brewfile

install/mise:
	mkdir -p ~/.config/mise
	ln -sfv $(PWD)/mise/config.toml ~/.config/mise/config.toml
	mise install
	@# Create global symlinks for GUI editor support
	sudo ln -sfv "$(HOME)/.local/share/mise/shims/node" /usr/local/bin/node
	sudo ln -sfv "$(HOME)/.local/share/mise/shims/npm" /usr/local/bin/npm
	sudo ln -sfv "$(HOME)/.local/share/mise/shims/pnpm" /usr/local/bin/pnpm
	sudo ln -sfv "$(HOME)/.local/share/mise/shims/yarn" /usr/local/bin/yarn
	sudo ln -sfv "$(HOME)/.local/share/mise/shims/bun" /usr/local/bin/bun

install/python:
	mise exec -- uv pip install --python "$$(mise which python)" --system -r $(PWD)/python/requirements.txt

install/nvim:
	mkdir -p ~/.config/
	ln -siv $(PWD)/nvim ~/.config

install/fish:
	mkdir -p ~/.config/
	ln -siv $(PWD)/fish ~/.config

install/ghostty:
	mkdir -p ~/.config/ghostty/
	ln -siv $(PWD)/ghostty/config ~/.config/ghostty/config

install/herdr:
	mkdir -p ~/.config/herdr
	ln -siv $(PWD)/herdr/config.toml ~/.config/herdr/config.toml

install/git:
	ln -siv $(PWD)/git/gitconfig ~/.gitconfig
	ln -siv $(PWD)/git/gitignore_global ~/.gitignore_global

install/claude:
	mkdir -p ~/.claude/hooks
	ln -siv $(PWD)/claude/settings.json ~/.claude/settings.json
	ln -siv $(PWD)/claude/statusline.sh ~/.claude/statusline.sh
	ln -siv $(PWD)/claude/hooks/prefer-rg.sh ~/.claude/hooks/prefer-rg.sh
	ln -siv $(PWD)/claude/hooks/guard-cursor-agent.sh ~/.claude/hooks/guard-cursor-agent.sh

install/vscode:
	@# VS Code
	mkdir -p "$(HOME)/Library/Application Support/Code/User"
	ln -sfv $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/Code/User/settings.json"
	@# Cursor
	mkdir -p "$(HOME)/Library/Application Support/Cursor/User"
	ln -sfv $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/Cursor/User/settings.json"
	@# AntigravityIDE
	mkdir -p "$(HOME)/Library/Application Support/AntigravityIDE/User"
	ln -sfv $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/AntigravityIDE/User/settings.json"
	mkdir -p "$(HOME)/Library/Application Support/Antigravity/User"
	ln -sfv $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/Antigravity/User/settings.json"
	xargs -L1 code --install-extension < $(PWD)/vscode/list-extensions || true

#
# Export
#

.PHONY: export export/brew

export: export/brew export/mise export/python export/vscode

export/mise:
	cp ~/.config/mise/config.toml $(PWD)/mise/config.toml

export/brew:
	brew bundle dump --force --no-vscode --file=$(PWD)/brew/Brewfile

export/python:
	mise exec -- uv pip freeze --python "$$(mise which python)" > $(PWD)/python/requirements.txt

export/vscode:
	code --list-extensions > $(PWD)/vscode/list-extensions
