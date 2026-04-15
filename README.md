<p align="center">
  <span style="font-size: 120px;">💾</span>
</p>

<h1 align="center">snapshot</h1>

<p align="center">
  <strong>never lose context. always ship faster.</strong>
</p>

<p align="center">
  <a href="https://github.com/Pedro-B-Siqueira/snapshot/stargazers"><img src="https://img.shields.io/github/stars/Pedro-B-Siqueira/snapshot?style=flat&color=4F46E5" alt="Stars"></a>
  <a href="https://github.com/Pedro-B-Siqueira/snapshot/commits/main"><img src="https://img.shields.io/github/last-commit/Pedro-B-Siqueira/snapshot?style=flat&color=4F46E5" alt="Last Commit"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/Pedro-B-Siqueira/snapshot?style=flat&color=4F46E5" alt="License"></a>
</p>

<p align="center">
  <a href="#what-is-snapshot">What is it</a> •
  <a href="#before--after">Before/After</a> •
  <a href="#install">Install</a> •
  <a href="#usage">Usage</a> •
  <a href="#why-it-works">Why it works</a> •
  <a href="#faq">FAQ</a>
</p>

---

## What is snapshot?

Every development session builds context. Context gets lost between chats. You restart. You explain everything again. Your brain cycles backwards instead of forwards.

**Snapshot captures your entire session in one command.** One `/snapshot`. Structured. Copy-paste ready. No friction.

The result? Seamless context handoff between sessions. Fewer explanations. Faster shipping. Brain energy spent on building, not rehashing.

Think of it like save-game for your development workflow.

---

## Before / After

<table>
<tr>
<td width="50%">

### 😩 Without snapshot (manual context)

**You write something like:**
> "hey so last session i was building this authentication feature for a react app using nextjs. we had some issues with jwt tokens and i think we decided to use httpOnly cookies. also we were trying to figure out the refresh token expiry time and there was this bug where... wait what was the bug again?"

**Next chat wastes 3–5 messages re-explaining:**
- What you were building
- Which stack/frameworks
- What problems you hit
- What decisions you made
- Where the code is

</td>
<td width="50%">

### ✨ With snapshot (one command)

**You type:** `/snapshot`

**Claude returns:**
```
## 📋 Session Context

**Project:** NextJS auth with JWT + refresh tokens
**Stack:** React, Next.js, TypeScript, PostgreSQL
**Objective:** Implement secure auth flow

### What we did
• Added JWT with 15min access token expiry, 7d refresh
• Moved refresh token to httpOnly cookie (not localStorage)
• Fixed race condition in token refresh endpoint
• Built refresh token rotation for security

### Current state
Auth flow working. Need to add logout endpoint.

### Code
[critical snippet only]

### Next steps
• Add logout endpoint that invalidates refresh tokens
• Add token rotation tests
```

**Next chat starts immediately.** No context debt. No explaining twice.

</td>
</tr>
</table>

**Same project. Infinite less friction.**

---

## Why it works

| What you gain | Impact |
|---|---|
| **Instant context recall** | No "wait, what framework were we using?" — it's right there |
| **Async-friendly workflows** | Sleep, take a break, come back days later. Full context preserved |
| **Team handoff** | Pass context between team members without 30min sync call |
| **Decision memory** | "Why did we choose X over Y?" — it's documented in the snapshot |
| **Copy-paste ready** | Formatted for immediate use. No reformatting, no paraphrasing |
| **Session boundaries clear** | What changed session-to-session is obvious. Easy to see progress |

---

## Install

### Claude Code (Recommended)

```bash
# Add the marketplace
claude plugin marketplace add Pedro-B-Siqueira/snapshot

# Install the plugin
claude plugin install snapshot@latest
```

That's it. Plugin auto-loads on every Claude Code session after installation.

### Manual installation

If the marketplace method doesn't work yet, install directly:

```bash
# Clone the repo
git clone https://github.com/Pedro-B-Siqueira/snapshot.git

# Copy to Claude Code plugins directory
cp -r snapshot ~/.claude/plugins/

# Restart Claude Code
```

