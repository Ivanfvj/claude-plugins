---
name: subject-lines
description: Data-backed method for writing cold email subject lines, scored on reply rate. Use when the user asks for subject lines, wants one reviewed or improved, or plans a subject line A/B test for cold or outreach email.
---

Only three subject-line rules hold across large send studies: **short**, one real **attribute** of the recipient, and **specific** to the recipient's world. Everything else is thin or contradicted evidence. Numbers, dates and denominators for every claim below live in [REFERENCE.md](REFERENCE.md); cite them from there when the user asks "based on what?".

Reviewing existing lines: run each through step 3, report which rows fail with the evidence, then redraft only from those failures.

## 1. Read the email first

Write down, from the body itself: who receives it, the one outcome the body promises, and the merge fields the list actually holds (company, first name, a segment such as industry or client type).

Done when: the outcome is one phrase taken from the body, and the usable attributes are listed. A subject line promises only what the body delivers (FTC CAN-SPAM, Gmail sender guidelines).

## 2. Draft with the formula

**[attribute] + [the body's outcome, in the reader's words]**, 2–6 words.

- Attribute: company name or a segment field beats first name alone (the first-name effect failed to replicate in 2023). Two attributes beat one (Hunter).
- Outcome: the specific result or situation from step 1, worded as the reader would say it.
- Write 8+ variants, plus one control with no attribute.

Done when: 8+ variants exist, each 2–6 words, each tracing to the step-1 outcome.

## 3. Check every variant

Each variant passes every row, or goes back to step 2.

1. 2–6 words. Hunter's reply data peaks at 5–6; open-rate studies peak at 2–4. Both sit inside the range.
2. Carries one real attribute from the list, or is the declared control.
3. Specific to the reader's world: it could not head an email to a different industry unchanged.
4. Matches the body's promise.
5. Plain words: no buzzwords, no numbers (Gong: up to −17.9% opens).
6. No urgency words such as "now" or "ASAP" (Belkins: below 36% opens).
7. Social proof stays in the body, not the subject (Gong).
8. Fresh wording: overused openers like "Quick question" underperform (Hunter: 2.5% vs 2.9% replies).
9. "Re:" or "Fwd:" only on a real reply or forward (Gmail sender guidelines).

Unsettled, so never a rule: questions versus statements (Belkins and Gong disagree) and casing (a 1–2 point gap with no reported sample). Treat either as a test idea.

Done when: every variant is scored on all nine rows.

## 4. Pick and plan the test

Pick one winner and two runners-up. Then size any A/B test against **reply rate**, since open tracking is inflated by Apple Mail Privacy Protection and Gmail reports no opens.

Sends needed per variant to detect a lift from reply rate p1 to p2 (80% power, two-sided α 0.05):

n ≈ (1.96·√(2·p̄·(1−p̄)) + 0.84·√(p1(1−p1) + p2(1−p2)))² / (p2 − p1)², with p̄ = (p1 + p2) / 2

Example: 3% → 6% needs about 750 per variant. Below that volume, send the winner alone and say so.

Done when: one winner, two runners-up, and a test verdict (test with n per variant, or send the winner alone).

## Deliver

1. The winner and two runners-up, each with its formula parts labelled.
2. The step-3 scores for all three.
3. The test verdict with the n calculation.
4. Sources for any number quoted, from [REFERENCE.md](REFERENCE.md).
