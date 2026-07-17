# 新しい Mac への移行

2つのリポジトリと、**手でコピーしないと永久に失われるもの**に分かれる。

## 1. リポジトリで再現されるもの（clone → make install）

| リポジトリ | 内容 |
| --- | --- |
| [dotfiles](https://github.com/simorgh3196/dotfiles)（公開） | fish / tmux / nvim / git / ghostty / vscode / Brewfile / .tool-versions / Claude Code 一式（settings / CLAUDE.md / サブエージェント / フック） |
| [skills](https://github.com/simorgh3196/skills)（公開） | 自作の Agent Skills（codex-imagegen）。clone せず `make install/skills` で入れる |

スキルはすべて `cd ~/dotfiles && make install/skills` で復元する（自作の simorgh3196/skills も third-party もまとめて [vercel の skills](https://github.com/vercel-labs/skills) の `npx skills add <repo> -g -a claude-code universal` で導入。Claude Code の `~/.claude/skills` と、Cursor / Codex などが読む汎用の `~/.agents/skills` の両方に入る）。

## 2. 手でコピーが必要なもの（最重要）

### memory（最優先・再現不可能）

`~/.claude/projects/<パス>/memory/` に蓄積された知見。**業務プロジェクトの内容を含むため、private リポジトリにもコミットしない**。

```shell
# 旧マシン
cd ~/.claude/projects && tar czf ~/claude-memory.tgz */memory

# 新マシン
tar xzf ~/claude-memory.tgz -C ~/.claude/projects
```

> [!WARNING]
> **ディレクトリ名は cwd のパスをエンコードしたもの**（`/Users/foo/dotfiles` → `-Users-foo-dotfiles`）。
> **新マシンのユーザー名やリポジトリの配置が変わると memory は一切読まれなくなる**（孤児化）。
> 対策は次のいずれか:
> - 新マシンのユーザー名を旧マシンと揃える（最も安全）
> - リポジトリは `ghq get` で `~/go/src/...` の同じパスに配置する
> - ユーザー名が変わる場合はディレクトリ名を一括リネームする:
>   ```bash
>   cd ~/.claude/projects
>   for d in -Users-OLDNAME-*; do mv "$d" "${d/-Users-OLDNAME-/-Users-NEWNAME-}"; done
>   ```

### 過去の会話履歴（`--resume` で遡りたい場合のみ）

```shell
# 旧マシン（約 1GB）
tar czf ~/claude-projects.tgz -C ~/.claude projects

# 新マシン
tar xzf ~/claude-projects.tgz -C ~/.claude
```

memory だけで十分なら不要。上のリネーム注意はこちらにも同様に当てはまる。

### ユーザースコープの MCP サーバー

`~/.claude.json` の `mcpServers` に入っている。**このファイルを丸ごとコピーしない**（`machineID` / OAuth セッション / プロジェクトごとのローカル状態を含む）。`claude mcp add` で入れ直すか、`mcpServers` キーだけを移す。

### 公開できないスキル（手動コピー）

`tech-article-writing` は出所不明の拾い物のため、どのリポジトリにも入れていない。

```shell
# 旧マシン → 新マシン
tar czf ~/skill-backup.tgz -C ~/.claude/skills tech-article-writing
tar xzf ~/skill-backup.tgz -C ~/.claude/skills
```

### 環境変数（1Password から再投入）

- `CURSOR_API_KEY` — fish のユニバーサル変数。`composer-drafter` / `grok-adversary` エージェントが参照しており、**未設定だと `CURSOR_KEY_MISSING` で停止する**

## 3. コピーしてはいけないもの

| 対象 | 理由 |
| --- | --- |
| `~/.claude/.credentials.json` | OAuth トークン。新マシンで `claude` にログインし直す |
| `~/.claude.json`（丸ごと） | `machineID` / `userID` / ローカル状態が衝突する |
| `~/.claude/jobs`（約 5GB） | バックグラウンドジョブの作業ログ。キャッシュ |
| `~/.claude/security`, `telemetry`, `cache`, `shell-snapshots`, `session-env`, `file-history` | すべてローカルキャッシュ |
| `~/.claude/plugins`（約 21MB） | `settings.json` の `enabledPlugins` から自動再取得 |
| `fish/fish_variables` | マシン固有。旧マシンのゴミパスとシークレットを含む |

## 4. 手順まとめ

```shell
# 旧マシン
cd ~/.claude/projects && tar czf ~/claude-memory.tgz */memory
tar czf ~/skill-backup.tgz -C ~/.claude/skills tech-article-writing
# ~/claude-memory.tgz と ~/skill-backup.tgz を新マシンへ

# 新マシン
xcode-select --install
git clone https://github.com/simorgh3196/dotfiles.git ~/dotfiles
cd ~/dotfiles && make install
make install/skills   # 自作 + third-party スキルを npx skills で導入
claude   # ログイン
tar xzf ~/claude-memory.tgz -C ~/.claude/projects
tar xzf ~/skill-backup.tgz -C ~/.claude/skills
set -Ux CURSOR_API_KEY (op read "op://...")   # cursor 系エージェント用
```
