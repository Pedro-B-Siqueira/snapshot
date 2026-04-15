<p align="center">
  <span style="font-size: 100px;">📸</span>
</p>

<h1 align="center">snapshot</h1>

<p align="center">
  <strong>never lose context. always ship faster.</strong>
</p>

<p align="center">
  <a href="https://github.com/Pedro-B-Siqueira/snapshot/stargazers"><img src="https://img.shields.io/github/stars/Pedro-B-Siqueira/snapshot?style=flat&color=4F46E5" alt="Stars"></a>
  <a href="https://github.com/Pedro-B-Siqueira/snapshot/commits/master"><img src="https://img.shields.io/github/last-commit/Pedro-B-Siqueira/snapshot?style=flat&color=4F46E5" alt="Last Commit"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/Pedro-B-Siqueira/snapshot?style=flat&color=4F46E5" alt="License"></a>
</p>

<p align="center">
  <a href="#what-is-snapshot">What is it</a> •
  <a href="#before--after">Before/After</a> •
  <a href="#install">Install</a> •
  <a href="#usage">Usage</a> •
  <a href="#what-gets-captured">What gets captured</a> •
  <a href="#faq">FAQ</a>
</p>

---

## What is snapshot?

Every development session builds context. Context gets lost between chats. You restart. You explain everything again. Your brain cycles backwards instead of forwards.

**Snapshot captures your entire session in one command.** One `/snapshot`. Structured. Copy-paste ready. No friction.

Think of it like a save-game for your development workflow.

---

## Before / After

<table>
<tr>
<td width="50%">

### 😩 Without snapshot

**You type something like:**
> "hey so last session i was building this auth feature for a nextjs app. we had some issues with jwt tokens and i think we decided to use httpOnly cookies. also we were trying to figure out the refresh token expiry time and there was this bug where... wait what was the bug again?"

**Next chat wastes 3–5 messages re-explaining:**
- What you were building
- Which stack/frameworks
- What problems you hit
- What decisions you made
- Where you left off

</td>
<td width="50%">

### ✨ With snapshot

**You type:** `/snapshot`

**Claude returns:**
```
## 📸 Session Snapshot

**Project:** NextJS auth with JWT + refresh tokens
**Stack:** React, Next.js, TypeScript, PostgreSQL
**Goal:** Implement secure auth flow

### What we did
• Added JWT with 15min access token, 7d refresh token
• Moved refresh token to httpOnly cookie (not localStorage)
  to prevent XSS — rejected localStorage after security review
• Fixed race condition in token refresh endpoint using
  SELECT FOR UPDATE on the token record
• Rejected session-based auth — app is stateless, needs
  horizontal scaling across pods

### Current state
Auth flow working. Redis blocklist integrated.
Still need logout endpoint and integration tests.

### Agreed next steps
• Add logout endpoint that invalidates refresh tokens
• Write integration tests for the refresh flow
```

**Next chat starts immediately.** No context debt.

</td>
</tr>
</table>

---

## Install

Pick your agent. One command. Done.

| Agent | Install |
|-------|---------|
| **Claude Code** | `claude plugin marketplace add Pedro-B-Siqueira/snapshot && claude plugin install snapshot@snapshot` |
| **Gemini CLI** | `gemini extensions install https://github.com/Pedro-B-Siqueira/snapshot` |
| **Cursor** | `npx skills add Pedro-B-Siqueira/snapshot -a cursor` |
| **Windsurf** | `npx skills add Pedro-B-Siqueira/snapshot -a windsurf` |
| **Copilot** | `npx skills add Pedro-B-Siqueira/snapshot -a github-copilot` |
| **Cline** | `npx skills add Pedro-B-Siqueira/snapshot -a cline` |
| **Any other** | `npx skills add Pedro-B-Siqueira/snapshot` |

### Manual install

```bash
git clone https://github.com/Pedro-B-Siqueira/snapshot.git
cp -r snapshot ~/.claude/plugins/
```

### Via .skill file

