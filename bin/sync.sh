#!/bin/bash
# Run this after editing skills/snapshot/SKILL.md or rules/snapshot-activate.md
set -e

SKILL="skills/snapshot/SKILL.md"
BODY="rules/snapshot-activate.md"

echo "Syncing SKILL.md to agent locations..."
cp "$SKILL" .cursor/skills/snapshot/SKILL.md
cp "$SKILL" .windsurf/skills/snapshot/SKILL.md

echo "Syncing rule to all agents..."
cp "$BODY" .clinerules/snapshot.md
cp "$BODY" .github/copilot-instructions.md

# Cursor — needs frontmatter
{
  echo '---'
  echo 'description: "Snapshot — capture session context on /snapshot for copy-paste handoff between chats"'
  echo 'alwaysApply: false'
  echo '---'
  echo ''
  cat "$BODY"
} > .cursor/rules/snapshot.mdc

# Windsurf — needs frontmatter
{
  echo '---'
  echo 'trigger: manual'
  echo '---'
  echo ''
  cat "$BODY"
} > .windsurf/rules/snapshot.md

echo "Rebuilding snapshot.skill..."
zip -r snapshot.skill skills/snapshot/

echo "Done. Please review your changes and commit manually."
