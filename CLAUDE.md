# CLAUDE.md — snapshot

## Single source of truth

| File | Controls |
|------|----------|
| `skills/snapshot/SKILL.md` | Skill behavior — the full prompt and output format |
| `rules/snapshot-activate.md` | Always-on rule body synced to all agents by CI |

**Never edit agent-specific copies directly.** They are overwritten by CI on every push to master.

## Auto-synced files (do not edit)

| File | Synced from |
|------|-------------|
| `.cursor/skills/snapshot/SKILL.md` | `skills/snapshot/SKILL.md` |
| `.windsurf/skills/snapshot/SKILL.md` | `skills/snapshot/SKILL.md` |
| `snapshot.skill` | ZIP of `skills/snapshot/` |
| `.clinerules/snapshot.md` | `rules/snapshot-activate.md` |
| `.github/copilot-instructions.md` | `rules/snapshot-activate.md` |
| `.cursor/rules/snapshot.mdc` | `rules/snapshot-activate.md` + Cursor frontmatter |
| `.windsurf/rules/snapshot.md` | `rules/snapshot-activate.md` + Windsurf frontmatter |
