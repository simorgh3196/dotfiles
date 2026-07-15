# asdf → mise 移行 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** dotfiles リポジトリのランタイムバージョン管理設定を asdf から mise に置き換える（設定ファイルのみ。このマシンへの実際のインストール切り替えはスコープ外）。

**Architecture:** `asdf/` ディレクトリ配下の4ファイル（tool-versions, asdfrc, default-npm-packages, default-gems）を `mise/config.toml` 1ファイルに統合する。fish, Makefile, Brewfile, README の asdf への参照を mise 向けに書き換える。コードのユニットテストは存在しないリポジトリのため、各タスクの「テスト」は静的検証コマンド（TOML構文チェック、fish構文チェック、`make -n` によるターゲット検証、`rg` によるリファレンス残存チェック）で代替する。

**Tech Stack:** fish shell, GNU Make, Homebrew Bundle, TOML（mise設定）

## Global Constraints

- 対象は `/Users/simorgh3196/dotfiles` リポジトリの設定ファイルのみ。`brew install mise` の実行、`asdf` のアンインストール、`mise install` の実行など、このマシン上での実際のランタイム切り替えは行わない。
- `mise/config.toml` の `[tools]` の値は `docs/superpowers/specs/2026-07-15-asdf-to-mise-migration-design.md` に記載の通り、既存の `asdf/tool-versions` のバージョンをそのまま引き継ぐ（`nodejs`→`node`, `golang`→`go` のみ名称変更）。
- `default-npm-packages` の `@antfu/ni` は `ni` ツール（`backends = ["npm:@antfu/ni"]`）と重複するため `mise/config.toml` には含めない。
- TOML構文検証には `yq -p toml . <file>`（インストール済み、`/opt/homebrew/bin/yq` v4.53.3）を使う。fish構文検証には `fish -n <file>`（インストール済み、`/opt/homebrew/bin/fish` v4.8.1）を使う。
- 各タスクの最後に該当ファイルのみを `git add` してコミットする（`git add -A` は使わない）。

---

### Task 1: `mise/config.toml` を作成し `asdf/` ディレクトリを削除する

**Files:**
- Create: `mise/config.toml`
- Delete: `asdf/tool-versions`, `asdf/asdfrc`, `asdf/default-npm-packages`, `asdf/default-gems`（ディレクトリ `asdf/` ごと削除）

**Interfaces:**
- Produces: `mise/config.toml`（Task 3 の Makefile 更新が参照するファイルパス）

- [ ] **Step 1: `mise/config.toml` を作成する**

以下の内容で `mise/config.toml` を新規作成する。

```toml
[tools]
node = "24.13.0"
python = "3.11.9"
go = "1.25.7"
lua = "5.1"
pnpm = "10.28.0"
ruby = "3.4.5"
ni = "28.2.0"

"npm:@google/gemini-cli" = "latest"
"npm:@googleworkspace/cli" = "latest"
"npm:@kilocode/cli" = "latest"
"npm:agent-browser" = "latest"
"npm:firebase-tools" = "latest"
"npm:firecrawl-cli" = "latest"
"npm:markdownlint-cli2" = "latest"
"npm:opencode-ai" = "latest"

"gem:ruby-lsp" = "latest"
"gem:tmuxinator" = "latest"

[settings]
idiomatic_version_file_enable_tools = ["node", "python", "go", "lua", "pnpm", "ruby", "ni"]
```

- [ ] **Step 2: TOML構文を検証する**

Run: `yq -p toml . mise/config.toml`
Expected: エラーなく `tools:` と `settings:` のキーを含む YAML が出力される（終了コード0）。標準エラーへの `yq default output...` という警告は無視してよい。

- [ ] **Step 3: `asdf/` ディレクトリを削除する**

Run: `git rm -r asdf/`

- [ ] **Step 4: 削除を確認する**

Run: `test -d asdf && echo "STILL EXISTS" || echo "REMOVED"`
Expected: `REMOVED`

- [ ] **Step 5: コミットする**

```bash
git add mise/config.toml
git commit -m "$(cat <<'EOF'
feat: asdf設定をmise/config.tomlに置き換え

asdf/tool-versions, asdfrc, default-npm-packages, default-gems の内容を
mise/config.toml 1ファイルに統合。@antfu/ni は ni ツール（npm:@antfu/ni
backend）と重複するため default-npm-packages 側から除外。
EOF
)"
```

