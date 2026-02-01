---
created: '2026-01-28'
---
# Verification Procedures

Complete step-by-step procedures for fact-checking markdown documents. Follow these four stages sequentially for thorough verification.

---

## Stage 1: Claim Extraction

### Step 1.1: Read Document Completely

First, read the entire document to understand scope and context.

```bash
Read file_path="/path/to/document.md"
```

**What to Note**:
- Document purpose (research report, EA summary, analysis, etc.)
- Primary claims and assertions
- Source citations present (or absent)
- Section structure

---

### Step 1.2: Identify Factual Claims

Create a systematic inventory of all factual claims in the document.

**Claim Inventory Template**:

```markdown
## Fact Check Claim Inventory

**Document**: [filename.md]
**Date**: [YYYY-MM-DD]

### URLs ([X] found)
1. [URL] - Line [N] - Context: [Brief description]
2. [URL] - Line [N] - Context: [Brief description]

### Quotes ([Y] found)
1. "[Quote text]" - Line [N] - Attributed to: [Person/Source]
2. "[Quote text]" - Line [N] - Attributed to: [Person/Source]

### Statistics ([Z] found)
1. [Stat] - Line [N] - Source: [Citation if present]
2. [Stat] - Line [N] - Source: [Citation if present]

### Names/Organizations ([A] found)
1. [Name/Org] - Line [N] - Context: [Brief]
2. [Name/Org] - Line [N] - Context: [Brief]

### Dates ([B] found)
1. [Date] - Line [N] - Context: [Event described]
2. [Date] - Line [N] - Context: [Event described]

### Technical Specifications ([C] found)
1. [Spec] - Line [N] - Context: [Brief]

### Other Factual Claims ([D] found)
1. [Claim] - Line [N] - Type: [Category]
```

---

### Step 1.3: Categorize by Risk Level

Prioritize verification efforts based on hallucination risk.

**🔴 HIGH RISK** (verify all):
- All URLs (very high hallucination rate)
- Direct quotes (frequently paraphrased or invented)
- Critical statistics (often misremembered)

**🟡 MEDIUM RISK** (verify selectively):
- Names/organizations (spelling and attribution)
- Dates and timelines (transposition errors)
- Non-critical statistics

**🟢 LOW RISK** (spot-check):
- Technical specifications (usually accurate)
- Common knowledge claims
- Subjective assessments

**Prioritization Strategy**:
1. Start with HIGH RISK claims
2. If HIGH RISK verification finds 3+ errors → expand to all claims
3. If HIGH RISK verification finds 0-2 errors → selective MEDIUM/LOW verification

---

### Step 1.4: Flag Unsourced Claims

Identify claims that should have sources but don't.

**Red Flags**:
- Specific statistics with no citation
- Direct quotes with no attribution
- Claims presented as facts with no verifiable source
- "Studies show..." / "Research indicates..." with no citation

**Action**: Mark these as "UNVERIFIABLE - needs sourcing" for report

---

## Stage 2: Source Identification

### Step 2.1: Map Citations to Sources

For each claim, determine its claimed provenance.

**Source Types**:
1. **Explicit Citation**: Document clearly states source
   - Example: "According to company-report.md, revenue was $5M"
   - Example: "As stated on their website (https://...), they have 200 employees"

2. **Implicit Source**: Context suggests likely source
   - Example: In EA document, quotes likely from interview transcripts
   - Example: In research report, statistics likely from documents in project folder

3. **No Source**: Claim has no identifiable source
   - Example: "Studies show 60% improvement"
   - Example: Unsourced statistics or claims

**Source Mapping Template**:

```markdown
## Source Map

**Claim**: "[factual claim]"
- **Claimed Source**: [What document says OR best guess from context]
- **Source Type**: [Explicit / Implicit / No Source]
- **Source Location**: [File path / URL / Unknown]
- **Source Accessible**: [Yes / No / Unknown]
- **Verification Method**: [WebFetch / Read / Grep / Cannot verify]
```

---

### Step 2.2: Verify Source Accessibility

Before attempting verification, check if sources are accessible.

**For URLs**:
```bash
WebFetch url="[URL]" prompt="Does this URL exist and load successfully (200 response)?"
```

