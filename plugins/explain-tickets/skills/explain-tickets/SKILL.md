---
name: explain-tickets
description: Explain a chain of tickets (a parent and its sub-tickets, a project, an epic or a list of issues) in execution order, stating plainly what each one asked for and what came out of it. Use when the user asks "explain the tickets of X", "what order do these tickets go in", "what did each ticket ask for", "walk me through this project's tickets", "where are we on X", or the same in Spanish ("explícame los tickets", "en qué orden van", "qué pedía cada ticket"). Answers in English by default; in Spanish (or the user's language) when the user asks in it.
---

# Explain tickets

Turn a chain of tickets into a short, ordered explanation that someone with no context can read
once and retell. The reader knows the business but not this effort's jargon, and has not read
the tickets.

## Language

- Write in **English by default**.
- Write in **Spanish** when the user writes the request in Spanish or asks for Spanish, and in
  any other language the same way. Field labels change with the language (see the examples).
- Ticket titles stay exactly as the tracker has them, untranslated, because they are names.

## Gather first

Read the real tickets before writing a word. Never explain from memory or from titles alone.

1. Find the parent (or project, epic, milestone) and list every sub-ticket, including closed ones.
2. For each ticket read the description, its acceptance criteria and **all comments**. Comments
   hold the changes of direction ("updated: was X"), the decisions and the hand-backs, which is
   where "what came out" lives.
3. Read the linked PRs when a ticket's result is only described there.
4. Work out the **execution order** from blocking relations, start and completion dates and the
   comments ("start now, in parallel with…"). Ticket numbers are not the order: a ticket created
   later can run earlier, or in parallel.

Use whatever tracker tools the session has (the Linear MCP, `gh issue`/`gh pr`, Jira). If a
ticket can't be read, say so in its block instead of guessing.

## Output shape

Keep this exact order.

1. **Glossary first.** Only the 3 to 6 technical words that recur across the tickets. Each gets a
   one-line definition and, where it helps, a concrete example. Skip it entirely if there is no
   jargon.
2. **The parent's goal**, in one sentence, with its link.
3. **One block per ticket, in execution order.** The heading line is the numbered position, the
   ticket link, then its status and date, and "in parallel with step N" when it was.
   Then these fields, each a bullet:
   - **What it asked for:** the job in plain words, plus the deliverable.
   - **What came out:** the result, with the key numbers and their units.
   - **What changed because of it:** only when the ticket changed a rule or the plan.
   - **What was added later:** only when the owner added scope after it started.
   - **Where it stands:** only for tickets still open — what is done and what is still owed.
4. **A closing line** that retells the whole chain in one sentence of plain language.

Separate the glossary and the closing line from the blocks with a horizontal rule.

## Writing rules

- **Every sentence explains itself.** It must make sense read alone, without the sentence before
  it. Name the thing instead of writing "it", "this" or "the above". Replace bare labels like
  "stars stay" or "rule 3 inconclusive" with what they mean.
- **No undefined term.** A term is either in the glossary or explained in the same sentence.
- **Numbers carry their unit** ("4,193 searches", "3 shared links", "10 searches a month").
- **Dates are absolute** (26 Oct, 2026-10-26), never "yesterday" or "last week".
- **Facts only.** No opinion or review unless the user asks for one; when asked, put it in its
  own section after the closing line.
- **Links:** every ticket and PR is a markdown link whose text carries its id and title, e.g.
  `[ABC-12 - Review the keyword list](https://…)`. Inside the closing line, step numbers
  ("steps 1 and 2") are enough.
- Short beats complete: a ticket with a trivial result gets two bullets, not five.

## Example (English, the default)

> First, the words that recur across these tickets:
>
> - **Keyword:** a search people type into Google, for example "oak flooring for kitchens".
> - **Cluster:** a group of searches that Google answers with the same pages, so one page of ours can serve all of them.
> - **Draft:** a page loaded in the site builder that is not yet visible on the live site.
>
> The parent ticket is [ABC-10 - Wave 1: from measured keywords to draft pages](https://example.com/ABC-10). Its goal is to start from the searches we measured and end with draft pages the owner can review before anything is published.
>
> ---
>
> **1. [ABC-11 - Review the measured keywords](https://example.com/ABC-11)**, done 26 Oct
> - **What it asked for:** go through the 4,193 measured searches and decide, one by one, whether the client can serve each one (kept) or not (filtered, with the reason written down).
> - **What came out:** a sample showed that about 1 in 4 kept searches were for things the client does not sell, so the kept list was not clean.
> - **What changed because of it:** the owner changed the rule. A search is kept when some page can lead the searcher to something the client does sell, even if it is not exactly what they searched for.
>
> **2. [ABC-12 - Group the keywords by search results](https://example.com/ABC-12)**, done 30 Oct
> - **What it asked for:** download Google's results for every kept search and group the searches whose results share at least 3 links, because one page of ours can then serve the whole group.
> - **What came out:** 3,340 groups, of which 3,286 will be built; the rest are dropped because Google shows something else for them, such as another meaning of the word.
>
> **3. [ABC-14 - 20 sample pages as drafts](https://example.com/ABC-14)**, in progress, in parallel with step 2
> - **What it asked for:** write 20 sample pages for the groups with the most searches and load them as drafts, with one batch per page type.
> - **What was added later:** on 4 Nov the owner also asked for a product-page template and for the facts the client still has to provide.
> - **Where it stands:** the 20 pages are loaded as drafts. The PR with the page briefs and the preview link have not been delivered yet.
>
> ---
>
> **In one line:** first the searches were cleaned (step 1), then grouped by what Google shows (step 2), and now the first sample pages are being built (step 3).

## Ejemplo (español, cuando se pide en español)

> Primero, las palabras que se repiten en estos tickets:
>
> - **Keyword:** una búsqueda que la gente escribe en Google, por ejemplo "piso de roble para cocina".
> - **Cluster:** un grupo de búsquedas que Google responde con las mismas páginas, así que una sola página nuestra puede atenderlas todas.
> - **Borrador:** una página cargada en el constructor del sitio que todavía no se ve en el sitio público.
>
> El ticket padre es [ABC-10 - Wave 1: from measured keywords to draft pages](https://example.com/ABC-10). Su objetivo es partir de las búsquedas que medimos y terminar con páginas en borrador que el dueño pueda revisar antes de publicar nada.
>
> ---
>
> **1. [ABC-11 - Review the measured keywords](https://example.com/ABC-11)**, terminado el 26-oct
> - **Qué pedía:** revisar las 4,193 búsquedas medidas y decidir, una por una, si el cliente puede atenderla (se conserva) o no (se filtra, con su razón escrita).
> - **Qué salió:** una muestra mostró que cerca de 1 de cada 4 búsquedas conservadas eran de cosas que el cliente no vende, así que la lista no estaba limpia.
> - **Qué cambió por eso:** el dueño cambió la regla. Una búsqueda se conserva si alguna página puede llevar a quien busca hacia algo que el cliente sí vende, aunque no sea exactamente lo buscado.
>
> **2. [ABC-14 - 20 sample pages as drafts](https://example.com/ABC-14)**, en curso, en paralelo con el paso 1
> - **Qué pedía:** escribir 20 páginas de muestra para los grupos con más búsquedas y cargarlas en borrador, con un batch por tipo de página.
> - **Qué se agregó después:** el 4-nov el dueño pidió también una plantilla de ficha de producto y los datos que el cliente todavía debe dar.
> - **Dónde está:** las 20 páginas ya están en borrador. Todavía no se entregó el PR con las fichas de cada página ni el link de vista previa.
>
> ---
>
> **En una línea:** primero se limpiaron las búsquedas (paso 1), y ahora se están construyendo las primeras páginas de muestra (paso 2).

Spanish field labels: **Qué pedía**, **Qué salió**, **Qué cambió por eso**, **Qué se agregó
después**, **Dónde está**; status words: terminado, en curso, en paralelo con el paso N.