（`git rm -r asdf/` の削除は `git commit` 時に自動的にステージされているため、`git add mise/config.toml` と合わせて1コミットにまとまる）

---

### Task 2: `fish/config.fish` を mise 向けに書き換え、`fish/completions/asdf.fish` を削除する

**Files:**
- Modify: `fish/config.fish:126-140`
- Delete: `fish/completions/asdf.fish`

**Interfaces:**
- Consumes: なし（既存ファイルの書き換えのみ）

- [ ] **Step 1: `fish/config.fish` の asdf ブロックを置き換える**

`fish/config.fish` の以下の部分（126〜140行目）を

```fish
# for asdf (version manager)
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
# source (brew --prefix asdf)/libexec/asdf.fish
source (brew --prefix asdf)/share/fish/vendor_completions.d/asdf.fish
```

以下に置き換える。

```fish
# for mise (version manager)
mise activate fish | source
```

- [ ] **Step 2: fish構文を検証する**

Run: `fish -n fish/config.fish`
Expected: 出力なし、終了コード0（`echo $status` で確認: `fish -n fish/config.fish; echo $status` → `0`）

- [ ] **Step 3: `fish/completions/asdf.fish` を削除する**

Run: `git rm fish/completions/asdf.fish`

- [ ] **Step 4: asdf への参照が残っていないか確認する**

Run: `rg -i asdf fish/`
Expected: 何も出力されない（終了コード1）

- [ ] **Step 5: コミットする**

```bash
git add fish/config.fish
git commit -m "$(cat <<'EOF'
feat: fishのシェル統合をasdf shimsからmise activateに変更

手動のshims PATH追加処理と手動保守のasdf補完スクリプトを、
mise公式推奨の `mise activate fish | source` に置き換え。
mise は動的補完を内蔵するため独自の補完スクリプトは不要。
EOF
)"
```

---

### Task 3: `Makefile` を mise 向けに書き換える

**Files:**
- Modify: `Makefile:12`, `Makefile:18-23`, `Makefile:25-26`, `Makefile:69`, `Makefile:71-75`, `Makefile:80-81`

**Interfaces:**
- Consumes: `mise/config.toml`（Task 1 で作成済み）

- [ ] **Step 1: `install` ターゲットの依存リストを更新する**

`Makefile` の

```makefile
install: install/brew install/asdf install/python install/nvim install/fish install/git install/tmux install/ghostty install/claude install/vscode
```

を

```makefile
install: install/brew install/mise install/python install/nvim install/fish install/git install/tmux install/ghostty install/claude install/vscode
```

に置き換える。

- [ ] **Step 2: `install/asdf` ターゲットを `install/mise` に置き換える**

```makefile
install/asdf:
	ln -siv $(PWD)/asdf/tool-versions ~/.tool-versions
	ln -siv $(PWD)/asdf/asdfrc ~/.asdfrc
	ln -siv $(PWD)/asdf/default-npm-packages ~/.default-npm-packages
	ln -siv $(PWD)/asdf/default-gems ~/.default-gems
	asdf install
```

を（`ln -siv` などのタブインデントの行はリテラルのタブ文字であること）

```makefile
install/mise:
	mkdir -p ~/.config/mise
	ln -siv $(PWD)/mise/config.toml ~/.config/mise/config.toml
	mise install
```

に置き換える。

- [ ] **Step 3: `install/python` の `asdf which` を `mise which` に置き換える**

```makefile
install/python:
	uv pip install --python "$$(asdf which python)" --system -r $(PWD)/python/requirements.txt
```

を

```makefile
install/python:
	uv pip install --python "$$(mise which python)" --system -r $(PWD)/python/requirements.txt
```

に置き換える。

- [ ] **Step 4: `export` ターゲットの依存リストを更新する**

```makefile
export: export/brew export/asdf export/python export/vscode
```

を

```makefile
export: export/brew export/mise export/python export/vscode
```

に置き換える。

- [ ] **Step 5: `export/asdf` ターゲットを `export/mise` に置き換える**

```makefile
export/asdf:
	cp ~/.tool-versions $(PWD)/asdf/tool-versions
	cp ~/.asdfrc $(PWD)/asdf/asdfrc
	cp ~/.default-npm-packages $(PWD)/asdf/default-npm-packages
	cp ~/.default-gems $(PWD)/asdf/default-gems
```

を