**Outcomes**:
- ✅ 200 response → Proceed to content verification
- ❌ 404/error → Mark as 🔴 CRITICAL (URL doesn't exist)
- ⚠️ Redirect → Note redirect, verify final destination
- 🔒 Auth required → Mark as N/A UNVERIFIABLE

---

**For Local Files**:
```bash
# Check if file exists
Bash command="ls -la /path/to/source/file.md" description="Check if source file exists"
```

**Outcomes**:
- ✅ File exists → Proceed to content verification
- ❌ File not found → Mark as N/A UNVERIFIABLE (note: might be legitimate issue)

---

**For External Sources** (research databases, proprietary sources):
- Document whether source is accessible
- If not accessible, mark as N/A UNVERIFIABLE
- Note in report that verification was attempted but source inaccessible

---

### Step 2.3: Build Verification Plan

Organize claims by verification method.

**Verification Plan Template**:

```markdown
## Verification Plan

### Group A: WebFetch (URLs)
- [URL 1] → Check exists + content
- [URL 2] → Check exists + content
[Total: X URLs]

### Group B: Read + Grep (Quotes from files)
- Quote 1 from transcript.md → Grep exact phrase
- Quote 2 from report.md → Read context
[Total: Y quotes]

### Group C: Grep (Statistics from files)
- Stat 1 from source-A.md → Grep for number
- Stat 2 from source-B.md → Grep for number
[Total: Z statistics]

### Group D: Cross-reference (Names/Dates)
- Check consistency across document
- Spot-check against sources
[Total: A names, B dates]

### Group E: Unverifiable
- Claim 1 - no source provided
- Claim 2 - source not accessible
[Total: C unverifiable]
```

---

## Stage 3: Verification

### Procedure 3A: URL Verification

**Objective**: Verify URLs exist and content matches claims

#### Step 1: Check URL Exists

```bash
WebFetch url="[URL]" prompt="Does this URL exist and return a 200 response? If there's an error, what type of error is it (404, 500, timeout, etc.)?"
```

**Interpret Results**:
- ✅ **200 Success** → Proceed to content verification
- ❌ **404 Not Found** → 🔴 CRITICAL - URL doesn't exist
- ⚠️ **Redirect (301/302)** → Note final URL, verify content at destination
- ❌ **500 Server Error** → Retry once, then mark as ⚪ UNVERIFIABLE (temporary issue)
- ❌ **DNS Error** → 🔴 CRITICAL - Domain doesn't exist
- 🔒 **403 Forbidden / Auth Required** → Mark as N/A UNVERIFIABLE

---

#### Step 2: Verify Content Matches Claim

**If URL accessible**, verify the page content matches what document says.

```bash
WebFetch url="[URL]" prompt="Does this page mention [specific claim from document]? If so, quote the relevant section. If not, briefly describe what the page is actually about."
```

**Scoring Content Match**:
- **Exact match** (same words) → 95-100% confidence
- **Close match** (same concept, different words) → 80-94% confidence
- **Related content** (on same topic but different specifics) → 50-79% confidence
- **No match** (different content entirely) → 0-49% confidence → 🔴 CRITICAL

**Record Finding**:
```markdown
### URL Verification: [URL]

**Claim**: Document states "[what document claims about this URL]"

**Verification**:
- URL Status: [200 / 404 / error type]
- Content Match: [Exact / Close / Related / None]
- Confidence: [0-100%]

**Evidence**:
[Paste relevant excerpt from WebFetch response]

**Severity**: [🔴/🟡/🟢/⚪]

**Recommendation**: [Fix URL / Update description / Accept / etc.]
```

---

### Procedure 3B: Quote Verification

**Objective**: Verify quotes exist in source files with proper context

#### Step 1: Locate Source File

If file path is known:
```bash
Read file_path="/path/to/source.md"
```

If file path is unknown but can be inferred:
```bash
# Search for files that might contain the quote
Glob pattern="**/*interview*.md" path="/base/directory"
Glob pattern="**/*transcript*.md" path="/base/directory"
```

---

#### Step 2: Search for Exact Quote

```bash
# Try exact phrase first
Grep pattern="exact quote text here" path="/path/to/source.md" output_mode="content"
```

**If exact match fails**, try key phrases:
```bash
# Search for distinctive phrases from the quote
Grep pattern="distinctive phrase" path="/path/to/source.md" output_mode="content"
```

**Interpret Results**:
- ✅ **Exact match found** → 95-100% confidence
- ⚠️ **Near match found** (paraphrase) → 60-89% confidence
- ❌ **No match found** → Try broader search
- ❌ **Still no match** → 0-49% confidence → 🔴 CRITICAL (likely invented)

---

#### Step 3: Verify Context

Once quote is located, check surrounding context:

```bash
# Get context around quote
Grep pattern="quote text" path="/source.md" output_mode="content" -C=3
```

**Context Verification Checklist**:
- [ ] Quote used in same sense as original?
- [ ] Attribution correct (right person)?
- [ ] Context supports how quote is used in document?
- [ ] Any important qualifiers removed?

**Context Issues**:
- ⚪ **Quotelization** (filler words removed, meaning preserved) → Acceptable
- 🟡 **Minor context shift** (different emphasis) → IMPORTANT
- 🔴 **Meaning changed** (quote out of context) → CRITICAL

---

#### Step 4: Check Direct Quote vs. Paraphrase

**If presented as direct quote** (in quotation marks):
- Must be exact or near-exact match
- Acceptable: Removing filler words ("um," "uh," "you know")
- Acceptable: Grammar corrections for readability
- NOT acceptable: Changing words that alter meaning

**If presented as paraphrase** (not in quotes):
- Match can be looser
- Meaning must be preserved
- Attribution must be correct

**Scoring**:
```markdown
### Quote Verification: "[quote]"

**Claim**: Document presents as [direct quote / paraphrase]
**Attributed to**: [Person/Source]

**Verification**:
- Match Type: [Exact / Near-exact / Paraphrase / Different / Not found]
- Attribution: [Correct / Wrong / Unclear]
- Context: [Preserved / Shifted / Misrepresented]
- Confidence: [0-100%]

**Source Location**: [file:line or "not found"]

**Evidence**:
**Source text**: "[actual text from source]"
**Document text**: "[text in document]"
**Difference**: [Describe any discrepancies]

**Severity**: [🔴/🟡/🟢/⚪]

**Recommendation**: [Accept / Fix paraphrase / Add attribution / etc.]
```

---

### Procedure 3C: Statistical Verification

**Objective**: Verify numbers match sources with correct units and context

#### Step 1: Locate Statistic in Source

```bash
# Search for the exact number
Grep pattern="[number]" path="/path/to/source.md" output_mode="content"

# If not found, try variations:
# - With/without commas: 1,450 vs 1450
# - Different formats: 1.5M vs 1,500,000
# - Percentage formats: 50% vs 0.50
```

---

#### Step 2: Verify Exact Match

**Check all components**:
- [ ] Number matches exactly (or rounding disclosed)
- [ ] Units correct (%, $, thousands, millions, billions)
- [ ] Context matches (same time period, same metric)
- [ ] Attribution present and correct

**Common Mismatches**:
- Number close but not exact → Check if rounding disclosed
- Number exact but wrong units → 🔴 CRITICAL
- Number exact but wrong time period → 🔴 CRITICAL
- Number exact but wrong attribution → 🔴 CRITICAL

---

#### Step 3: Evaluate Rounding

**If number doesn't match exactly**:

```markdown
Document: 50%
Source: 47.3%

Evaluation:
- Difference: 2.7 percentage points
- Has qualifier? Check for "approximately", "about", "~", "around"
- If YES → ⚪ FALSE POSITIVE (acceptable rounding)
- If NO → 🟡 IMPORTANT (add qualifier)
```

**Acceptable Rounding**:
- WITH qualifier: 47.3% → "approximately 50%" ✅
- WITH qualifier: 1,473 → "about 1,500" ✅
- WITHOUT qualifier: 47.3% → "50%" ❌ (add "approximately")

---

#### Step 4: Record Finding

```markdown
### Statistic Verification: [statistic]

**Claim**: "[full claim from document with number]"
**Source**: [file or URL where number should be]

**Verification**:
- Number Match: [Exact / Rounded / Different / Not found]
- Units Match: [Yes / No / N/A]
- Context Match: [Yes / No / Unclear]
- Rounding Disclosed: [Yes / No / N/A]
- Confidence: [0-100%]

**Evidence**:
**Source**: "[actual text with number from source]"
**Document**: "[text with number from document]"
**Discrepancy**: [Describe any differences]

**Severity**: [🔴/🟡/🟢/⚪]

**Recommendation**: [Fix number / Add qualifier / Correct units / etc.]
```

---

### Procedure 3D: Name/Organization Verification

**Objective**: Verify spelling consistency and correct attribution

#### Step 1: Find All Mentions

```bash
# Search for name/organization throughout document
Grep pattern="[Name or Organization]" path="/document-to-audit.md" output_mode="content"

# Also search likely source documents
Grep pattern="[Name or Organization]" path="/source-documents/" output_mode="content"
```

---

#### Step 2: Check Spelling Consistency

**Within Document**:
- Are all spellings consistent?
- Example variations: "Acme Corp" vs "Acme Corporation" vs "ACME Inc."

**Against Sources**:
- Does spelling match source documents?
- Are variations acceptable (e.g., "Corp" vs "Corporation" for same entity)?

**Evaluation**:
- ✅ Consistent throughout, matches sources → No issue
- ⚪ Minor variations, clearly same entity → FALSE POSITIVE
- 🟢 Inconsistent but all variations valid → MINOR (standardize)
- 🔴 Wrong entity name → CRITICAL

---

#### Step 3: Verify Entity Identity

**Critical Question**: Are we talking about the same entity?

**Warning Signs** of entity confusion:
- Similar names in same industry (Acme Corp vs. Acme Technologies)
- Parent company vs. subsidiary
- Acquired company (old name vs. new name)

**Verification Method**:
```bash
# Search for context clues in sources
Grep pattern="[Name]" path="/sources/" output_mode="content" -C=2

# Look for:
# - Industry/sector mentions
# - Location/geography
# - Products/services
# - People associated with entity
```

**If different entities confused**: 🔴 CRITICAL

---

#### Step 4: Verify Titles/Roles

For people, check titles match sources:

```bash
Grep pattern="[Person Name]" path="/sources/" output_mode="content"
```

**Check**:
- Title matches (CEO, President, VP, Director, etc.)
- Current vs. former role clearly indicated
- Attribution correct

**Common Issues**:
- 🟡 Title incorrect or outdated
- 🔴 Wrong person associated with role
- 🟢 Acceptable abbreviation (CEO vs. Chief Executive Officer)

---

### Procedure 3E: Date/Timeline Verification

**Objective**: Verify dates are accurate and chronologically consistent

#### Step 1: Locate Dates in Sources

```bash
# Search for specific date
Grep pattern="[date or year]" path="/sources/" output_mode="content"

# Search for related time references
Grep pattern="[event name]" path="/sources/" output_mode="content"
```

---

#### Step 2: Verify Date Accuracy

**Check**:
- [ ] Date matches source exactly
- [ ] Date format interpreted correctly (MM/DD vs. DD/MM)
- [ ] "Recent" or relative dates interpreted correctly
- [ ] Future vs. past correctly indicated

**Common Errors**:
- Year transposition (2023 vs. 2024)
- Month confusion (June vs. January)
- Relative date misinterpretation ("last year" from old document)

---

#### Step 3: Verify Chronological Logic

**Timeline Check**:
- Events in correct sequence?
- "Before" and "after" relationships accurate?
- Time periods make sense?

**Example Check**:
```markdown
Document claims: "After founding in 2020, they launched Product X in 2019"
Issue: Timeline impossible (can't launch product before founding)
Severity: 🔴 CRITICAL
```

---

### Procedure 3F: Cross-Reference Verification

**Objective**: Boost confidence through multiple confirming sources

**When to Use**:
- Claim appears in multiple sources
- Critical facts that need high confidence
- When single-source verification is ambiguous

#### Step 1: Identify All Sources with Information

```bash
# Find all files mentioning the claim
Grep pattern="[claim or keyword]" path="/all-sources/" output_mode="files_with_matches"
```

---

#### Step 2: Compare Versions Across Sources

**Read each source** to see if they agree:
```bash
Read file_path="/source1.md"
Read file_path="/source2.md"
Read file_path="/source3.md"
```

**Compare**:
- Do all sources present same facts?
- Are there contradictions?
- Which source is most authoritative?
- Are differences explainable (e.g., different time periods)?

---

#### Step 3: Adjust Confidence Based on Cross-References

**Confidence Boost**:
- 3+ consistent sources → +15-20% confidence
- 2 consistent sources → +10% confidence
- Single source only → No boost

**Confidence Penalty**:
- Contradictory sources → -10-20% confidence
- Sources disagree → Flag for investigation

---

## Stage 4: Documentation and Reporting

### Step 4.1: Record Each Finding

For every verified claim, document:

```markdown
### Claim #[N]: [Brief description]

**Type**: [URL / Quote / Statistic / Name / Date / Other]

**Claim**: "[exact text from document]"
- **Location**: Line [N] / Section: [section name]
- **Claimed Source**: [what document says OR inferred]

**Verification Process**:
- **Method Used**: [WebFetch / Read / Grep / Cross-reference]
- **Sources Checked**: [list of files/URLs verified]
- **Finding**: [Verified / False / Partially correct / Unverifiable]

**Results**:
- **Match Quality**: [Exact / Close / Partial / None]
- **Context Preserved**: [Yes / No / Partially]
- **Attribution Correct**: [Yes / No / N/A]
- **Confidence Score**: [0-100% or N/A]

**Evidence**:
[Quote relevant verification output - what you found in sources]

**Severity Assessment**:
- **Classification**: [🔴 CRITICAL / 🟡 IMPORTANT / 🟢 MINOR / ⚪ FALSE POSITIVE]
- **Rationale**: [Why this severity?]

**Recommendation**:
[Specific, actionable fix - e.g., "Change URL to..." or "Rephrase as paraphrase" or "Add 'approximately'"]
```

---

### Step 4.2: Categorize by Severity

Group all findings:

**🔴 CRITICAL Issues** (must fix before delivery):
- Fake URLs
- Invented quotes
- Wrong numbers
- Misattributed claims
- Wrong entity names

**🟡 IMPORTANT Issues** (should fix for quality):
- Paraphrases presented as direct quotes
- Missing sources
- Context not fully preserved
- Undisclosed rounding

**🟢 MINOR Issues** (fix if time allows):
- Formatting inconsistencies
- Spelling variations of same entity
- Minor improvements

**⚪ FALSE POSITIVES** (acceptable, document why):
- Quotelization with meaning preserved
- Reasonable rounding with qualifier
- Acceptable name variations

---

### Step 4.3: Generate Verification Report

Use the template from [output-template.md](output-template.md) to create structured report.

**Report Must Include**:
1. **Executive Summary**: Total claims, verification rate, issues found
2. **Critical Issues**: All 🔴 items with evidence and recommendations
3. **Important Issues**: All 🟡 items with recommendations
4. **False Positives**: All ⚪ items with explanations
5. **Unverifiable Claims**: All N/A items with reasons
6. **Verification Coverage**: What % of document was checked
7. **Recommendations**: Priority actions for document improvement

---

## Verification Workflow Summary

```
START
  ↓
[Stage 1: Claim Extraction]
  → Read document
  → Identify all factual claims
  → Categorize by type and risk
  → Create claim inventory
  ↓
[Stage 2: Source Identification]
  → Map each claim to source
  → Verify source accessibility
  → Build verification plan
  ↓
[Stage 3: Verification]
  → Execute verification by type:
     • URLs: WebFetch
     • Quotes: Read + Grep
     • Statistics: Grep + context check
     • Names: Grep + consistency check
     • Dates: Cross-reference timeline
  → Assign confidence scores
  → Classify severity
  ↓
[Stage 4: Documentation]
  → Record each finding
  → Categorize by severity
  → Generate report
  → Provide recommendations
  ↓
COMPLETE
```

---

## Tool Usage Quick Reference

| Task | Tool | Command Pattern |
|------|------|----------------|
| Check URL exists | WebFetch | `WebFetch url="[URL]" prompt="Does URL exist?"` |
| Check URL content | WebFetch | `WebFetch url="[URL]" prompt="Does page contain [claim]?"` |
| Read source file | Read | `Read file_path="/path/to/file.md"` |
| Find exact quote | Grep | `Grep pattern="exact text" path="/file" output_mode="content"` |
| Find quote with context | Grep | `Grep pattern="text" path="/file" output_mode="content" -C=3` |
| Find all mentions | Grep | `Grep pattern="text" path="/dir" output_mode="files_with_matches"` |
| Find files by pattern | Glob | `Glob pattern="**/*keyword*.md" path="/dir"` |
| Check file exists | Bash | `ls -la /path/to/file.md` |

---

**Last Updated**: 2026-01-28
**Version**: 1.0
