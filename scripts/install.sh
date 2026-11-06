#!/bin/sh
set -eu
agent=${1:-claude}
case "$agent" in
  claude) default_dir="$HOME/.claude/skills" ;;
  codex) default_dir="$HOME/.codex/skills" ;;
  *) printf '%s\n' 'Usage: sh scripts/install.sh [claude|codex]' >&2; exit 2 ;;
esac
base=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
skills_dir=${WRITING_VOICE_SKILLS_DIR:-$default_dir}
target="$skills_dir/writing-voice"
if [ -e "$target" ] && [ "${FORCE:-0}" != 1 ]; then
  printf '%s\n' "Already exists: $target. Review before retrying with FORCE=1." >&2
  exit 1
fi
mkdir -p "$target"
cp "$base/writing-voice/SKILL.md" "$target/SKILL.md"
printf '%s\n' "Installed: $target/SKILL.md" 'Persistent instructions and worker propagation require separate configuration.'