```makefile
export/mise:
	cp ~/.config/mise/config.toml $(PWD)/mise/config.toml
```

に置き換える。

- [ ] **Step 6: `export/python` の `asdf which` を `mise which` に置き換える**

```makefile
export/python:
	uv pip freeze --python "$$(asdf which python)" > $(PWD)/python/requirements.txt
```

を

```makefile
export/python:
	uv pip freeze --python "$$(mise which python)" > $(PWD)/python/requirements.txt
```

に置き換える。

- [ ] **Step 7: Makefile の構文とターゲットを検証する**

Run: `make -n install/mise`
Expected:
```
mkdir -p ~/.config/mise
ln -siv /Users/simorgh3196/dotfiles/.claude/worktrees/asdf-to-mise/mise/config.toml ~/.config/mise/config.toml
mise install
```
（`$(PWD)` は実際の作業ディレクトリパスに展開される）

Run: `make -n export/mise`
Expected:
```
cp ~/.config/mise/config.toml /Users/simorgh3196/dotfiles/.claude/worktrees/asdf-to-mise/mise/config.toml
```

Run: `make -n install/python`
Expected: `uv pip install --python "$(mise which python)" --system -r <PWD>/python/requirements.txt` を含む行（`asdf` の文字列を含まないこと）

- [ ] **Step 8: asdf への参照が残っていないか確認する**

Run: `rg -i asdf Makefile`
Expected: 何も出力されない（終了コード1）

- [ ] **Step 9: コミットする**

```bash
git add Makefile
git commit -m "$(cat <<'EOF'
feat: Makefileのインストール/エクスポート対象をasdfからmiseに変更

install/asdf, export/asdf を install/mise, export/mise に置き換え、
install/python, export/python 内の `asdf which python` を
`mise which python` に置き換え。
EOF
)"
```

---

### Task 4: `brew/Brewfile` を更新する

**Files:**
- Modify: `brew/Brewfile:22`

- [ ] **Step 1: `brew "asdf"` を `brew "mise"` に置き換える**

`brew/Brewfile` の

```ruby
brew "asdf"
```

を

```ruby
brew "mise"
```

に置き換える。

- [ ] **Step 2: 確認する**

Run: `rg -n 'brew "(asdf|mise)"' brew/Brewfile`
Expected: `brew "mise"` の行のみが出力される（`brew "asdf"` は出力されない）

- [ ] **Step 3: コミットする**

```bash
git add brew/Brewfile
git commit -m "feat: Brewfileのパッケージをasdfからmiseに変更"
```

---

### Task 5: `README.md` を更新する

**Files:**
- Modify: `README.md:20`, `README.md:36`

- [ ] **Step 1: 構成表の asdf 行を更新する**

`README.md` の

```markdown
| `asdf` | ランタイムのバージョン管理（.tool-versions） |
```

を

```markdown
| `mise` | ランタイムのバージョン管理（mise/config.toml） |
```

に置き換える。

- [ ] **Step 2: `make export` の説明文を更新する**

`README.md` の

```markdown
make export   # brew / asdf / python / vscode を書き出し
```

を

```markdown
make export   # brew / mise / python / vscode を書き出し
```

に置き換える。

- [ ] **Step 3: 確認する**

Run: `rg -i asdf README.md`
Expected: 何も出力されない（終了コード1）

- [ ] **Step 4: コミットする**

```bash
git add README.md
git commit -m "docs: READMEの構成表とexport手順をmise向けに更新"
```

---

### Task 6: 最終確認

**Files:** なし（検証のみ）

- [ ] **Step 1: リポジトリ全体で asdf への参照が残っていないか確認する**

Run: `rg -il asdf --glob '!.claude' --glob '!.git' .`
Expected: 何も出力されない（終了コード1）。もし出力があれば、意図的に残す理由がない限り該当ファイルを修正して再コミットする。

- [ ] **Step 2: mise 関連ファイルが揃っていることを確認する**

Run: `git show --stat HEAD~5..HEAD`
Expected: Task 1〜5 の5コミットが `mise/config.toml` の追加、`asdf/` 配下4ファイルの削除、`fish/config.fish` の変更、`fish/completions/asdf.fish` の削除、`Makefile`・`brew/Brewfile`・`README.md` の変更を含むことを確認する。

- [ ] **Step 3: 最終状態を確認する**

Run: `git status`
Expected: `nothing to commit, working tree clean`
