#!/bin/bash
# PreToolUse(Bash) hook: grep の使用を検知して deny し、rg (ripgrep) を促す。
# 除外: git grep / pgrep / zgrep など（コマンド語としての grep/egrep/fgrep のみ検知）
export PATH="/opt/homebrew/bin:/usr/bin:/bin:$PATH"

cmd=$(jq -r '.tool_input.command // ""')

uses_grep() {
  printf '%s\n' "$cmd" | grep -qE '(^|[|;&(`]|\$\(|[[:space:]])(command[[:space:]]+)?[ef]?grep([[:space:]]|$)'
}
is_git_grep() {
  printf '%s\n' "$cmd" | grep -qE 'git[[:space:]]+([^|;&()]*[[:space:]])?grep'
}

if uses_grep && ! is_git_grep; then
  printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"grep ではなく rg (ripgrep) を使ってください（例: rg -n \"pattern\" path/、パイプ: ... | rg \"pattern\"）。git grep はそのまま使用可。"}}'
fi
exit 0
