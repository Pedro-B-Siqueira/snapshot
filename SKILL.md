---
name: snapshot
displayName: Snapshot
version: 1.0.0
description: Never lose context. Always ship faster. Capture your entire development session in one /snapshot command.
author: Pedro B. Siqueira
repository: https://github.com/Pedro-B-Siqueira/snapshot
license: MIT
---

# Snapshot Skill — Complete Guide

## Overview

Snapshot captures your entire development session in a structured, copy-paste-ready format. One `/snapshot` command. No friction. Instant context handoff between chats.

---

## How it works

### Trigger the skill

```
/snapshot
```

### What happens

1. Claude reads your entire conversation history from this session
2. Extracts critical elements: decisions, implementations, problems, solutions
3. Generates a structured markdown document
4. Returns it ready to copy-paste into your next chat

### Output format

```markdown
## 📋 Session Context

**Project:** NextJS auth with JWT
**Stack:** React, Next.js, TypeScript, PostgreSQL
**Objective:** Implement secure authentication flow

---

### What we did

• Added JWT with 15min access token, 7d refresh token
• Moved refresh token to httpOnly cookie for security
• Fixed race condition in token refresh endpoint
• Built token rotation for additional security layer

---

### Current state

Auth endpoints working. Refresh flow tested. Need logout endpoint and tests.

---

### Code snippet

[Only critical code, if relevant]

---

### Next steps

• Implement logout endpoint that invalidates tokens
• Add integration tests for auth flow
```

---

## Quality standards

Every snapshot follows these rules:

### 1. Self-contained bullets

❌ Bad:
> • We worked on the auth thing and fixed some issues

✅ Good:
> • Implemented JWT with 15min access token expiry in /api/auth/login. Refresh token stored in httpOnly cookie (POST /api/auth/refresh) for security.

### 2. Specific details

Always include:
- Real file paths: `/app/auth/middleware.ts` not "some file"
- Real function names: `verifyRefreshToken()` not "the token function"
- Real error messages: "Cannot POST /api/auth/refresh" not "there was an error"
- Real decisions: "Chose httpOnly cookies over localStorage because [reason]"

### 3. Concise structure

- 5–7 bullets under "What we did"
- 2–4 sentences for "Current state"
- Code snippet only if critical (skip if 10+ lines or not essential)
- 2–3 items in "Next steps"

### 4. No filler language

Banned phrases:
- "We worked on..."
- "We did some stuff..."
- "It was interesting..."
- "Basically..."
- "Pretty much..."
- "Just..."
- "Really..."

---

## Common use cases

### Daily development handoff

End of workday:
```
/snapshot
```

Copy the output. Save to a markdown file or note app. Next day, paste at the top of a new chat. Resume immediately.

### Team context passing

Handing off to a teammate? Snapshot captures everything they need to know — no verbal sync required.

### Async collaboration

Pausing work for a day/week? Snapshot preserves full context. Come back anytime and understand exactly where you left off.

### Debug documentation

During bug hunting? Snapshot records what you've tried, what failed, and what worked. Useful for your own reference or sharing with others.

### Architecture decisions

Building something complex? Snapshot documents your design decisions and why you made each choice.

---

## What gets captured

✅ Included:
- All code written or discussed
- Architecture decisions and reasoning
- Problems encountered and solutions
- Testing approaches
- Library/framework choices
- File structure changes
- Error messages and fixes
- Performance considerations
- Security decisions

❌ Excluded:
- API keys, secrets, credentials
- Sensitive personal data
- Anything marked `[PRIVATE]`
- Chat metadata (timestamps, user IDs)
- Debugging noise (typos, false starts)

---

## Tips for better snapshots

### Before you run `/snapshot`

- **Summarize wins**: If you solved something, say it explicitly. Don't assume Claude remembers.
- **Name things**: Use real variable names, file paths, function names. Don't say "that thing".
- **Explain decisions**: When you chose one approach over another, say why.

### After you get the snapshot

- **Review it**: Does it make sense to someone reading it cold?
- **Edit if needed**: Feel free to trim, adjust, or reorganize.
- **Save it**: Wherever you keep project notes (GitHub, Notion, local markdown file).

---

## Troubleshooting

### "Session is too short"

Snapshot won't activate for very short sessions (less than 3 meaningful exchanges). Build up some context first, then run `/snapshot`.

### "Nothing technical in this session"

If the conversation has no code or technical substance, snapshot will decline. It's designed for development work.

### "Generated snapshot feels incomplete"

Snapshot works best when:
- You used specific language (real names, real errors)
- You explained decisions ("we chose X because Y")
- You tested or validated code

Vague conversations produce vague snapshots. Be explicit, get better snapshots.

---

## Customization

Want to modify the snapshot format? Edit the skill in Claude Code settings. You can:

- Change section names
- Add/remove sections
- Adjust emoji
- Modify template structure

The skill file is yours to customize.

---

## Philosophy

Most dev tools solve technical problems. Snapshot solves **friction**.

The friction of context loss between sessions. The friction of re-explaining. The friction of "wait, why did we decide that?"

It's small. It's boring. But it compounds. Every session using snapshot, you:
- Spend less time re-establishing context
- Make fewer context-switching mistakes
- Build better project memory
- Ship faster overall

That's the entire goal.

---

## Questions?

Check the main README for more info, or open an issue on GitHub.
