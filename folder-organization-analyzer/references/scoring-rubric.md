---
created: '2026-01-31'
---
# Folder Organization Analyzer - Scoring Rubric

**Document Type:** Reference
**Skill:** folder-organization-analyzer
**Version:** 1.0
**Last Updated:** 2024-01-31

---

## Overview

This document provides the detailed scoring rubric used by the Folder Organization Analyzer skill to recommend organizational paradigms based on folder content analysis.

The rubric evaluates 12 criteria and assigns points to each of the 4 organizational paradigms. The paradigm with the highest score is recommended, with alternatives presented if scores are close (<15 point difference).

---

## Scoring Matrix

### Complete Scoring Table

| Criterion | Phase-Based | Entity Clustering | Artifact-Type | Flat + Metadata |
|-----------|-------------|-------------------|---------------|-----------------|
| **File count <15** | -20 | 0 | 0 | +30 |
| **File count 15-40** | +20 | +20 | +10 | 0 |
| **File count >40** | +30 | +30 | +30 | -30 |
| **Dated files present** | +20 | 0 | 0 | +10 |
| **Multiple entities detected** | 0 | +40 | 0 | 0 |
| **Mixed file formats** | 0 | 0 | +40 | -10 |
| **Existing subdirs by phase** | +30 | 0 | 0 | -10 |
| **Existing subdirs by entity** | 0 | +30 | 0 | -10 |
| **Existing subdirs by type** | 0 | 0 | +30 | -10 |
| **Deep nesting (>3 levels)** | -10 | -10 | -10 | +20 |
| **Sequential workflow evident** | +20 | 0 | 0 | 0 |
| **Technical project (scripts)** | 0 | 0 | +30 | 0 |

---

## Criterion Explanations

### 1. File Count <15
**Detection method:** Count total files in folder (excluding subdirectories)

**Scoring rationale:**
- **Phase-Based: -20** - Overkill for small projects; overhead not worth it
- **Entity Clustering: 0** - Neutral; could work but might be premature
- **Artifact-Type: 0** - Neutral; format separation less useful for few files
- **Flat + Metadata: +30** - Ideal for small projects; keeps things simple

**Why this matters:** Small projects benefit from simplicity. Hierarchical structures add cognitive load without benefit.

---

### 2. File Count 15-40
**Detection method:** Count total files in folder

**Scoring rationale:**
- **Phase-Based: +20** - Sweet spot for phase-based organization
- **Entity Clustering: +20** - Manageable entity count with multiple docs each
- **Artifact-Type: +10** - Works but less critical than other approaches
- **Flat + Metadata: 0** - Starting to get crowded; consider structure

**Why this matters:** This is the range where structure becomes valuable but doesn't require extensive hierarchy.

---

### 3. File Count >40
**Detection method:** Count total files in folder

**Scoring rationale:**
- **Phase-Based: +30** - Clear structure needed; phases help organize large projects
- **Entity Clustering: +30** - Multiple entities with many docs each
- **Artifact-Type: +30** - Format separation critical for discoverability
- **Flat + Metadata: -30** - Too many files for flat structure; becomes unwieldy

**Why this matters:** Large projects need hierarchical organization for navigation. Flat structures become chaos at scale.

---

### 4. Dated Files Present
**Detection method:** Check for YYYY-MM-DD pattern in filenames (e.g., `2024-01-15-analysis.md`)

**Scoring rationale:**
- **Phase-Based: +20** - Dates suggest temporal workflow
- **Entity Clustering: 0** - Neutral; dates don't indicate entity focus
- **Artifact-Type: 0** - Neutral; dates unrelated to format
- **Flat + Metadata: +10** - Dates work well with flat naming convention

**Why this matters:** Date-based naming indicates temporal progression, which aligns with phase-based workflows.

---

### 5. Multiple Entities Detected
**Detection method:** Scan file names and sample content for repeated company names, person names, or project names

**Detection signals:**
- File names like: `acme-analysis.md`, `acme-financials.md`, `techco-analysis.md`
- Content mentions: "Acme Corp", "TechStart Inc", repeated 3+ times across different files
- Pattern: 2+ distinct entity names appearing in 3+ files each

**Scoring rationale:**
- **Phase-Based: 0** - Neutral; phases don't organize by entity
- **Entity Clustering: +40** - Strong signal for entity-based organization
- **Artifact-Type: 0** - Neutral; formats don't relate to entities
- **Flat + Metadata: 0** - Neutral; could work but doesn't scale

**Why this matters:** Multiple entities with multiple documents each = strong use case for clustering by entity.

---

### 6. Mixed File Formats
**Detection method:** Check for 3+ distinct file extensions beyond markdown

