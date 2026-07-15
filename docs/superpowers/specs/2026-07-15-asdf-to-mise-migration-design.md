# asdf → mise 移行設計

## 背景・目的

dotfiles リポジトリのランタイムバージョン管理を asdf から [mise](https://mise.jdx.dev/) に移行する。対象はリポジトリ内の設定ファイルのみで、このマシン上での実際のインストール切り替え（`brew install mise` の実行や `asdf` のアンインストール、`mise install` の実行）は本設計のスコープ外とする。ユーザーが後で `make install` を実行して適用する。

## 現状（asdf）

- `asdf/tool-versions`: nodejs, python, golang, lua, pnpm, ruby, ni の7ツールのバージョンを定義
- `asdf/asdfrc`: `legacy_version_file = yes`（`.nvmrc` 等ネイティブなバージョンファイルの読み込みを許可）
- `asdf/default-npm-packages`: グローバル npm パッケージ9個（`@antfu/ni` を含む）
- `asdf/default-gems`: グローバル gem パッケージ2個（ruby-lsp, tmuxinator）
- `fish/config.fish`: shims を手動で PATH に追加 + asdf の補完スクリプトを source
- `fish/completions/asdf.fish`: 手動保守の補完スクリプト（約140行）
- `Makefile`: `install/asdf` / `export/asdf` ターゲット、`install/python` / `export/python` 内で `asdf which python` を使用
- `brew/Brewfile`: `brew "asdf"`
- `README.md`: 構成表・export手順に asdf の記載

## 調査で判明した事実

- mise の公式レジストリで、現行7ツールはすべて追加プラグイン登録なしで短縮名として使用可能（`nodejs`→`node`、`golang`→`go` は名称変更、他は同名）
- `ni` は mise レジストリ上で `backends = ["npm:@antfu/ni"]` として定義されており、`ni` を `[tools]` に加えるだけで `@antfu/ni` の npm パッケージ相当が導入される。そのため `default-npm-packages` 側の `@antfu/ni` は重複であり不要
- mise には asdf の `default-npm-packages` / `default-gems` に相当する専用ファイルはないが、`"npm:<pkg>" = "latest"` / `"gem:<pkg>" = "latest"` を `[tools]` に列挙することで同等の効果が得られる。この方式は mise が管理する node バージョンとは独立した実行環境で各パッケージを保持するため、node バージョンを切り替えてもツールが壊れない（asdf の `default-npm-packages` post-install hook や、検討した Vite+ の `vp install -g` と同種の性質を持つ）
- asdf の `legacy_version_file = yes` に相当するのは mise の `idiomatic_version_file_enable_tools` 設定（mise はデフォルトで無効なため明示的な有効化が必要）
- fish 向けの推奨シェル統合は `mise activate fish | source` の1行。mise は動的補完を内蔵しているため、asdf のような手動保守の補完スクリプトは不要

## 検討したが不採用の案

**Vite+ (`vp`) によるグローバル npm パッケージ管理**: `vp install -g` は `VP_HOME/packages` 配下で Node バージョンに依存しない形でパッケージを管理できる機能を持つが、Vite+ 自体が Node.js ランタイム管理機能を持つ別ツール（2026年発表のベータ版）であり、mise と役割が重複する。mise の `npm:` バックエンドだけで同じ「Node バージョンに依存しない」性質を満たせるため、今回の移行スコープでは不採用とした。

**シェル統合方式の shims / 併用案**: `mise activate --shims`（asdf 同様の shim 方式）や activate + shims 併用も検討したが、`mise activate fish`（インタラクティブシェルでの動的 PATH/env 管理、mise 公式推奨）を採用する。

## 設計

### 1. ディレクトリ構成

`asdf/`（tool-versions, asdfrc, default-npm-packages, default-gems の4ファイル）を削除し、`mise/config.toml` 1ファイルに集約する。

### 2. `mise/config.toml`

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

### 3. `fish/config.fish`

`asdf` 用の shims PATH 追加処理（15行程度）と補完スクリプトの source 行を削除し、以下に置き換える。

```fish
# for mise (version manager)
mise activate fish | source
```

`fish/completions/asdf.fish` は削除する。

### 4. `Makefile`

- `install/asdf` → `install/mise`: `~/.config/mise/config.toml` へのシンボリックリンク作成 + `mise install`
- `export/asdf` → `export/mise`: `~/.config/mise/config.toml` を `mise/config.toml` にコピー
- `install/python` / `export/python`: `asdf which python` → `mise which python`
- `install` / `export` ターゲットの依存リストを更新

### 5. `brew/Brewfile`

`brew "asdf"` → `brew "mise"`

### 6. `README.md`

構成表の `asdf` 行と `make export` の説明文を mise 向けに更新。

## テスト・検証方針

このマシンに実際に mise をインストールする作業はスコープ外のため、ランタイム動作確認は行わない。代わりに以下を確認する。

- `mise/config.toml` が有効な TOML であること
- Makefile の対象ターゲット（`install/mise`, `export/mise`, `install/python`, `export/python`）が asdf への参照を含まないこと
- リポジトリ全体で asdf への参照が残っていないこと（意図的に残すものがあれば明記）