### Verify installation

After installing, type in Claude Code:

```
/snapshot
```

You should see the skill activate and available for use.

---

## Usage

### Basic: Save your session

```
/snapshot
```

Claude reads your entire conversation and generates a structured summary. Copy it. Save it somewhere (Notion, GitHub gist, markdown file — wherever makes sense for you).

When you restart: paste it at the top of a new chat.

### Advanced: Snapshot with theme

```
/snapshot focus:architecture
/snapshot focus:bugs
/snapshot focus:api-changes
```

Emphasizes specific aspects. Same structure, different emphasis.

### Stop & discard

```
stop
```

Returns to normal Claude mode. Snapshot doesn't auto-activate.

---

## The snapshot format

Here's what you get. Designed for human reading AND copy-pasting:

```markdown
## 📋 Session Context

**Project:** [Name + one-line description]
**Stack:** [Languages, frameworks, tools]
**Objective:** [What you're building/solving]

---

### What we did

• [5–7 bullets of key decisions, implementations, bugs fixed, pivots]
• [Each bullet is self-contained — understandable without the full chat]
• [Specific: real function names, file paths, error messages]
• [No fluff: "we worked on stuff" is banned]

---

### Current state

[2–4 sentences: What's working. What's pending. Blockers if any.]

---

### Code snippet (if relevant)

[Only the critical bit. Skip if it's 10+ lines or not essential.]

---

### Next steps

• [What was agreed on next]
• [What's blocking progress]
```

**Design principles:**
- **Self-contained**: Someone reading this cold understands it
- **Specific**: Real names, real errors, real decisions
- **Concise**: No filler. Every bullet earns its space
- **Actionable**: Next chat can start building immediately

---

## Why snapshot, not just copy-paste?

| Approach | Time | Clarity | Usable? |
|---|---|---|---|
| **Copy-paste chat** | 5 sec | Low (whole conversation) | Messy |
| **Manual summary** | 5–10 min | High (you curate) | Good |
| **snapshot** | 5 sec | High (structured format) | Perfect |

You get speed + clarity without the work.

---

## FAQ

**Q: Is snapshot just a summary?**

A: Sort of. It's a *structured, copy-paste-ready* summary designed specifically for handing off between chats. Not "here's what happened" — more "here's what you need to know to keep shipping."

---

**Q: Can I use snapshot for other AI models?**

A: Yes! The format works with Claude, GPT, Gemini, whatever. It's just markdown + structure. The `/snapshot` command is Claude-specific (Claude Code), but you can manually generate the format for any model.

---

**Q: What if my session is messy / non-linear?**

A: Snapshot handles it. It pulls out the *signal* (decisions, implementations, blockers) from the *noise* (back-and-forth, dead ends, tangents).

---

**Q: Does snapshot save my code/credentials/secrets?**

A: No. Snapshot strips out:
- Your API keys
- Database credentials  
- Sensitive filenames
- Anything marked `[PRIVATE]`

It's safe to share, safe to paste anywhere.

---

**Q: Can I customize the format?**

A: Absolutely. Edit the template in the plugin. Want different sections? Different emoji? Custom focus areas? It's all yours.

---

**Q: Does snapshot slow down Claude Code?**

A: Zero impact. Runs on-demand when you type `/snapshot`. No background polling, no constant overhead.

---

## Philosophy

Most tools solve problems. Snapshot solves *friction*.

The friction of context handoff. The friction of re-explaining. The friction of wondering "wait, why did we decide that?" three chats later.

It's small. It's boring. But it compounds. Every session you use it, you ship a little faster. You think a little clearer. Your projects have better memory.

That's the goal.

---

## Built by

[Pedro B. Siqueira](https://github.com/Pedro-B-Siqueira)

Inspired by the need to never lose context between sessions.

### README reference

[caveman](https://github.com/JuliusBrussee/caveman)

## License

MIT — use it, modify it, share it freely.

---

<p align="center">
  <strong>Ship faster. Keep context.</strong><br>
  One `/snapshot` at a time.
</p>
