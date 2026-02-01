---
created: '2026-01-28'
---
# Fact Checking Examples

This reference provides real-world examples of fact-checking outcomes with complete verification trails. Use these examples to understand how to apply verification procedures and confidence scoring in practice.

---

## Example 1: URL Hallucination Detected (CRITICAL)

### Document Claim

**Line 45**: "According to their website (https://example-company.com/about/leadership), the executive team has 15 members."

### Verification Process

**Step 1: Check URL Exists**
```bash
WebFetch url="https://example-company.com/about/leadership" prompt="Does this URL exist and load successfully?"
```

**Result**:
```
Error: 404 - Page not found
```

**Step 2: Check if Domain Exists**
```bash
WebFetch url="https://example-company.com" prompt="Does this domain exist? What is the homepage about?"
```

**Result**:
```
Website loads successfully. This is Example Company's official site. Homepage mentions leadership but no direct /about/leadership path visible.
```

**Step 3: Search for Actual Leadership Page**
```bash
WebFetch url="https://example-company.com/about" prompt="Does this page exist? Does it link to leadership/team information?"
```

**Result**:
```
Found: Leadership page exists at https://example-company.com/about/team (not /about/leadership)
Content: Page shows 12 executive team members with photos and bios.
```

### Finding

**URL Status**: ❌ Wrong path (404 error)

**Content**: ❌ Wrong number (12 executives, not 15)

**Confidence Score**: 0% (verified as false on both URL and content)

### Severity Classification

**Severity**: 🔴 CRITICAL - Wrong URL + wrong number

**Issues**:
1. URL path incorrect (/about/leadership should be /about/team)
2. Number incorrect (12 executives, not 15)

### Evidence

```markdown
**Claimed URL**: https://example-company.com/about/leadership
**Actual URL**: https://example-company.com/about/team
**Claimed Number**: 15 members
**Actual Number**: 12 members (verified on actual page)
```

### Recommendation

"Fix URL to https://example-company.com/about/team and update executive count to 12 members based on verified website content."

---

## Example 2: Paraphrased Quote (FALSE POSITIVE)

### Document Claim

**Line 67**: "In the interview, John said 'We prioritize customer satisfaction above all else.'"

### Verification Process

**Step 1: Search for Exact Quote**
```bash
Grep pattern="customer satisfaction above all else" path="/transcripts/john-interview.md" output_mode="content"
```

**Result**: No exact match found

**Step 2: Search for Key Phrases**
```bash
Grep pattern="customer satisfaction" path="/transcripts/john-interview.md" output_mode="content"
```

**Result**: Found 2 matches

**Step 3: Read Context**
```bash
Grep pattern="customer satisfaction" path="/transcripts/john-interview.md" output_mode="content" -C=3
```

**Result**:
```
Line 156-162:
Q: What's your primary focus as CEO?
A: I think our main focus is really on making sure customers are satisfied. Like, that's what matters most to us, you know? If we keep customers happy, everything else tends to fall into place.
```

### Analysis

**Quote in Document**: "We prioritize customer satisfaction above all else"

**Actual Quote**: "I think our main focus is really on making sure customers are satisfied... that's what matters most to us"

**Comparison**:
- **Core meaning**: Customer satisfaction is top priority ✅
- **Context**: Same - discussing CEO's primary focus ✅
- **Words**: Different but convey same idea
- **Filler words removed**: "I think", "really", "like", "you know" - acceptable quotelization
- **Paraphrase**: "prioritize...above all else" vs. "matters most" - similar meaning

### Finding

**Match Type**: Paraphrase with meaning preserved

**Confidence Score**: 85% (strong match in meaning, context identical)

### Severity Classification

**Initial Assessment**: 🟡 IMPORTANT - Presented as direct quote but is paraphrase

**After Review**: ⚪ FALSE POSITIVE - Acceptable quotelization

