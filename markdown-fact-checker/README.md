![Markdown Fact Checker banner](https://www.context-is-everything.com/assets/markdown-fact-checker-hero.png)

# Markdown Fact Checker

Detect hallucinations and verify accuracy in markdown documents. Systematically checks URLs, citations, quotes, and claims against source material with confidence scoring. Built as a self-audit tool for Claude-generated research documents.

**Category:** Knowledge Management · **Created:** 2026-01-28

---

## How to Use — Just Ask

Say any of these to Claude and the skill activates:

> **"Fact-check this document..."**

> **"Check this for hallucinations..."**

> **"Verify the claims in..."**

> **"Audit this research document before I send it..."**

> **"Are the URLs in this document still valid?"**

### Worked Examples

**Pre-delivery quality check:**
> "Fact-check this research document before I send it to the client"

Runs the full verification pipeline: checks every URL, validates every quote against source files, flags unsupported statistical claims, and produces a report with confidence scores per section.

**URL verification:**
> "Verify all the URLs in docs/market-analysis.md"

Fetches each URL, checks it resolves correctly, and verifies the page content matches what the document claims about it. Flags dead links and content mismatches.

**Quote accuracy:**
> "Audit this document for hallucinated quotes"

Cross-references every quoted passage against the source files. Flags quotes that don't exist, are taken out of context, or have been subtly altered.

**Statistical claims:**
> "Check the statistics in this report — are the numbers accurate?"

Identifies every numerical claim, traces it to its source, and flags numbers that can't be verified or contradict the cited source.

**Self-audit after writing:**
> "I just finished writing that research report — run a self-audit on it"

Performs the complete fact-check workflow on Claude's own output, catching hallucinations before delivery. Particularly effective immediately after completing a research task.

**Targeted verification:**
> "Check whether the quotes attributed to the CEO in this article are accurate"

Focuses on a specific verification category — finds every attributed quote, locates the original source, and confirms accuracy.

**Batch checking:**
> "Verify all the documents in the docs/ folder for factual accuracy"

Runs the fact-check pipeline across multiple files, producing a consolidated report with per-document scores.

---

## What You Get

A structured verification report where each issue includes:

- **Severity** — Critical / Warning / Note
- **Category** — URL, Quote, Statistic, Name, Date, Source
- **Location** — File path and line reference
- **Finding** — What was checked and what was found
- **Suggestion** — Recommended correction

## What It Checks

| Check | What It Does |
|-------|-------------|
| URLs | Fetches links, verifies they resolve, checks content matches claims |
| Quotes | Cross-references against source files for existence and context |
| Statistics | Traces numbers to their source, flags unverified claims |
| Names | Checks spelling consistency and correct attribution |
| Dates | Validates chronological accuracy across the document |
| Sources | Ensures proper citation and provenance tracking |

## Installation

```bash
git clone https://github.com/context-is-everything/skills.git /tmp/cie-skills
cp -r /tmp/cie-skills/markdown-fact-checker .claude/skills/
```

## Links

- [Community page](https://www.context-is-everything.com/community) · [Full skill documentation](SKILL.md)
