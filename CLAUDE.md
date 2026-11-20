# CLAUDE.md

## Project
dpp-map is a web tool that shows which data a Digital Product Passport (DPP)
contains, who needs it, and which access level may read it.

Three layers:
1. **Core**: model, access levels, access rules. No UI. Fully tested.
2. **Scenarios**: data only, fictional products only.
3. **Applications**: read from the core and never modify it.

The core is product-neutral. Access levels, fields and rules live in a
schema file per product group, not in core code.

## Commands
- `npm ci`
- `npm run typecheck`
- `npm run lint`
- `npm test`

## Workflow
- One issue = one branch = one small PR.
- Never push to `main`.
- Never merge a PR: no `gh api` merge calls, no merge tools. The owner merges.
- Do only what the task asks. No unrequested cleanup, refactoring, renaming
  or branch deletion; propose it instead.

## Stop rule
The approved plan names which files change and how. On any deviation, stop
and report. Always stop and report before:
- changing or deleting an existing test;
- adding an exception or special case in data or code that is not in the plan;
- changing the schema format;
- touching a file not in the plan;
- adding a dependency;
- changing `.github/`, `.claude/` or `CLAUDE.md`.

## Source rules
- No field or access rule without a source reference.
- For sourceType "binding": CELEX number, consolidated version date, location
  (article/annex, part, point), language, verbatim quote, link, date checked.
- For other sourceTypes: title, publisher, version or date, location, link,
  date checked. No verbatim quotes.
- Never state article numbers, fields or obligations from memory; mark them
  "to verify".
- Verbatim quotes only from sources with `sourceType` "binding".
- Never set or change a `verified` flag. Only the owner does that.
- A missing field is better than an invented one.

## Confidentiality
- Never write company names, interview material or anything traceable to a
  real company anywhere: code, data, issues, PR text, commit messages.
- Fictional products use invented names and specs.

## Conventions
- Code, docs and UI text are in English.
- All text files UTF-8 with LF line endings (enforced by `.gitattributes`).
- Exact dependency versions (no `^` or `~`).
- Third-party actions pinned to full commit SHAs obtained from command
  output, never from memory.
- Report the source of every version, SHA and checksum in the PR
  description.

## Guardrails in `.claude/settings.json`
Deny rules block reading `.env` files, pushing to `main`, force pushes and
PR merges via `gh api` or `gh pr merge`. They match command text only, so
follow the rules above even where a command form is not caught.
