#!/bin/bash
# PreToolUse(Bash) hook: cursor-agent CLI を「読み取り専用」用途に限定する。
# - 承認ゲートを無効化するフラグ（--force / --yolo / 単独の -f）は常に deny。
#   これらは cursor-agent がシェルコマンドを Claude Code の権限システム/フックの
#   管理外で実行できるようにしてしまうため。
# - ヘッドレス実行（-p / --print）は --mode ask または --mode plan を伴う場合のみ許可。
#   cursor-agent -p は --force を付けなくてもファイルを書き込むことが確認されているため。
# - --trust はワークスペースを信頼済みにするだけでコマンド実行権限は与えないため許可する。
export PATH="/opt/homebrew/bin:/usr/bin:/bin:$PATH"

cmd=$(jq -r '.tool_input.command // ""')

uses_cursor_agent() {
  printf '%s\n' "$1" | grep -qE '(^|[|;&(`]|\$\(|[[:space:]])cursor-agent([[:space:]]|$)'
}

has_force_flag() {
  printf '%s\n' "$1" | grep -qE '(^|[[:space:]])(--force|--yolo|-f)([[:space:]=]|$)'
}

is_headless() {
  printf '%s\n' "$1" | grep -qE '(^|[[:space:]])(-p|--print)([[:space:]]|$)'
}

has_readonly_mode() {
  printf '%s\n' "$1" | grep -qE '(^|[[:space:]])--mode[[:space:]=](ask|plan)([[:space:]]|$)'
}

deny() {
  jq -nc --arg r "$1" '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:$r}}'
  exit 0
}

# コマンド全体ではなく、cursor-agent を実際に起動しているシェルセグメントだけを検査する。
# `;` `|` `&` 改行で区切ることで、`test -f`・`rm -rf`・`tail -f` 等の無関係なセグメントに
# 含まれる裸の -f トークンを誤検知しないようにする。
while IFS= read -r seg; do
  uses_cursor_agent "$seg" || continue

  if has_force_flag "$seg"; then
    deny "cursor-agent は承認ゲート（各アクションごとの実行確認）を無効化するオプション（--force, --yolo, -f）付きで実行してはいけません。これらを付けると cursor-agent は Claude Code の権限システムやフックの監視外で任意のシェルコマンドを実行できてしまうため、常に拒否します。"
  fi

  if is_headless "$seg" && ! has_readonly_mode "$seg"; then
    deny "cursor-agent -p（ヘッドレス/print モード）は --force を付けなくてもファイルをディスクに書き込むことが確認されています。読み取り専用で使うには --mode ask または --mode plan を明示的に指定してください。"
  fi
done < <(printf '%s\n' "$cmd" | tr ';|&\n' '\n\n\n\n')

exit 0
