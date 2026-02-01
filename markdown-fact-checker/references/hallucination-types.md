---
created: '2026-01-28'
---
# Common Hallucination Types

This reference catalogs the most frequent hallucination patterns that occur in Claude-generated markdown documents. Use this during Stage 1 (Claim Extraction) to recognize what to look for.

---

## URL Hallucinations

### Pattern: Plausible but Fake URLs

**Description**: Claude constructs logical-sounding URLs that don't actually exist

**Example**:
- Document: `https://example-company.com/about/leadership/team`
- Reality: Page doesn't exist (404)
- Why it happens: URL structure seems logical based on common patterns

**Detection Method**: WebFetch returns 404 or error

**Severity**: 🔴 CRITICAL

**How to Verify**:
```
WebFetch url="[URL]" prompt="Does this URL exist and load successfully?"
```

---

### Pattern: Real Domain, Wrong Path

**Description**: Domain exists but specific path doesn't

**Example**:
- Document: `https://company.com/products/enterprise/pricing`
- Reality: Domain loads, but `/products/enterprise/pricing` returns 404
- Actual path: `/pricing` (simpler structure)

**Detection Method**: Domain accessible, specific path 404s

**Severity**: 🔴 CRITICAL

**Common Variations**:
- Over-nested paths (`/about/company/team/executives` vs. `/team`)
- Assumed URL patterns from other sites
- Outdated URL structures

---

### Pattern: Outdated URLs

**Description**: URL existed in training data but has since changed

**Example**:
- Document: `https://company.com/blog/2023/announcement`
- Reality: Blog moved to `https://blog.company.com/announcement` or removed entirely

**Detection Method**: 404, redirect, or page removed notice

**Severity**: 🟡 IMPORTANT (if redirects) / 🔴 CRITICAL (if 404)

---

### Pattern: Invented Subdomains

**Description**: Adding subdomains that don't exist

**Example**:
- Document: `https://investors.company.com/reports`
- Reality: Company doesn't have `investors` subdomain
- Actual: `https://company.com/investor-relations`

**Detection Method**: DNS error or 404

**Severity**: 🔴 CRITICAL

---

## Quote Hallucinations

### Pattern: Paraphrasing as Direct Quote

**Description**: Presenting paraphrased content as a direct quotation

**Example**:
- Document: "John said 'We focus on operational excellence'"
- Source transcript: "I think our main strength is really around operational effectiveness"
- Issue: Similar meaning but not exact words, presented as direct quote

**Detection Method**: Grep finds near-match but not exact match

**Severity**: 🟡 IMPORTANT (misleading but meaning preserved)

**Acceptable Variation**: If presented as paraphrase (John noted that...) vs. direct quote

---

### Pattern: Composite Quotes

**Description**: Combining multiple statements from different parts of source into one "quote"

**Example**:
- Document: "We focus on growth and that growth focus drives everything we do"
- Source: Statement 1 (line 45): "We focus on growth"
- Source: Statement 2 (line 203): "That growth focus drives everything"
- Issue: Combined from different contexts

**Detection Method**: Parts found separately in source, not together

**Severity**: 🟡 IMPORTANT (if contexts similar) / 🔴 CRITICAL (if contexts differ)

**When Acceptable**: If clearly marked as synthesis and contexts align

---

### Pattern: Invented Quotes

**Description**: Quote attributed to source but doesn't exist anywhere

**Example**:
- Document: "Sarah stated 'Innovation is our core competitive advantage'"
- Source: No match found for this phrase or concept

**Detection Method**: Grep returns no results, Read shows no similar content

**Severity**: 🔴 CRITICAL

---

### Pattern: Quotelization Errors

**Description**: Over-editing quotes to remove filler words, changing meaning

**Example**:
- Source: "We tried to focus on growth but it was challenging"
- Document: "We focused on growth"
- Issue: Removed important qualifier ("tried to...but challenging")

**Detection Method**: Match found but key qualifiers removed

**Severity**: 🔴 CRITICAL (meaning changed) / ⚪ FALSE POSITIVE (meaning preserved)

**Acceptable Quotelization**:
- Source: "So, um, I think we, you know, focused on growth"
- Document: "We focused on growth"
- This is acceptable - filler words removed, meaning unchanged

---

### Pattern: Wrong Attribution

**Description**: Quote is real but attributed to wrong person

**Example**:
- Document: "John said 'We exceeded targets'"
- Source: Sarah said this, not John

**Detection Method**: Quote exists but attribution doesn't match

**Severity**: 🔴 CRITICAL

---

## Statistical Hallucinations

### Pattern: Transposed Digits

**Description**: Numbers with digits in wrong order

**Example**:
- Document: "Revenue of $1,540,000"
- Source: "Revenue of $1,450,000"
- Issue: Digits transposed (54 vs. 45)

**Detection Method**: Similar number found but not exact match

**Severity**: 🔴 CRITICAL

---

### Pattern: Wrong Magnitude

**Description**: Correct base number but wrong units/magnitude

