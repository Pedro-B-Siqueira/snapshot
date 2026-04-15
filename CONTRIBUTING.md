# Contributing to Snapshot

## Repository structure

```
snapshot/
├── README.md                      # User-facing documentation
├── SKILL.md                       # Detailed skill guide
├── MARKETPLACE_SETUP.md           # How to register/publish
├── CONTRIBUTING.md                # This file
├── snapshot.skill                 # Skill definition
├── .claude-plugin/
│   └── marketplace.json           # Marketplace configuration
├── package.json                   # NPM metadata
├── LICENSE                        # MIT License
└── .gitignore                     # Git ignore rules
```

## File explanations

### snapshot.skill

The skill definition. Uses YAML frontmatter + markdown.

**Format:**
```
---
name: snapshot
displayName: Snapshot
version: 1.0.0
description: [one-liner]
---

# Documentation
```

When updating, increment `version` using semantic versioning (MAJOR.MINOR.PATCH).

### .claude-plugin/marketplace.json

Configuration for Claude Code marketplace registration.

**Key fields:**
- `name` — lowercase identifier (used in install commands)
- `version` — must match snapshot.skill version
- `skills` — array of skill definitions with paths

Keep this in sync with snapshot.skill version.

### SKILL.md

Detailed documentation shown when users install the skill.

**Sections:**
- How it works (overview)
- Quality standards (rules Claude follows)
- Use cases (when to use)
- Troubleshooting (common issues)
- Tips (best practices)

### package.json

NPM metadata. Optional but recommended for discoverability.

Update `version` to match snapshot.skill when releasing.

---

## Making updates

### 1. Update the skill logic

Edit `snapshot.skill` YAML frontmatter or documentation.

### 2. Bump the version

Update in 3 places:
- `snapshot.skill` — `version: X.Y.Z`
- `.claude-plugin/marketplace.json` — `"version": "X.Y.Z"`
- `package.json` — `"version": "X.Y.Z"`

### 3. Update documentation

If behavior changed, update:
- `SKILL.md` — detailed guide
- `README.md` — user-facing docs

### 4. Commit and push

```bash
git add .
git commit -m "feat: [description of change] (v1.1.0)"
git push origin main
```

### 5. Tag release (optional but recommended)

```bash
git tag -a v1.1.0 -m "Version 1.1.0"
git push origin v1.1.0
```

The marketplace will auto-detect the new version within 5-10 minutes.

---

## Testing your changes

### Before publishing

1. **Syntax validation**: Ensure snapshot.skill is valid YAML + markdown
2. **JSON validation**: Check `.claude-plugin/marketplace.json` is valid JSON
3. **Test install**: Try the full install flow yourself
4. **Manual test**: Run `/snapshot` in Claude Code and verify output quality

### Example test flow

```bash
# Install locally
cp -r . ~/.claude/plugins/snapshot-dev

# Test in Claude Code
# (type /snapshot, verify it works)

# If OK, push to GitHub
git push origin main
```

---

## Release checklist

- [ ] Update version in all 3 places
- [ ] Update SKILL.md if behavior changed
- [ ] Update README.md if user-facing docs changed
- [ ] Verify snapshot.skill is valid YAML
- [ ] Verify marketplace.json is valid JSON
- [ ] Test locally in Claude Code
- [ ] Commit with descriptive message
- [ ] Push to main
- [ ] (Optional) Tag the release
- [ ] Wait 5-10 min for marketplace sync

---

## Version numbering

Follow semantic versioning (MAJOR.MINOR.PATCH):

- **MAJOR** (1.0.0 → 2.0.0): Breaking changes or major new features
- **MINOR** (1.0.0 → 1.1.0): New features, backward compatible
- **PATCH** (1.0.0 → 1.0.1): Bug fixes, documentation

---

## Code style guidelines

### snapshot.skill

- Use clear, concise markdown
- Examples should be copy-paste ready
- Avoid vague language ("stuff", "things", "basically")
- Be specific with file paths, function names, error messages

### Documentation

- Write for beginners — explain jargon
- Use active voice
- Keep sentences short
- Use headers to organize content

---

## Questions or issues?

Open a GitHub issue or reach out to the maintainer.

---

**Happy snapshotting!** 📸
