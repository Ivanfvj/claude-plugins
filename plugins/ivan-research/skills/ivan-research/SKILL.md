---
name: ivan-research
description: Iván's research method — how to investigate anything for him so the result survives his "based on which source?" check. Use whenever he asks to research, investigate, deep-research, compare or rank options, evaluate a vendor/product/seller, find how other companies solve something, verify a claim or number, or before recommending a decision. Runs on top of the deep-research skill; it does not replace it.
---

Iván decides from **evidence**, never opinion. He will ask "based on which arguments?", "where does that number come from?", "whose idea was this?" — every result must already answer those. Guessing, anchoring on what is already built, and shallow one-search answers are what he calls lazy; he expects relentless legwork.

## 1. Frame the goal before searching

- Write one line: **what decision this research serves**. Then lift it one category up ("what are we actually trying to achieve?") so the research is not a narrow re-check of the two or three options already on the table.
- Strip **bias**: the current product's limits, the current client or location (one customer's city is not the universe), recent chat momentum, our own prior picks. Research the world first; map it onto our situation after.
- Deep or paid research (deep-research runs, many agents, paid API calls): first show him the brief you would run — question, scope, criteria, sources — and get his go. Quick lookups: just do them.

## 2. Start from what is already known

Before any web search, find prior work: the repo's research docs and decision log, team wiki, Drive, Linear/Slack threads, earlier sessions (`t3_thread_search`), memory. Build on it and cite it. If your conclusion departs from settled research, say so explicitly and why. Never redo research a teammate already posted.

## 3. List the unknowns, then close each one

Write the unknowns down. Each one ends either **resolved with a source** or **labelled Assumption** — no third state. "Research your unknowns" is the default, not an extra.

## 4. Gather across lanes, in parallel

Spin one agent per independent lane (`deep-research` skill for broad questions). Put the current year in every web query. If results come back thin, rephrase with different terms before concluding "nothing exists".

| Lane | What to pull |
| --- | --- |
| **Primary** | Official docs, specs, changelogs, the vendor's own GitHub, laws and government sources, search-engine docs (Google Search Central). |
| **Data** | Real numbers: DataForSEO (volume, rankings, DR, SERPs), GitHub stars/activity, pricing pages, total cost over the period he cares about. |
| **Peers** | How top-notch products do it: name real companies, link them, open their actual pages/HTML/UI, screenshot. Inspiration, not a mandate. |
| **People** | Reddit, X, YouTube, communities, forums (Monid connectors for social). What practitioners actually use and complain about. |
| **Trust** (vendors, products, sellers) | Founded when, from where, named customers, independent reviews, verifiable testimonials, certifications checked at the source, refund/cancel/auto-renew terms. |
| **First-hand** | Open it yourself: the listing, the map pin, the page, the checkout. Screenshot it. "The page says" beats "a summary says". |

If a relevant skill exists for the domain (copywriting, SEO, design), load it and use it as a source too.

Paid calls beyond what he asked for (bulk lead pulls, finder/verifier runs): propose with the cost and wait.

## 5. Trace every claim

- Tag each claim: **Fact** (primary source states it), **Vendor claim** (a company about itself), **Heuristic** (practitioner consensus), **Assumption** (yours). Link each one.
- Every number carries its source, its date, and its denominator. Re-open the primary page rather than trusting an agent's summary of it.
- Every rule or threshold you propose (a "40", a "125/week", a "20–45 s") states where it came from — or is marked Assumption.

## 6. Verify independently

Before delivering anything substantial, hand the findings to a fresh agent with minimal context and the instruction to break them: re-check sources, hunt unsourced claims. Drop what it cannot confirm.

## 7. Deliver

- **Lead with the answer** in plain words. Simple language; explain any term he has not met.
- **Comparison table**: one row per option, criteria as columns, real numbers, links, a trust column when relevant.
- **His decisions**: options plus your recommended pick, with the arguments. **Team research tickets**: contrast on criteria, no pick unless he asks.
- **Visuals** for UI, architecture or flows: before/after, real examples from peers. Big results go in an HTML report (light theme, diagram-design skill) opened for him.
- **Open questions** in chat, grilling format (❓ question / ➡️ recommendation), never the question dialog.
- End with **ordered next steps**.

## 8. Persist, then stop

- Research worth keeping goes where the next session will find it: a repo doc via PR (e.g. `docs/research/<topic>-<yyyy-mm>/`) or a ticket carrying the sources, so nobody re-runs it.
- "Research" means research. Apply changes, flip settings or buy anything only after his explicit go on that specific action.

## Done when

Every unknown is resolved or labelled, every number has source + date, every table cell is filled or marked unknown, peers are real and linked, and the verifier agent found nothing unsupported.