**Example**:
- Document: "$1.5 billion"
- Source: "$1.5 million"
- Issue: Off by factor of 1,000

**Detection Method**: Number matches but units differ

**Severity**: 🔴 CRITICAL

**Common Variations**:
- Million vs. billion
- Thousands vs. millions
- Percentage vs. decimal (50% vs. 0.50)

---

### Pattern: Undisclosed Rounding

**Description**: Rounding numbers without qualifier

**Example**:
- Document: "50% growth"
- Source: "47.3% growth"
- Issue: Rounded without "approximately"

**Detection Method**: Close but not exact number

**Severity**: 🟡 IMPORTANT (add qualifier) / ⚪ FALSE POSITIVE (if "approximately" present)

**Fix**: Add "approximately", "about", or "~" to indicate rounding

---

### Pattern: Wrong Context/Time Period

**Description**: Correct number but from different time period or context

**Example**:
- Document: "2024 revenue was $5M"
- Source: "$5M revenue" (but this was 2023, not 2024)
- Issue: Number exists but wrong year

**Detection Method**: Number found but context doesn't match

**Severity**: 🔴 CRITICAL

---

### Pattern: Percentage vs. Absolute Numbers

**Description**: Confusing percentage change with absolute numbers

**Example**:
- Document: "Increased by 50 customers"
- Source: "Increased by 50%" (from 100 to 150 customers)
- Issue: Percentage vs. absolute count

**Detection Method**: Number matches but interpretation differs

**Severity**: 🔴 CRITICAL

---

## Name/Organization Hallucinations

### Pattern: Similar Name Confusion

**Description**: Confusing entities with similar names

**Example**:
- Document: "Partnership with Acme Technologies"
- Source: "Partnership with Acme Corporation"
- Issue: Different companies despite similar names

**Detection Method**: Name variation found, need to verify if same entity

**Severity**: 🔴 CRITICAL (different entities) / ⚪ FALSE POSITIVE (same entity, acceptable variation)

**How to Distinguish**:
- Check if source uses both variations interchangeably
- Verify legal entity names
- Look for context clues (different industries, locations)

---

### Pattern: Spelling Inconsistencies

**Description**: Same entity spelled differently throughout document

**Example**:
- Line 10: "Acme Corp"
- Line 45: "Acme Corporation"
- Line 82: "ACME Inc."
- Issue: Inconsistent spelling of same company

**Detection Method**: Multiple variations found via Grep

**Severity**: 🟢 MINOR (if clearly same entity) / 🔴 CRITICAL (if might be different entities)

---

### Pattern: Title/Role Errors

**Description**: Wrong title or role for person

**Example**:
- Document: "John Smith, CEO of Acme"
- Source: "John Smith, President of Acme"
- Issue: CEO vs. President

**Detection Method**: Name found but title doesn't match

**Severity**: 🟡 IMPORTANT

**Common Confusions**:
- CEO vs. President
- VP vs. Director
- Managing Director vs. Director
- Founder vs. CEO

---

### Pattern: Inventing Middle Initials or Full Names

**Description**: Adding details not in source

**Example**:
- Document: "John A. Smith"
- Source: "John Smith" (no middle initial provided)

**Detection Method**: Extra information not in source

**Severity**: 🟡 IMPORTANT (implies knowledge not in source)

---

## Date/Timeline Hallucinations

### Pattern: Year Transposition

**Description**: Swapping years (especially recent years)

**Example**:
- Document: "Founded in 2024"
- Source: "Founded in 2023"
- Issue: Off by one year

**Detection Method**: Similar date, year differs

**Severity**: 🔴 CRITICAL

**High Risk Dates**:
- Recent years (2023 vs. 2024)
- Training data cutoff period
- Future dates (especially if source says "planned 2024" and document states "completed 2024")

---

### Pattern: Sequence Errors

**Description**: Getting chronological order wrong

**Example**:
- Document: "After acquiring Company B, they launched Product X"
- Source: Product X launched in 2020, Company B acquired in 2022
- Issue: Reversed chronology

**Detection Method**: Timeline doesn't match source sequence

**Severity**: 🔴 CRITICAL

---

### Pattern: Date Format Confusion

**Description**: Misinterpreting date formats (especially MM/DD vs. DD/MM)

**Example**:
- Document: "Event on March 6th"
- Source: "Event on 06/03" (could be June 3rd or March 6th depending on format)
- Issue: Format ambiguity

**Detection Method**: Date exists but interpretation may differ

**Severity**: 🟡 IMPORTANT (verify format convention)

---

### Pattern: Relative Date Errors

**Description**: Misinterpreting "recent," "last year," "this quarter"

**Example**:
- Document: "Recent announcement in Q2 2024"
- Source written in 2023: "Recent announcement last quarter" (Q3 2023)
- Issue: "Recent" relative to source date, not current date

**Detection Method**: Relative terms interpreted from wrong timeframe

**Severity**: 🔴 CRITICAL

---

## Attribution Hallucinations

### Pattern: Vague Attribution

**Description**: Using unverifiable attributions

