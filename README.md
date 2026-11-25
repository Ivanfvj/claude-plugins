# claude-plugins

Claude Code plugins by Iván Velasteguí.

## ref-links

Every pull request, issue or ticket Claude mentions becomes a markdown link whose text carries
the number **and** the title, like `[#123 - Fix login redirect](https://github.com/owner/repo/pull/123)`.
Bare numbers, bare ticket ids and bare URLs are refused.

- **At session start** it tells Claude the rule, so replies are right the first time.
- **When Claude finishes a reply** it checks the reply and sends it back for a rewrite if a
  reference breaks the rule. Code blocks and inline code are exempt.

### Install

```bash
claude plugin marketplace add Ivanfvj/claude-plugins
claude plugin install ref-links@ivanfvj
```

Or turn it on for everyone in a repository, in its committed `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "ivanfvj": { "source": { "source": "github", "repo": "Ivanfvj/claude-plugins" } }
  },
  "enabledPlugins": { "ref-links@ivanfvj": true },
  "env": { "CLAUDE_TICKET_PREFIXES": "ABC" }
}
```

### Ticket prefixes

Ticket ids are checked only for the prefixes in `CLAUDE_TICKET_PREFIXES` (`"ABC"`, or several as
`"ABC|XYZ"`), set per project in the `env` block above. Pull request and URL checks always run.

### Requirements

`perl` with its core `JSON::PP` module: present on macOS and most Linux distributions. On Windows,
Claude Code runs hooks in Git Bash, so install [Git for Windows](https://git-scm.com/downloads/win), which ships `perl`;
without it the hooks fall back to PowerShell and don't run.

### Test

```bash
bash plugins/ref-links/tests/check-ref-links.test.sh
```

## explain-tickets

A skill that explains a chain of tickets (a parent and its sub-tickets, a project or an epic) in
execution order. It opens with a short glossary of the recurring jargon, then gives one block per
ticket ("What it asked for", "What came out", and when they apply "What changed because of it",
"What was added later", "Where it stands"), and closes with the whole chain in one line.

It reads the real tickets first, comments included, through whatever tracker tools the session
has. It answers in English by default, and in Spanish (or the user's language) when asked in it.

### Install

```bash
claude plugin marketplace add Ivanfvj/claude-plugins
claude plugin install explain-tickets@ivanfvj
```

Then ask "explain the tickets of ABC-10" or "explícame los tickets de ABC-10".

## evidence-research

An evidence-first research method. Before searching it
names the decision the research serves and strips bias from current work. It starts from prior
research, closes every unknown with a source or labels it an assumption, gathers across lanes in
parallel (primary docs, real data, peer products, community talk, vendor trust, first-hand
checks), tags every claim Fact / Vendor claim / Heuristic / Assumption, has a fresh agent try to
break the findings, and delivers a comparison table with a sourced recommendation.

### Install

```bash
claude plugin marketplace add Ivanfvj/claude-plugins
claude plugin install evidence-research@ivanfvj
```

Then ask Claude to research, compare or verify anything; it loads on its own.

## value-proposition

A research-first method for writing a value proposition, built from Copyhackers, April Dunford,
Strategyzer, Bain's Elements of Value and NN/g. It picks one customer, collects their exact words,
maps their real alternatives, keeps only provable attributes, turns them into one to three values,
drafts 20+ headlines from proven formulas, scores the top three against a 13-point checklist, and
hands back a 5-second test plan. It also reviews an existing value proposition against the checklist.

### Install

```bash
claude plugin marketplace add Ivanfvj/claude-plugins
claude plugin install value-proposition@ivanfvj
```

Then ask "write a value proposition for X" or "review our homepage headline".

## subject-lines

A data-backed method for cold email subject lines, built from large send studies (Belkins, Gong,
Hunter, Saleshandy, Backlinko) and a peer-reviewed field experiment. It reads the email first,
drafts from one formula (a real recipient attribute plus the body's outcome, 2–6 words), checks
every variant against nine sourced rules, and sizes any A/B test on reply rate, saying when the
list is too small to test at all. It also reviews existing subject lines against the same rules.

### Install

```bash
claude plugin marketplace add Ivanfvj/claude-plugins
claude plugin install subject-lines@ivanfvj
```

Then ask "write subject lines for this email" or "review these subject lines".
