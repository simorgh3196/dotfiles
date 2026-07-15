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

## 構成

| ディレクトリ | 内容 |
| --- | --- |
| `brew` | Homebrew パッケージ（Brewfile） |
| `asdf` | ランタイムのバージョン管理（.tool-versions） |
| `fish` | fish shell の設定・関数・補完 |
| `ghostty` | Ghostty ターミナル設定 |
| `herdr` | herdr（ターミナルワークスペースマネージャー）設定 |
| `nvim` | Neovim（LazyVim ベース） |
| `git` | gitconfig / gitignore_global |
| `claude` | Claude Code 設定・フック・ステータスライン |
| `vscode` | VS Code 設定・拡張機能リスト |
| `bin` | 自作スクリプト |
| `python` | グローバル Python パッケージ（requirements.txt） |

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
