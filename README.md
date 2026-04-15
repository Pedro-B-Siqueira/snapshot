# 📸 snapshot

> A Claude Code skill that freezes your session into a copy-pasteable context block — so you never lose progress when starting a new chat.

---

## The problem

Claude Code sessions are stateless. Every time you hit a token limit or open a fresh chat, you're back to square one — re-explaining your stack, your decisions, why you rejected that library, what's broken, what's not. It's friction that kills flow.

## The fix

Type `/snapshot` at any point. Claude reads the entire session and generates a structured block you can paste directly into a new chat. New chat picks up exactly where the old one left off.

```
## 📸 Session Snapshot

**Project:** auth-service — JWT-based authentication microservice
**Stack:** Node.js, Fastify, Prisma, PostgreSQL, Redis
**Goal:** Add refresh token rotation with httpOnly cookie storage

---

### What we did

• Implemented JWT auth with refresh tokens — access token expires in 15min, refresh in 7 days.
  Stored in httpOnly cookie (not localStorage) to prevent XSS. Endpoint: POST /api/auth/refresh.

• Rejected session-based auth — app is stateless and needs to scale horizontally across pods.
  Redis is only used for refresh token blocklist (revocation), not session storage.

• Fixed a Prisma transaction bug where refresh token rotation was creating a race condition
  under concurrent requests. Solved with SELECT FOR UPDATE on the token record.

• ...

---

### Current state
Refresh token rotation is working in local dev. Redis blocklist integration is done.
Still need to write integration tests and handle the edge case where both tokens expire simultaneously.

---

### Agreed next steps
• Write integration tests for the refresh flow
• Handle simultaneous expiry edge case
```

---

## Install

Make sure you have [Claude Code](https://claude.ai/code) installed, then run:

```bash
claude skill install https://github.com/Pedro-B-Siqueira/snapshot/raw/main/snapshot.skill
```

Or install from a local file:

```bash
# Download the .skill file from releases, then:
claude skill install snapshot.skill
```

---

## Usage

Just type `/snapshot` anywhere in a Claude Code session:

```
/snapshot
```

Claude will immediately read the full conversation and output a formatted snapshot block. Copy it, open a new chat, paste it at the top, and continue.

**Also works with:**
- `/recap`
- `/handoff`
- `/context`
- "summarize the session"
- "export context for a new chat"

---

## What gets captured

| Section | What's included |
|---|---|
| **Project** | Name, one-line description |
| **Stack** | Languages, frameworks, tools |
| **Goal** | What was being built or solved |
| **What we did** | 5–7 self-contained bullets: decisions, fixes, tradeoffs |
| **Current state** | What's working, what's pending, what's broken |
| **Essential code** | Only the most critical snippet (omitted if not relevant) |
| **Next steps** | Anything agreed upon or left pending |

Every bullet is written to be **self-contained** — someone reading cold has full context without needing the original conversation.

---

## Why bullets, not a paragraph?

Because when you paste context into a new chat, Claude needs to parse it fast and accurately. Dense, specific bullets are easier to reason over than prose. Each bullet carries a decision **and its reason** — so the new session doesn't revisit settled questions.

---

## Also available on

[skills.sh/snapshot](https://skills.sh) — the open registry for Claude Code skills.

---

## License

MIT