**Rationale**:
- This is standard quotelization practice
- Filler words removed for readability
- Core message perfectly preserved
- Context identical (CEO's top priority)
- "Prioritize above all else" = "matters most to us"

### Recommendation

"Accept as-is. This is acceptable quotelization. Original meaning and context fully preserved. Filler words appropriately removed for document readability."

**Alternative**: If strict exactness required, could rephrase as: "John noted that customer satisfaction is their main focus: 'that's what matters most to us.'"

---

## Example 3: Statistical Error Detected (CRITICAL)

### Document Claim

**Line 89**: "The company reported 50% revenue growth in 2023"

### Verification Process

**Step 1: Locate Source Document**

Document references "company annual report" as source.

**Step 2: Search for Revenue Growth**
```bash
Read file_path="/source-docs/company-annual-report-2023.pdf"
```

Then search for "revenue growth":
```bash
Grep pattern="revenue growth|revenue grew" path="/source-docs/company-annual-report-2023.pdf" output_mode="content"
```

**Result**:
```
Line 45: "Full-year 2023 revenue grew 38% year-over-year, driven by strong performance in our core markets."
```

### Finding

**Claimed**: 50% revenue growth

**Actual**: 38% revenue growth

**Discrepancy**: 12 percentage points difference (significant)

**Confidence Score**: 0% (verified as factually incorrect)

### Severity Classification

**Severity**: 🔴 CRITICAL - Factually incorrect statistic

**Rationale**:
- Number is verifiably wrong (not rounding or interpretation)
- Material difference (38% vs. 50%)
- Direct contradiction of primary source
- No qualifier to suggest approximation

### Evidence

```markdown
**Document Claim**: "50% revenue growth in 2023"
**Source**: company-annual-report-2023.pdf, Line 45
**Actual Text**: "Full-year 2023 revenue grew 38% year-over-year"
**Discrepancy**: 12 percentage point error
```

### Recommendation

"Correct to '38% revenue growth in 2023' per company annual report. Ensure all statistics are directly copied from source documents to avoid errors."

---

## Example 4: Unverifiable Claim (NEEDS SOURCING)

### Document Claim

**Line 56**: "Industry analysts estimate the market will grow 25% annually over the next five years."

### Verification Process

**Step 1: Search for Citation**

Read document section - no source cited for this claim.

**Step 2: Search Source Files**
```bash
Grep pattern="industry analysts|analysts estimate|25% annual" path="/source-docs/" output_mode="files_with_matches"
```

**Result**: No matches found

**Step 3: Search for "market growth" in Sources**
```bash
Grep pattern="market growth|market will grow" path="/source-docs/" output_mode="content"
```

**Result**: Found references to market growth but no 25% annual figure

### Finding

**Verification Status**: N/A - UNVERIFIABLE

**Reason**: No source provided or found for this specific claim

**Confidence Score**: N/A (cannot assign confidence without source)

### Severity Classification

**Severity**: 🟡 IMPORTANT - Verifiable claim lacking source

**Rationale**:
- Specific number (25%) should have source
- "Industry analysts" is vague attribution
- Market growth projections are verifiable facts
- Should cite specific report or study

### Evidence

```markdown
**Claim**: "Industry analysts estimate 25% annual growth"
**Source Cited**: None
**Sources Searched**: All /source-docs/ files
**Finding**: No supporting source found
```

### Recommendation

"Add specific citation (e.g., 'According to Gartner Market Analysis Report 2024, analysts estimate...') or remove claim if source cannot be identified. Vague attributions like 'industry analysts' are not sufficient for specific statistics."

---

## Example 5: Cross-Referenced Verification (VERIFIED)

### Document Claim

**Line 34**: "Founded in 2015, the company now operates in 12 countries with over 500 employees."

### Verification Process

**Step 1: Verify Founding Date**
```bash
Grep pattern="founded|founding|2015" path="/source-docs/company-history.md" output_mode="content"
```

**Result**:
```
Line 5: "Acme Corporation was founded in March 2015 by John Smith and Jane Doe."
```

✅ Founding date confirmed: 2015

---

**Step 2: Verify Country Count**
```bash
Grep pattern="countries|international presence" path="/source-docs/" output_mode="content"
```

**Results Found in Multiple Sources**:

**Source 1** - website-about.md:
```
Line 23: "We maintain a presence in 12 countries across North America, Europe, and Asia."
```

**Source 2** - press-release-2024-01.md:
```
Line 15: "Following our recent expansion, Acme now operates in 12 countries worldwide."
```

**Source 3** - annual-report-2023.pdf:
```
Page 8: "International operations expanded to 12 countries by year-end 2023."
```

✅ Country count confirmed: 12 countries (3 independent sources)

---

**Step 3: Verify Employee Count**
```bash
Grep pattern="employees|team members|500" path="/source-docs/" output_mode="content"
```

**Results**:

**Source 1** - website-about.md:
```
Line 18: "Our team has grown to over 500 employees globally."
```

**Source 2** - annual-report-2023.pdf:
```
Page 12: "Total headcount reached 523 employees as of December 31, 2023."
```

✅ Employee count confirmed: Over 500 (actual: 523)

### Finding

**All Three Claims Verified**:
- Founded in 2015: ✅ Confirmed
- Operates in 12 countries: ✅ Confirmed (3 sources)
- Over 500 employees: ✅ Confirmed (2 sources, actual count 523)

**Confidence Scores**:
- Founding date: 95% (primary source, exact match)
- Country count: 98% (3 independent confirmations!)
- Employee count: 95% (2 sources, "over 500" accurate for 523)

**Overall Confidence**: 96%

### Severity Classification

**Severity**: ✅ VERIFIED - Well-sourced, accurate claim

**Rationale**:
- All facts verified against multiple primary sources
- Excellent cross-referencing (country count in 3 sources)
- No discrepancies found
- "Over 500" is appropriately imprecise for 523 (not overstating)

### Evidence

```markdown
**Claim**: "Founded in 2015, operates in 12 countries, over 500 employees"

**Founding Date (2015)**:
- Source: company-history.md, Line 5
- Verified: "founded in March 2015"

**Country Count (12)**:
- Source 1: website-about.md, Line 23
- Source 2: press-release-2024-01.md, Line 15
- Source 3: annual-report-2023.pdf, Page 8
- All confirm: 12 countries

**Employee Count (over 500)**:
- Source 1: website-about.md, Line 18 ("over 500")
- Source 2: annual-report-2023.pdf, Page 12 (actual: 523)
- Verified: "Over 500" is accurate
```

### Recommendation

"Accept as accurate and well-sourced. Excellent example of properly verified claim with multiple cross-references."

---

## Example 6: Name Confusion (CRITICAL ERROR)

### Document Claim

**Line 102**: "Partnership with Acme Technologies was announced in Q3 2024"

### Verification Process

**Step 1: Search for Partnership Announcement**
```bash
Grep pattern="partnership|Acme" path="/source-docs/press-releases/" output_mode="content"
```

**Result**:
```
File: press-release-2024-09.md, Line 12:
"We are pleased to announce our strategic partnership with Acme Corp, effective September 2024."
```

### Analysis

**Document Claims**: Partnership with "Acme Technologies"

**Source States**: Partnership with "Acme Corp"

**Investigation**: Are these the same company?

**Step 2: Verify Company Names**
```bash
# Search for "Acme Technologies" in sources
Grep pattern="Acme Technologies" path="/source-docs/" output_mode="content"
```

**Result**: No matches - "Acme Technologies" never mentioned in sources

```bash
# Search for "Acme Corp" in sources
Grep pattern="Acme Corp" path="/source-docs/" output_mode="content"
```

**Result**: Multiple matches, all referring to the partnership partner

**Step 3: External Verification**

Verify if "Acme Technologies" and "Acme Corp" are the same entity:
```bash
WebFetch url="https://acme-corp.com" prompt="What is the company's official name?"
```

**Result**: Official name is "Acme Corporation" (Acme Corp)

```bash
WebFetch url="https://acme-technologies.com" prompt="Does this company exist? What do they do?"
```

**Result**: Different company - Acme Technologies Inc. is a separate software company in a different industry

### Finding

**Company Names**:
- **Document**: Acme Technologies
- **Actual Partner**: Acme Corp (Acme Corporation)
- **Acme Technologies**: Different company entirely

**Verification**: Wrong company named

**Confidence Score**: 0% (verified as incorrect)

### Severity Classification

**Severity**: 🔴 CRITICAL - Wrong company named

**Rationale**:
- "Acme Technologies" and "Acme Corp" are different entities
- Different industries, different businesses
- Fundamental factual error in attribution
- Could cause confusion or misrepresentation

### Evidence

```markdown
**Document Claim**: "Partnership with Acme Technologies"
**Source**: press-release-2024-09.md, Line 12
**Actual Partner**: "Acme Corp"
**Verification**: Acme Technologies is a separate company (acme-technologies.com)
**Error Type**: Entity confusion - similar names, different companies
```

### Recommendation

"Correct to 'Acme Corp' or 'Acme Corporation' per press release. Verify all company names carefully - 'Acme Technologies' is a different entity."

---

## Example 7: Acceptable Rounding (FALSE POSITIVE)

### Document Claim

**Line 78**: "Survey results showed approximately 50% of respondents agreed with the proposal"

### Verification Process

**Step 1: Locate Survey Results**
```bash
Grep pattern="survey|respondents|proposal" path="/source-docs/survey-results-2024.md" output_mode="content"
```

**Result**:
```
Line 45: "Survey question 5: Do you agree with the proposal?
Results: 47.3% agree, 35.2% disagree, 17.5% neutral"
```

### Analysis

**Document**: "approximately 50%"

**Source**: 47.3%

**Difference**: 2.7 percentage points

**Qualifier Present**: YES - "approximately"

### Finding

**Match Type**: Reasonable rounding with qualifier

**Confidence Score**: 90% (acceptable rounding disclosed)

### Severity Classification

**Initial Assessment**: Might be 🟡 IMPORTANT (number doesn't match exactly)

**After Review**: ⚪ FALSE POSITIVE - Acceptable rounding

**Rationale**:
- Document uses qualifier "approximately" (discloses rounding)
- Rounding 47.3% → 50% is reasonable (~3 point difference)
- Not misleading given qualifier
- Standard practice for narrative documents

### Evidence

```markdown
**Document**: "approximately 50%"
**Source**: 47.3%
**Qualifier**: "approximately" is present
**Rounding**: 47.3% → 50% (2.7 point difference)
**Assessment**: Acceptable with qualifier
```

### Recommendation

"Accept as-is. Use of 'approximately' makes this rounding acceptable. If greater precision desired, could use exact figure: '47.3% (approximately half) of respondents agreed.'"

---

## Example 8: Context Misrepresentation (CRITICAL)

### Document Claim

**Line 145**: "The CEO stated that revenue targets were exceeded in 2023"

### Verification Process

**Step 1: Search for CEO Statement**
```bash
Grep pattern="revenue target|exceeded|2023" path="/transcripts/ceo-interview.md" output_mode="content" -C=5
```

**Result**:
```
Lines 156-165:

Q: How did you perform against your revenue targets in 2023?

A: Well, it was a mixed bag. We exceeded some targets in certain regions - North America performed particularly well and we exceeded our targets there by about 15%. But overall, looking at the global picture, we fell short of our consolidated revenue goals. Europe was challenging, and Asia didn't meet expectations. So while there were bright spots, we didn't hit our overall targets.

Q: What are you doing differently this year?
```

### Analysis

**Document Claim**: "revenue targets were exceeded"

**Actual Statement**:
- North America: Exceeded targets
- Europe: Fell short
- Asia: Didn't meet expectations
- **Overall**: "we fell short of our consolidated revenue goals"

**Issue**: Document presents partial truth (NA exceeded) as complete truth, ignoring overall shortfall

### Finding

**Match Type**: Selective quotation misrepresenting context

**Context**: Completely changed

**Confidence Score**: 30% (partial match but context changes meaning)

### Severity Classification

**Severity**: 🔴 CRITICAL - Misleading through context misrepresentation

**Rationale**:
- Technically true that SOME targets exceeded
- But overall message was "fell short of consolidated goals"
- Document creates opposite impression of reality
- Cherry-picking positive while omitting negative = misrepresentation

### Evidence

```markdown
**Document Claim**: "CEO stated revenue targets were exceeded"

**Actual Statement Context**:
- "Mixed bag" overall
- North America exceeded (15%)
- Europe and Asia fell short
- **Overall**: "we fell short of our consolidated revenue goals"

**Issue**: Document presents partial success as complete success
```

### Recommendation

"Revise to accurately reflect mixed results: 'The CEO noted that while some regional targets were exceeded (particularly North America at +15%), the company fell short of its consolidated revenue goals for 2023.' This preserves accuracy and complete context."

---

## Example 9: Multiple Sources Increase Confidence (VERIFIED)

### Document Claim

**Line 201**: "The product launched in Q2 2023 and received positive industry reception"

### Verification Process

**Step 1: Verify Launch Timing**

Search across all sources:
```bash
Grep pattern="launch|Q2 2023|product" path="/source-docs/" output_mode="files_with_matches"
```

**Results - Launch Date Confirmations**:

1. **press-release-2023-05.md**:
   ```
   Line 1: "FOR IMMEDIATE RELEASE - May 15, 2023
   Acme Corp Launches Revolutionary Product X"
   ```

2. **company-timeline.md**:
   ```
   Line 78: "Q2 2023: Product X market launch (May)"
   ```

3. **earnings-report-q2-2023.pdf**:
   ```
   Page 4: "Successfully launched Product X in May, contributing to Q2 revenue growth"
   ```

4. **website-products.md**:
   ```
   Line 34: "Product X - Available since May 2023"
   ```

✅ Launch timing confirmed: Q2 2023 (specifically May) - **4 independent sources**

---

**Step 2: Verify Industry Reception**

```bash
Grep pattern="reception|feedback|reviews|industry" path="/source-docs/" output_mode="content"
```

**Results - Reception Confirmations**:

1. **press-coverage-summary.md**:
   ```
   Line 12: "TechReview Magazine: 'Product X sets new standard' (4.5/5 stars)"
   Line 18: "Industry Analyst Report: 'Strong market reception for Product X'"
   ```

2. **customer-feedback-q2.md**:
   ```
   Line 5: "87% positive feedback in first month"
   ```

3. **earnings-report-q2-2023.pdf**:
   ```
   Page 5: "Product X received strong market acceptance with positive industry reviews"
   ```

✅ Positive reception confirmed - **3 sources** (press, customers, company report)

### Finding

**Launch Timing**: ✅ Q2 2023 - **Verified with 4 sources**

**Positive Reception**: ✅ Confirmed - **Verified with 3 sources**

**Confidence Scores**:
- Launch timing: 100% (4 independent primary sources, exact match)
- Positive reception: 92% (3 sources, "positive" supported but subjective claim)

**Overall Confidence**: 96%

### Severity Classification

**Severity**: ✅ VERIFIED - Exceptionally well-sourced claim

**Rationale**:
- Extraordinary cross-referencing (7 total source confirmations)
- Multiple source types (press releases, reports, timelines, feedback)
- Complete consistency across all sources
- Both objective (timing) and subjective (reception) claims supported

### Evidence

```markdown
**Claim**: "Launched Q2 2023 with positive industry reception"

**Launch Timing Sources (4)**:
1. press-release-2023-05.md (May 15, 2023 launch announcement)
2. company-timeline.md (Q2 2023: Product X launch)
3. earnings-report-q2-2023.pdf (launched in May)
4. website-products.md (available since May 2023)

**Reception Sources (3)**:
1. press-coverage-summary.md (4.5/5 stars, "sets new standard")
2. customer-feedback-q2.md (87% positive feedback)
3. earnings-report-q2-2023.pdf (strong market acceptance)
```

### Recommendation

"Accept as highly accurate and exceptionally well-sourced. This is an exemplar of proper fact verification with comprehensive cross-referencing."

---

## Summary Table: Examples Overview

| Example | Claim Type | Issue Found | Severity | Confidence | Outcome |
|---------|------------|-------------|----------|------------|---------|
| 1 | URL | Wrong URL + wrong number | 🔴 CRITICAL | 0% | Fix URL and number |
| 2 | Quote | Paraphrased as direct quote | ⚪ FALSE POS | 85% | Accept - quotelization |
| 3 | Statistic | Wrong number (38% vs 50%) | 🔴 CRITICAL | 0% | Fix to 38% |
| 4 | Attribution | No source provided | 🟡 IMPORTANT | N/A | Add citation |
| 5 | Multiple | All verified | ✅ VERIFIED | 96% | Accept - well-sourced |
| 6 | Name | Wrong company (entity confusion) | 🔴 CRITICAL | 0% | Fix company name |
| 7 | Statistic | Rounding with qualifier | ⚪ FALSE POS | 90% | Accept - disclosed rounding |
| 8 | Quote | Context misrepresented | 🔴 CRITICAL | 30% | Revise to reflect full context |
| 9 | Multiple | Exceptional cross-referencing | ✅ VERIFIED | 96% | Accept - exemplary sourcing |

---

## Key Lessons from Examples

### Lesson 1: Always Check URLs
- URLs have high hallucination rate (Example 1)
- Check both existence AND content
- Don't assume plausible URL is correct

### Lesson 2: Context Is Critical
- Technical accuracy isn't enough (Example 8)
- Quote can be "correct" but misleading if context wrong
- Always read surrounding text

### Lesson 3: Qualifiers Matter
- "Approximately" changes assessment (Example 7)
- Rounding acceptable IF disclosed
- Without qualifier, rounding is an error

### Lesson 4: Cross-References Boost Confidence
- Multiple sources validate claims (Examples 5, 9)
- Look for independent confirmations
- Consistency across sources increases confidence

### Lesson 5: Distinguish Paraphrase from Fabrication
- Quotelization is acceptable (Example 2)
- Meaning preservation is key
- Filler words can be removed

### Lesson 6: Entity Names Need Precision
- Similar names ≠ same entity (Example 6)
- Verify company/person identity carefully
- Context clues help distinguish

### Lesson 7: Unverifiable ≠ False
- No source = unverifiable, not false (Example 4)
- Different categories, different actions
- Request sourcing, don't assume wrong

### Lesson 8: Numbers Require Exactness
- Wrong numbers are always critical (Example 3)
- Even small differences matter
- No benefit of doubt for statistics

---

## Using These Examples

**During Verification**:
- Reference similar examples to understand process
- Follow same verification patterns
- Apply same confidence scoring logic

**During Report Writing**:
- Use example format for documenting findings
- Include similar level of evidence detail
- Provide clear recommendations like examples

**When Uncertain**:
- Find most similar example in this guide
- Apply same reasoning process
- Adapt to your specific situation

---

**Last Updated**: 2026-01-28
**Version**: 1.0