**Examples**:
- "Studies show..."
- "Experts agree..."
- "Research indicates..."
- "Industry analysts estimate..."
- "According to reports..."

**Issue**: No specific source to verify against

**Detection Method**: No citation follows vague attribution

**Severity**: 🟡 IMPORTANT (add specific source) / N/A UNVERIFIABLE (if cannot find source)

---

### Pattern: Wrong Source Attribution

**Description**: Fact is real but attributed to wrong source

**Example**:
- Document: "According to Company A's annual report, market share is 25%"
- Source: 25% statistic is from Company B's report, not Company A

**Detection Method**: Fact exists but in different source

**Severity**: 🔴 CRITICAL

---

### Pattern: Over-Confident Attribution

**Description**: Presenting uncertain information as definitive

**Example**:
- Document: "Company confirmed they will launch in Q3"
- Source: "Company is considering Q3 launch"
- Issue: "Confirmed" vs. "considering"

**Detection Method**: Source language less definitive than document

**Severity**: 🟡 IMPORTANT

---

## Technical/Domain-Specific Hallucinations

### Pattern: Confident Wrongness on Technical Details

**Description**: Precise but incorrect technical specifications

**Example**:
- Document: "Built on PostgreSQL 15.2 with Redis caching"
- Source: No mention of specific database or versions
- Issue: Inventing plausible technical details

**Detection Method**: Specific technical claims not in source

**Severity**: 🔴 CRITICAL

---

### Pattern: Outdated Technical Information

**Description**: Accurate in training data but outdated now

**Example**:
- Document: "Latest version is 3.5"
- Reality: Latest version is now 4.2
- Issue: Training data staleness

**Detection Method**: Version numbers don't match current reality

**Severity**: 🟡 IMPORTANT (if recent changes) / 🔴 CRITICAL (if significantly outdated)

---

### Pattern: Mixing Features Across Products

**Description**: Combining features from different products/versions

**Example**:
- Document: "Product X includes features A, B, and C"
- Source: Features A and B in Product X, Feature C only in Product Y
- Issue: Conflating different products

**Detection Method**: Features found but in different products

**Severity**: 🔴 CRITICAL

---

## Scope/Scale Hallucinations

### Pattern: Expanding Scope

**Description**: Claiming broader scope than source supports

**Example**:
- Document: "Company operates in 50 countries"
- Source: "Company has customers in 50 countries"
- Issue: Customers ≠ operations

**Detection Method**: Source supports narrower claim

**Severity**: 🟡 IMPORTANT

---

### Pattern: Unsupported Superlatives

**Description**: Adding "best," "only," "most," "first" without support

**Examples**:
- Document: "The industry's best solution"
- Source: "A leading solution"
- Issue: "Best" is subjective and unsupported

**Detection Method**: Superlative in document, not in source

**Severity**: 🟡 IMPORTANT (remove superlative or add support)

---

## Cross-Document Inconsistencies

### Pattern: Internal Contradictions

**Description**: Same fact stated differently in different sections

**Example**:
- Section 1: "Founded in 2020"
- Section 3: "Since founding in 2019"
- Issue: Inconsistent dates within same document

**Detection Method**: Cross-document Grep finds conflicting facts

**Severity**: 🔴 CRITICAL

---

### Pattern: Synthesis Errors

**Description**: Combining information from multiple sources incorrectly

**Example**:
- Source A: "Company X has 200 employees"
- Source B: "Company Y has 300 employees"
- Document: "Company X has 300 employees"
- Issue: Mixed up which company has which count

**Detection Method**: Correct facts but misattributed or combined wrongly

**Severity**: 🔴 CRITICAL

---

## Summary Table: Hallucination Risk by Claim Type

| Claim Type | Risk Level | Most Common Patterns | Primary Detection Tool |
|------------|------------|---------------------|----------------------|
| URLs | 🔴 HIGH | Plausible but fake, wrong paths | WebFetch |
| Quotes | 🔴 HIGH | Paraphrasing as direct, invented | Grep + Read |
| Statistics | 🟡 MEDIUM | Transposed digits, wrong magnitude | Grep + Read |
| Names/Orgs | 🟡 MEDIUM | Similar name confusion, title errors | Grep |
| Dates | 🟡 MEDIUM | Year transposition, sequence errors | Grep + Read |
| Technical Specs | 🟢 LOW | Outdated info, overly specific | Read |
| Attributions | 🟡 MEDIUM | Vague ("studies show"), wrong source | Source checking |

---

## How to Use This Reference

**During Claim Extraction**:
1. Scan document for claim types listed above
2. Flag high-risk categories for thorough verification
3. Note patterns that appear in the document

**During Verification**:
1. Match observed discrepancies to patterns in this guide
2. Use detection methods specified for each pattern
3. Assign severity based on pattern type

**Before Finalizing Report**:
1. Cross-reference flagged issues with false-positives.md
2. Ensure severity classifications align with patterns
3. Note if new patterns emerged (update this guide)

---

**Last Updated**: 2026-01-28
**Version**: 1.0
