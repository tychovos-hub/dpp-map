# dpp-map plan

## Goal of v1
Show, for one product group, which passport data each access level may read.

- **One schema:** the battery passport, with a small set of fields. Every
  field has a source reference (see CLAUDE.md, "Source rules").
- **Three access levels** from the battery regulation: public, legitimate
  interest, authorities. *To verify:* the exact levels, their names and the
  provisions that define them must be confirmed against the regulation text
  before they are used in the schema.
- **One fictional battery** with invented name and specs.
- **One page** where you switch the access level and see which fields are
  visible.

## Setup status
Done:
- [x] Push protection
- [x] CI: typecheck, lint, test, gitleaks
- [x] Ruleset on `main`
- [x] CLAUDE.md and `.claude/settings.json`

To do:
- [ ] Cloud environment
- [ ] End-to-end dry run from phone

## v1 steps
> **Draft, to be refined with the owner.** These are proposed issue-sized
> steps. Order, scope, architecture and dependencies are not decided here;
> each step gets its own issue and approved plan.

1. **Verify the access levels.** Confirm in the regulation text which
   access levels exist. One `source` issue per level.
2. **Choose the v1 fields.** Owner picks a small set of battery passport
   fields. One `source` issue per field, including which access level may
   read it.
3. **Agree the schema file format.** Decide how fields, access levels,
   access rules and source references are written in a per-product-group
   schema file.
4. **Core: access model.** Read a schema and return the fields visible to a
   given access level. Product-neutral, no UI, fully tested.
5. **Battery schema file.** Add the verified fields and rules with their
   source references. `verified` flags are set by the owner only.
6. **Fictional battery scenario.** Data only, invented name and specs.
7. **Access level page.** One page that loads the scenario, lets you switch
   access level and shows the visible fields. Reads from the core only.

## Later to review
- rtk
- Context7
- claude-code-action
- CodeQL
- Dependabot version updates
- Separate bot account for merging

## Decision log
| Decision | Reason |
| --- | --- |
| Public repository | Branch rulesets and push protection on a free plan; believed to be available only for public repositories (to verify). Push protection tested and working on this public repo. |
| gitleaks scans only the history of HEAD (since #6) | Scanning all refs made a secret on any branch fail every PR, so the failing PR was not necessarily the cause. Push protection still blocks known token formats on every push. |
| TypeScript 6.0.3 | Required by the typescript-eslint peer dependency. |
