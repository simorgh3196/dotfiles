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
| `asdf` | ランタイムのバージョン管理（.tool-versions） |
| `fish` | fish shell の設定・関数・補完 |
| `tmux` | tmux 設定（TPM プラグイン / Tokyo Night テーマ） |
| `ghostty` | Ghostty ターミナル設定 |
| `nvim` | Neovim（LazyVim ベース） |
| `git` | gitconfig / gitignore_global |
| `vscode` | VS Code 設定・拡張機能リスト |
| `python` | グローバル Python パッケージ（requirements.txt） |

Claude Code などの AI ツール設定と自作スクリプトは、公開する必要がないため private リポジトリ（`dotfiles-private`）で管理する。

## ローカル設定の書き出し

ローカルの現状をリポジトリに反映してからコミットする。

```shell
make export   # brew / asdf / python / vscode を書き出し
```

## シークレットの扱い

API キーやトークンは**リポジトリにコミットしない**。1Password CLI（`op read` / `op run`）で実行時に注入する。
`fish/fish_variables` はマシン固有の状態（シークレットを含みうる）のため Git 管理外。

## Screen Shot

| terminal | nvim |
| --- | --- |
| ![screenshot-terminal](/docs/screenshot-terminal.png) | ![screenshot-nvim](/docs/screenshot-nvim.png) |
