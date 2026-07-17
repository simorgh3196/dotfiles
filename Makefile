PWD:=$(shell pwd)

# Fresh macOS has no brew on PATH until shellenv is applied; make every
# recipe (brew bundle, asdf, uv, ...) work right after the installer runs.
export PATH := /opt/homebrew/bin:/opt/homebrew/sbin:$(PATH)

#
# Install
#

test:
	@echo $(PWD)

.PHONY: install install/*

install: install/brew install/asdf install/python install/nvim install/fish install/git install/tmux install/ghostty install/claude install/vscode

install/brew:
	command -v brew >/dev/null 2>&1 || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=$(PWD)/brew/Brewfile

install/asdf:
	ln -siv $(PWD)/asdf/tool-versions ~/.tool-versions
	ln -siv $(PWD)/asdf/asdfrc ~/.asdfrc
	ln -siv $(PWD)/asdf/default-npm-packages ~/.default-npm-packages
	ln -siv $(PWD)/asdf/default-gems ~/.default-gems
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

install/tmux:
	ln -siv $(PWD)/tmux/tmux.conf ~/.tmux.conf
	mkdir -p ~/.config/tmuxinator
	ln -siv $(PWD)/tmux/tmuxinator/dev.yml ~/.config/tmuxinator/dev.yml
	if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
	fi

install/git:
	ln -siv $(PWD)/git/gitconfig ~/.gitconfig
	ln -siv $(PWD)/git/gitignore_global ~/.gitignore_global

# Link per file, not per directory: ~/.claude/agents and friends already
# exist on a used machine, and `ln -s dir ~/.claude/agents` would nest the
# link inside it instead of replacing it.
install/claude:
	mkdir -p ~/.claude/hooks ~/.claude/agents ~/.claude/rules
	ln -siv $(PWD)/claude/settings.json ~/.claude/settings.json
	ln -siv $(PWD)/claude/statusline.sh ~/.claude/statusline.sh
	ln -siv $(PWD)/claude/CLAUDE.md ~/.claude/CLAUDE.md
	ln -siv $(PWD)/claude/hooks/*.sh ~/.claude/hooks/
	ln -siv $(PWD)/claude/agents/*.md ~/.claude/agents/
	ln -siv $(PWD)/claude/rules/*.md ~/.claude/rules/

install/vscode:
	ln -siv $(PWD)/vscode/settings.json "$(HOME)/Library/Application Support/Code/User/settings.json"
	xargs -L1 code --install-extension < $(PWD)/vscode/list-extensions

# Third-party agent skills, restored from their source repos with
# vercel-labs skills (https://github.com/vercel-labs/skills).
# Installs into Claude Code (~/.claude/skills) and the universal
# ~/.agents/skills that Cursor, Codex, and other agents read.
# Not part of 'install': review what each repo ships before running.
install/skills:
	npx -y skills add simorgh3196/skills -g -a claude-code universal -y
	npx -y skills add vercel-labs/agent-browser -g -a claude-code universal -y
	npx -y skills add firecrawl/cli -g -a claude-code universal -y
	npx -y skills add vercel-labs/skills -g -a claude-code universal -y
	npx -y skills add emilkowalski/skills -g -a claude-code universal -y

#
# Export
#

.PHONY: export export/brew

export: export/brew export/asdf export/python export/vscode

export/asdf:
	cp ~/.tool-versions $(PWD)/asdf/tool-versions
	cp ~/.asdfrc $(PWD)/asdf/asdfrc
	cp ~/.default-npm-packages $(PWD)/asdf/default-npm-packages
	cp ~/.default-gems $(PWD)/asdf/default-gems

export/brew:
	brew bundle dump --force --no-vscode --file=$(PWD)/brew/Brewfile

export/python:
	uv pip freeze --python "$$(asdf which python)" > $(PWD)/python/requirements.txt

export/vscode:
	code --list-extensions > $(PWD)/vscode/list-extensions
