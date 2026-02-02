![Folder Organisation Analyser banner](banner.png)

# Folder Organisation Analyser

Analyses your folder structure and recommends the best organisational approach based on what's actually in there. Scores multiple paradigms — phase-based, entity clustering, artifact-type, flat with metadata, and tag-first — then generates a step-by-step migration plan.

**Category:** Knowledge Management · **Created:** 2026-01-31

---

## How to Use — Just Ask

Say any of these to Claude and the skill activates:

> **"Organise this folder..."**

> **"This folder is a mess — help me sort it out"**

> **"What's the best way to structure..."**

> **"Analyse my folder at..."**

> **"How should I organise my project files?"**

### Worked Examples

**Messy project folder:**
> "Analyse and organise my project folder at ~/Documents/client-project"

Scans all files, identifies it's a consulting engagement with research, drafts, and deliverables, and recommends phase-based hierarchy with a full migration plan.

**Can't find anything:**
> "This folder has 200+ files and I can't find anything — help me organise it"

Detects chaos signals (flat dumping, inconsistent naming, mixed concerns), scores all paradigms, and recommends the one that minimises disruption while maximising findability.

**Research notes:**
> "What's the best way to organise my research notes?"

Analyses content themes, identifies whether notes cluster by topic, date, or source, and recommends entity clustering or tag-first depending on how you work.

**Starting fresh:**
> "Create an organisational structure for a new data science project"

Proposes an optimal starting structure based on common data science workflows — data ingestion, analysis, models, outputs — before files accumulate.

**Team shared drive:**
> "Our team's shared drive is chaos — can you suggest a better structure?"

Scans the current layout, identifies what different team members are storing, and proposes a structure that works for everyone with clear ownership boundaries.

**Quick health check:**
> "Is this folder well organised or should I restructure it?"

Runs a health score assessment and gives a quick verdict — sometimes the answer is "it's fine, leave it alone."

---

## What You Get

1. **Health score** — how organised (or chaotic) the folder currently is
2. **Pattern detection** — what organisational approach (if any) is already in use
3. **Paradigm scoring** — each of 4-5 approaches rated for your specific content
4. **Recommendation** — the best approach with reasoning and trade-offs
5. **Migration plan** — specific commands and folder structures to implement it
6. **Analysis document** — permanent reference saved in the folder

## Paradigms Compared

| Paradigm | Best For | Trade-off |
|----------|----------|-----------|
| Phase-based hierarchy | Projects with clear workflow stages | Rigid if workflow is non-linear |
| Entity clustering | Content grouped by subject/client | Can create deep nesting |
| Artifact-type | Mixed media (docs, data, images) | Separates related items |
| Flat with metadata | Small-to-medium collections | Relies on naming conventions |
| Tag-first | Cross-cutting topics | Needs tooling support |

## Links

- [Community page](https://www.context-is-everything.com/community) · [Full skill documentation](SKILL.md)
