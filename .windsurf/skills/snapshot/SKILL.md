---
name: snapshot
description: >
  Generates a structured, copy-paste-ready summary of the current session whenever
  the user types "/snapshot". Trigger immediately on "/snapshot" in any message.
  Also trigger for variations like "/recap", "/summary", "/handoff", "/context" or
  requests like "summarize the session", "what have we done", "export context",
  "catch me up", or "prepare context for a new chat".
---

# Snapshot — `/snapshot`

## What this skill does

When the user types `/snapshot`, read the entire conversation and produce a single
copy-pasteable block that preserves all critical context — so they can open a new
chat and pick up exactly where they left off, without re-explaining anything.

---

## How to generate the snapshot

### Step 1 — Read the full conversation
Scan every message before writing a single word of output.

### Step 2 — Extract critical elements
Look for:
- **Project context**: name, stack, language, frameworks, environment, repo
- **Main goal**: what was being built or solved
- **Key decisions**: architecture choices, libraries picked, alternatives rejected and why
- **Essential code**: central functions, data structures, configs, API contracts
- **Problems & fixes**: bugs hit, errors seen, workarounds applied
- **Current state**: what's working, what's broken, what's untouched
- **Next steps**: anything explicitly agreed upon or left pending
- **Sensitive data screening**: STRICTLY IDENTIFY AND IGNORE all API keys, access tokens, passwords, and sensitive credentials.

### Step 3 — Write the output block

Use **exactly** this format — no extra commentary before or after:

~~~
## 📸 Session Snapshot

**Project:** [name / one-line description]
**Stack:** [languages, frameworks, key tools]
**Goal:** [what was being built or solved]

---

### What we did

• [Bullet 1 — critical decision or action, self-contained with enough context to never need re-asking]
• [Bullet 2 — ...]
• [Bullet 3 — ...]
• [Bullet 4 — ...]
• [Bullet 5 — ...] ← minimum 5
• [Bullet 6 — ...] ← include if there's relevant content
• [Bullet 7 — ...] ← include if there's relevant content

---

### Current state
[2–4 lines: what's working, what's pending, what's broken]

---

### Essential code
```[language]
[Only the most critical snippet — key function, data structure, config, or API shape.
Omit this section entirely if no code is relevant.]
```

---

### Security Note
[Include ONLY IF sensitive data like API keys/tokens were shared in the session but skipped:]
> ⚠️ **Notice:** Chaves sensíveis (API keys, tokens, etc.) foram compartilhadas na sessão original, mas foram ignoradas e removidas na criação deste snapshot por motivos de segurança.

---

### Agreed next steps
• [Next step 1]
• [Next step 2]

---
> Paste this block at the top of your next chat to continue right where you left off.
~~~

---

## Quality rules

- **Every bullet must be self-contained** — someone reading it cold should have full context, no guessing.
- **Be specific** — use real file names, function names, variable names, error messages. Never generalize.
- **Decisions need reasons** — if something was rejected, say why (e.g., "dropped Redux for Zustand — too much boilerplate for this scope").
- **Code only if essential** — don't paste everything; only what a new chat would need to avoid rework.
- **No filler** — never write "we did several interesting things". Be direct and dense.
- **Privacy first** — NEVER include API keys, passwords, or sensitive credentials in the snapshot.
- **Match the user's language** — if they wrote in Portuguese, snapshot in Portuguese. If English, English.
- **Bullet length** — 1–3 lines each. No sub-bullets.

---

## Short session handling

If the session has fewer than 3 meaningful exchanges or no substantial technical content, respond with:

> "The session is too short for a useful snapshot yet. Keep working and run `/snapshot` again when there's more to capture."

---

## Example: bad bullet vs. good bullet

❌ Bad:
> • We worked on authentication and fixed some issues.

✅ Good:
> • Implemented JWT auth with refresh tokens — access token expires in 15min, refresh in 7 days. Refresh token is stored in an `httpOnly` cookie (not localStorage) to prevent XSS. Refresh endpoint is `POST /api/auth/refresh`. Rejected session-based auth because the app is stateless.