**Detection signals:**
- Presence of: `.py`, `.js`, `.json`, `.csv`, `.pdf`, `.png`, `.jpg`
- Specifically: code files (.py, .js) + data files (.json, .csv) + images
- Threshold: 3+ non-markdown file types

**Scoring rationale:**
- **Phase-Based: 0** - Neutral; phases don't organize by format
- **Entity Clustering: 0** - Neutral; entities don't organize by format
- **Artifact-Type: +40** - Strong signal for format-based organization
- **Flat + Metadata: -10** - Mixing formats in flat structure is confusing

**Why this matters:** Different file types serve different purposes and are accessed with different tools. Separating them improves workflow.

---

### 7. Existing Subdirs by Phase
**Detection method:** Check for subdirectory names indicating workflow stages

**Detection patterns:**
- Names like: `research/`, `analysis/`, `drafts/`, `final/`, `archive/`
- Or: `1-research/`, `2-analysis/`, `3-drafts/` (numbered phases)
- Or: `raw-data/`, `processed/`, `deliverables/`

**Scoring rationale:**
- **Phase-Based: +30** - Already partially implemented; build on it
- **Entity Clustering: 0** - Doesn't fit entity pattern
- **Artifact-Type: 0** - Doesn't fit format pattern
- **Flat + Metadata: -10** - Conflicts with flat approach

**Why this matters:** Existing structure indicates user mental model. Reinforce rather than replace.

---

### 8. Existing Subdirs by Entity
**Detection method:** Check for subdirectory names matching entity names found in content

**Detection patterns:**
- Subdirectories named after companies: `acme-corp/`, `techstart/`
- Subdirectories named after people: `john-smith/`, `jane-doe/`
- Pattern: 2+ entity-based subdirectories

**Scoring rationale:**
- **Phase-Based: 0** - Doesn't fit phase pattern
- **Entity Clustering: +30** - Already partially implemented; complete it
- **Artifact-Type: 0** - Doesn't fit format pattern
- **Flat + Metadata: -10** - Conflicts with flat approach

**Why this matters:** Existing structure shows user already thinking in entity terms.

---

### 9. Existing Subdirs by Type
**Detection method:** Check for subdirectory names indicating file formats or artifact types

**Detection patterns:**
- Names like: `documents/`, `data/`, `scripts/`, `images/`, `uploads/`
- Or: `markdown/`, `json/`, `code/`, `assets/`
- Pattern: 2+ format/type-based subdirectories

**Scoring rationale:**
- **Phase-Based: 0** - Doesn't fit phase pattern
- **Entity Clustering: 0** - Doesn't fit entity pattern
- **Artifact-Type: +30** - Already partially implemented; formalize it
- **Flat + Metadata: -10** - Conflicts with flat approach

**Why this matters:** Existing artifact separation suggests technical project with clear format boundaries.

---

### 10. Deep Nesting (>3 Levels)
**Detection method:** Calculate maximum directory depth

**Detection calculation:**
- Count `/` in file paths from folder root
- Example: `folder/sub1/sub2/sub3/file.md` = 4 levels
- Threshold: >3 levels = deep nesting

**Scoring rationale:**
- **Phase-Based: -10** - Suggests over-complication; simplify
- **Entity Clustering: -10** - Suggests over-complication; simplify
- **Artifact-Type: -10** - Suggests over-complication; simplify
- **Flat + Metadata: +20** - Flatten and use metadata instead

**Why this matters:** Deep nesting hurts navigation. Research shows 2-3 levels optimal; >3 = diminishing returns.

---

### 11. Sequential Workflow Evident
**Detection method:** Look for indicators of linear progression in files

**Detection signals:**
- Version numbers in filenames: `v1`, `v2`, `v3`
- Status indicators: `draft`, `review`, `final`
- Workflow terms in content: "preliminary", "draft", "final report"
- Dated files showing progression over time

**Scoring rationale:**
- **Phase-Based: +20** - Sequential work aligns with phase-based structure
- **Entity Clustering: 0** - Workflow doesn't relate to entities
- **Artifact-Type: 0** - Workflow doesn't relate to formats
- **Flat + Metadata: 0** - Can track in metadata but structure doesn't help

**Why this matters:** Linear workflows benefit from phase-based organization showing progression.

---

### 12. Technical Project (Scripts Present)
**Detection method:** Check for code files indicating automation or data processing

**Detection signals:**
- Presence of: `.py`, `.js`, `.sh`, `.r`, `.ipynb`
- File names suggesting automation: `scraper.py`, `process.js`, `analyze.r`
- Pattern: 2+ script files