Download `snapshot.skill` from [releases](https://github.com/Pedro-B-Siqueira/snapshot/releases) and run:

```bash
claude skill install snapshot.skill
```

---

### What You Get

| Feature | Claude Code | Gemini CLI | Cursor | Windsurf | Cline | Copilot |
|---------|:-----------:|:----------:|:------:|:--------:|:-----:|:-------:|
| `/snapshot` command | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| `/recap`, `/handoff`, `/context` | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Structured output format | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Respects user's language (PT/EN/etc) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

> **Note:** `npx skills add` installs the skill file — it does **not** auto-activate snapshot on session start. Snapshot only runs when you explicitly type `/snapshot`. This is intentional: you control when context is captured.

---

<details>
<summary><strong>Claude Code — full details</strong></summary>

```bash
claude plugin marketplace add Pedro-B-Siqueira/snapshot
claude plugin install snapshot@snapshot
```

Or install from a local `.skill` file:
```bash
claude skill install snapshot.skill
```

Then type `/snapshot` in any session to capture context.

</details>

<details>
<summary><strong>Gemini CLI — full details</strong></summary>

```bash
gemini extensions install https://github.com/Pedro-B-Siqueira/snapshot
```

Update: `gemini extensions update snapshot` · Uninstall: `gemini extensions uninstall snapshot`

</details>

<details>
<summary><strong>Cursor / Windsurf / Cline / Copilot — full details</strong></summary>

```bash
# Cursor
npx skills add Pedro-B-Siqueira/snapshot -a cursor

# Windsurf
npx skills add Pedro-B-Siqueira/snapshot -a windsurf

# Cline
npx skills add Pedro-B-Siqueira/snapshot -a cline

# Copilot
npx skills add Pedro-B-Siqueira/snapshot -a github-copilot

# Auto-detect
npx skills add Pedro-B-Siqueira/snapshot
```

Uninstall: `npx skills remove snapshot`

</details>

<details>
<summary><strong>Any other agent (opencode, Roo, Amp, Goose, and 40+ more)</strong></summary>

```bash
npx skills add Pedro-B-Siqueira/snapshot           # auto-detect agent
npx skills add Pedro-B-Siqueira/snapshot -a amp
npx skills add Pedro-B-Siqueira/snapshot -a goose
npx skills add Pedro-B-Siqueira/snapshot -a roo
```

**Want it always available?** Paste this into your agent's system prompt or rules file:

```
When user types /snapshot (or /recap, /handoff, /context, /summary), read the entire
conversation and output a structured snapshot:

## 📸 Session Snapshot
**Project:** [name] | **Stack:** [tools] | **Goal:** [what was being solved]

### What we did
• [5–7 self-contained bullets — real names, real decisions, reasons for each choice]

### Current state
[2–4 lines: what works, what's pending, what's broken]

### Essential code (if relevant)
[Only the most critical snippet]

### Agreed next steps
• [Next step 1]

> Paste this block at the top of your next chat to continue right where you left off.
```

</details>

---

## Usage

### Basic

Type `/snapshot` anywhere in a session:

```
/snapshot
```

Claude reads the full conversation and outputs a structured snapshot. Copy it. Open a new chat. Paste at the top. Continue exactly where you stopped.

### Also works with

- `/recap` — same output
- `/handoff` — same output
- `/context` — same output
- `/summary` — same output
- "summarize the session"
- "export context for a new chat"
- "catch me up"

---

## What gets captured

| Section | What's included |
|---|---|
| **Project** | Name, one-line description |
| **Stack** | Languages, frameworks, tools |
| **Goal** | What was being built or solved |
| **What we did** | 5–7 self-contained bullets: decisions, fixes, tradeoffs, with reasons |
| **Current state** | What's working, what's pending, what's broken |
| **Essential code** | Only the most critical snippet (omitted if not relevant) |
| **Next steps** | Anything agreed upon or left pending |

Every bullet is self-contained — someone reading cold has full context.

---

## FAQ

**Q: Does snapshot work for non-coding sessions?**

A: Yes. It works for any kind of work: architecture planning, document writing, debugging, research. If there's context worth preserving, snapshot captures it.

**Q: What if my session is messy or non-linear?**

A: Snapshot handles it. It extracts signal (decisions, implementations, blockers) from noise (back-and-forth, dead ends, tangents).

**Q: Does it capture sensitive information?**

A: Snapshot captures what's in the conversation. If you've pasted API keys or credentials into the chat, review the output before sharing it. Use `[PRIVATE]` to mark things you don't want included.

**Q: Can I customize the output format?**

A: Yes — edit `snapshot/SKILL.md`. Change sections, add your team's preferred structure, adjust language defaults.

**Q: Does it slow down my agent?**

A: Zero impact. Snapshot runs on-demand only when you type `/snapshot`. No background processes.

---

## License

MIT — use it, modify it, share it.

---

<p align="center">
  <strong>Ship faster. Keep context.</strong><br>
  One <code>/snapshot</code> at a time.
</p>
