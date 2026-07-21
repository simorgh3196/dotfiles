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

install: install/brew install/mise install/python install/nvim install/fish install/bash install/git install/ghostty install/herdr install/claude install/vscode install/hunk install/antigravity

install/brew:
	command -v brew >/dev/null 2>&1 || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

install/bash:
	ln -siv $(PWD)/bash/bash_profile ~/.bash_profile
	ln -siv $(PWD)/bash/bashrc ~/.bashrc

install/ghostty:
	mkdir -p ~/.config/ghostty/
	ln -siv $(PWD)/ghostty/config ~/.config/ghostty/config

install/herdr:
	mkdir -p ~/.config/herdr
	ln -siv $(PWD)/herdr/config.toml ~/.config/herdr/config.toml

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

install/hunk:
	mkdir -p ~/.config/hunk
	ln -sfv $(PWD)/hunk/config.toml ~/.config/hunk/config.toml

install/antigravity:
	mkdir -p ~/.gemini/antigravity-cli
	test -f ~/.gemini/antigravity-cli/settings.json || cp -v $(PWD)/antigravity-cli/settings.json.example ~/.gemini/antigravity-cli/settings.json
	ln -sfv $(PWD)/antigravity-cli/statusline.sh ~/.gemini/antigravity-cli/statusline.sh


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

export: export/brew export/mise export/python export/vscode

export/mise:
	cp ~/.config/mise/config.toml $(PWD)/mise/config.toml

export/brew:
	brew bundle dump --force --no-vscode --file=$(PWD)/brew/Brewfile

export/python:
	mise exec -- uv pip freeze --python "$$(mise which python)" > $(PWD)/python/requirements.txt

export/vscode:
	code --list-extensions > $(PWD)/vscode/list-extensions