**Scoring rationale:**
- **Phase-Based: 0** - Phases don't help with code organization
- **Entity Clustering: 0** - Entities don't help with code organization
- **Artifact-Type: +30** - Code needs separation from docs and data
- **Flat + Metadata: 0** - Mixing code with docs is confusing

**Why this matters:** Technical projects need clear separation between code, data, and documentation.

---

## Scoring Logic

### Base Score Calculation

1. Start with score of 0 for each paradigm
2. For each criterion that applies:
   - Add or subtract points according to the matrix
   - Some criteria are mutually exclusive (e.g., file count ranges)
3. Sum scores to get final score for each paradigm (range: typically -40 to +100)

### Example Calculation

**Folder:** 23 files, 3 companies mentioned, some dated files, markdown only

| Criterion | Detected | Phase | Entity | Artifact | Flat |
|-----------|----------|-------|--------|----------|------|
| File count 15-40 | Yes | +20 | +20 | +10 | 0 |
| Multiple entities | Yes | 0 | +40 | 0 | 0 |
| Dated files | Yes | +20 | 0 | 0 | +10 |
| Mixed formats | No | 0 | 0 | 0 | 0 |
| **TOTAL** | | **40** | **60** | **10** | **10** |

**Result:** Entity Clustering wins (60 points)

---

## Recommendation Rules

### Primary Recommendation
- Highest scoring paradigm is recommended as primary

### Alternative Approaches
- Paradigms within 15 points of winner are mentioned as viable alternatives
- Scored paradigms shown in descending order with "Why considered" notes

### Special Cases

**Case 1: Flat + Metadata wins but file count >25**
- Recommendation: "Hybrid approach - Start with flat, plan for future organization"
- Reasoning: Flat structure approaching limit; will need reorganization soon

**Case 2: Two paradigms tie or very close (<5 points)**
- Recommendation: Present both as equal options
- Let user choose based on team preference and workflow

**Case 3: All scores very low (<30 for winner)**
- Recommendation: "Keep current structure" or "Simple flat with better naming"
- Reasoning: No clear organizational pattern; forcing structure may hurt more than help

**Case 4: Existing structure partially matches a paradigm**
- Bonus: +30 points to matching paradigm
- Reasoning: Build on existing mental model rather than replace

---

## Validation & Tuning

### How Scores Were Calibrated

Scores were calibrated based on:
1. Analysis of 5 real Sasha Studio project folders
2. Information architecture best practices (2-3 level hierarchy optimal)
3. User cognitive load research (7±2 items per category)
4. Empirical testing on diverse project types

### Known Edge Cases

**Edge case: Empty or nearly empty folder**
- All paradigms score low
- Recommendation: Wait until 10+ files before organizing

**Edge case: Chaotic mix with no clear pattern**
- Scores will be close
- Recommend simplest approach (Flat + Metadata) with future reorganization plan

**Edge case: Hybrid patterns (e.g., entities + phases)**
- Highest scorer wins, but note hybrid possibility in alternatives
- Example: "Entity folders with phase subdirectories inside each"

---

## Extending the Rubric

### Adding New Criteria

To add a new criterion:
1. Define detection method (how to identify from file scan)
2. Explain why it matters (organizational impact)
3. Assign point values to each paradigm (-40 to +40 range)
4. Test on diverse projects to validate
5. Update this document and SKILL.md

### Example: Adding "Collaboration Level" Criterion

**Detection:** Check for multiple author names in YAML frontmatter or git history
**Why it matters:** Collaborative projects need clearer structure
**Scoring:**
- Phase-Based: +10 (clear handoffs between phases)
- Entity Clustering: +10 (divide and conquer by entity)
- Artifact-Type: 0 (doesn't help collaboration)
- Flat + Metadata: -10 (harder to coordinate in flat structure)

---

## Troubleshooting Scores

### "Recommended paradigm doesn't match my intuition"

**Check:**
1. Review "Detected Patterns" in analysis - is detection accurate?
2. Check "Alternative Approaches" - was your preferred approach close?
3. Consider project maturity - recommendation may be forward-looking
4. Your use case may be unique - trust your judgment if you have good reasons

### "Scores seem wrong for my project"

**Possible causes:**
1. Detection didn't find key patterns - check "Detected Patterns" section
2. Project is in transition state (e.g., just added scripts to doc-only project)
3. Rubric optimizes for common patterns - yours may be uncommon
4. Consider running analysis again after cleaning up orphaned files

---

## Version History

- **v1.0 (2024-01-31)** - Initial rubric with 12 criteria

---

**Last reviewed:** 2024-01-31
**Maintained by:** Sasha
**Status:** Active

---

*This rubric translates folder characteristics into actionable organizational recommendations through systematic scoring.*
