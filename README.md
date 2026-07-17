# Dotfiles

macOS 開発環境の設定ファイル一式。新しい Mac でも `make install` で同じ環境を再現する。

## セットアップ

```shell
xcode-select --install
git clone https://github.com/simorgh3196/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install        # すべてインストール
make install/nvim   # 個別インストール
```

新しい Mac へ移行する場合は [docs/new-machine.md](docs/new-machine.md) も参照（Claude Code の memory など、`make install` では復元されないものがある）。

## 構成

| ディレクトリ | 内容 |
| --- | --- |
| `brew` | Homebrew パッケージ（Brewfile） |
| `mise` | ランタイムのバージョン管理（mise/config.toml） |
| `fish` | fish shell の設定・関数・補完 |
| `ghostty` | Ghostty ターミナル設定 |
| `herdr` | herdr（ターミナルワークスペースマネージャー）設定 |
| `nvim` | Neovim（LazyVim ベース） |
| `git` | gitconfig / gitignore_global |
| `claude` | Claude Code 設定・CLAUDE.md・サブエージェント・フック |
| `vscode` | VS Code 設定・拡張機能リスト |
| `python` | グローバル Python パッケージ（requirements.txt） |

Agent Skills（自作の [skills リポジトリ](https://github.com/simorgh3196/skills) も third-party も）は `make install/skills`（[vercel の skills](https://github.com/vercel-labs/skills) 経由）でまとめて導入する。

## ローカル設定の書き出し

ローカルの現状をリポジトリに反映してからコミットする。

```shell
make export   # brew / mise / python / vscode を書き出し
```

## シークレットの扱い

API キーやトークンは**リポジトリにコミットしない**。1Password CLI（`op read` / `op run`）で実行時に注入する。
`fish/fish_variables` はマシン固有の状態（シークレットを含みうる）のため Git 管理外。

## Screen Shot

| terminal | nvim |
| --- | --- |
| ![screenshot-terminal](/docs/screenshot-terminal.png) | ![screenshot-nvim](/docs/screenshot-nvim.png) |
