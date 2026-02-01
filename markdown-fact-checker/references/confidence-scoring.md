---
created: '2026-01-28'
---
# Confidence Scoring Rubric

This reference provides a detailed framework for assigning confidence scores to verified claims. Use this to ensure consistent, defensible assessments across all fact-checking work.

---

## Overview

**Confidence Score**: Reflects certainty that a claim is accurate based on verification evidence

**Range**: 0-100% or N/A (unverifiable)

**Purpose**:
- Prioritize which issues need fixing
- Communicate uncertainty clearly
- Enable consistent cross-document comparisons

**Principle**: Conservative scoring is better than over-confidence. When uncertain, assign lower score and explain uncertainty.

---

## The Four Confidence Tiers

### Tier 1: 90-100% (✅ VERIFIED)

**Criteria**:
- Direct, exact match found in source
- Context fully preserved
- Attribution correct and clear
- Source is reliable and authoritative
- Multiple confirmations if available

**Interpretation**: Claim is accurate with high certainty

**Action**: Accept as verified

**Examples**:
- Exact quote found word-for-word in transcript
- URL loads and contains precisely stated content
- Statistic matches source exactly with same units and context
- Multiple independent sources confirm same fact

---

### Tier 2: 50-89% (⚠️ QUESTIONABLE)

**Criteria**:
- Partial match or acceptable paraphrase
- Source somewhat ambiguous or less authoritative
- Minor discrepancies present
- Single source confirmation only
- Context mostly but not fully preserved

**Interpretation**: Claim is likely accurate but has some concerns

**Action**:
- 75-89%: Accept unless presented as direct quote (then flag paraphrase)
- 50-74%: Flag as 🟡 IMPORTANT - should improve sourcing or accuracy

**Examples**:
- Quote closely paraphrased, meaning intact but not exact words
- Number rounded with qualifier ("approximately 50%" when source says 47.3%)
- URL loads, content matches in substance but not exact wording
- Secondary source confirmation only

---

### Tier 3: 0-49% (❌ LIKELY FALSE)

**Criteria**:
- No match found in claimed source
- Source contradicts claim
- Source doesn't exist (404, file not found)
- Context significantly misrepresented
- Major discrepancies in facts

**Interpretation**: Claim is likely incorrect or hallucinated

**Action**: Flag as 🔴 CRITICAL - must fix before delivery

**Examples**:
- Quote doesn't exist anywhere in source
- URL returns 404
- Statistics don't match (47% stated as 74%)
- Name/date verifiably wrong

---

### Tier 4: N/A (❓ UNVERIFIABLE)

**Criteria**:
- Source not accessible (login required, paywall, missing file)
- Claim too vague to verify ("studies show...")
- Insufficient information provided
- No source cited for verifiable claim

**Interpretation**: Cannot determine accuracy (different from "likely false")

**Action**: Flag separately as unverifiable, request better sourcing

**Examples**:
- "Studies show..." with no citation
- URL requires authentication
- Source file not available in accessible locations
- Subjective claims with no objective standard

---

## Scoring Factors

Confidence scores are influenced by multiple factors. Use this framework to adjust base scores.

### Factor 1: Source Reliability (±20 points)

**+20 points**: Highly authoritative primary source
- Official company website (About page, Press releases)
- Government databases or filings
- Original documents (contracts, reports authored by entity)
- Primary research data

**+10 points**: Reliable secondary source
- Reputable news outlets (major publications)
- Industry reports from known firms
- Academic publications
- Professional profiles (LinkedIn, official bios)

**0 points**: Uncertain source quality
- Unknown website reliability
- Unclear provenance
- Generic information sites

**-10 points**: Questionable source
- Outdated information (>3 years old for fast-changing facts)
- Unreliable or low-quality website
- User-generated content without verification

---

### Factor 2: Match Precision (±30 points)

**+30 points**: Exact match
- Word-for-word quote match
- Exact number with same units
- Precise date or specification

**+20 points**: Very close match
- Minor paraphrase preserving all meaning
- Number within acceptable rounding tolerance WITH qualifier
- Date within reasonable interpretive range (Q1 vs. January-March)

**+10 points**: Partial match
- Core idea present but expressed differently
- Approximate number with appropriate qualifier
- General timeframe vs. specific date

**0 points**: Weak match
- Related concept but different specifics
- Similar but not same number
- Tangentially related content

**-30 points**: No match or contradiction
- Claim not found anywhere in source
- Source explicitly contradicts claim
- Completely different information

---

### Factor 3: Context Preservation (±20 points)

**+20 points**: Context fully preserved
- Quote used in same sense as original
- Statistics with same qualifiers and limitations
- Attribution matches context in source

**+10 points**: Context mostly preserved
- Minor difference in emphasis
- Reasonable interpretation of source
- Attribution substantially correct

**0 points**: Context unclear
- Hard to determine if context matches
- Ambiguous usage
- Context not verifiable

**-10 points**: Context questionable
- Quote might be taken out of context
- Statistics used differently than in source
- Emphasis shifted somewhat

**-20 points**: Context misrepresented
- Quote clearly taken out of context
- Statistics misleading when context removed
- Changes meaning of original

---

### Factor 4: Cross-References (±15 points)

**+15 points**: Multiple independent confirmations
- 3+ sources independently confirm
- Sources from different origins validate
- Consistent across all sources

**+10 points**: Two confirming sources
- 2 independent sources agree
- Sources are credible

**+5 points**: Single source only
- Only one source available
- Cannot cross-reference

**0 points**: No cross-reference attempted
- Didn't check other sources
- Not applicable to this claim type

**-10 points**: Contradictory sources
- Different sources provide conflicting information
- Unclear which source is correct

---

### Factor 5: Verification Completeness (±15 points)

**+15 points**: Comprehensive verification
- Full source document reviewed
- All related claims verified
- Context thoroughly understood
- Multiple verification methods used

**+10 points**: Thorough verification
- Key sections of source checked
- Main claims verified
- Context reasonably understood

**+5 points**: Basic verification
- Quick check completed
- Surface-level confirmation
- Minimal context review

**0 points**: Minimal verification
- Barely checked
- Significant uncertainty remains
- Would benefit from deeper verification

---

## Confidence Score Calculation

**Base Score**: Start at 50% (neutral)

**Add/Subtract** based on factors:
1. Source reliability: +/-20
2. Match precision: +/-30
3. Context preservation: +/-20
4. Cross-references: +/-15
5. Verification completeness: +/-15

**Total Possible Range**: 0-150 (capped at 100%)

**Final Score**: Sum of base + adjustments, capped at 100%

---

## Detailed Scoring Examples

### Example 1: High Confidence URL Verification (95%)

**Claim**: "Company website states they have 500 employees"

**Source**: https://company.com/about

**Verification Process**:
- WebFetch confirms page loads (200)
- Page states: "Our team of 500 professionals..."

**Scoring Breakdown**:
- **Base**: 50%
- **Source reliability**: +20% (official company website - primary source)
- **Match precision**: +30% (exact number, clear statement)
- **Context preservation**: +20% (same context - team size)
- **Cross-references**: +5% (single source, appropriate for this claim)
- **Verification completeness**: +15% (full verification completed)

**Total**: 50 + 90 = 140% → **Capped at 100%**

**Confidence Band**: 90-100% → ✅ VERIFIED

**Action**: Accept as accurate

---

### Example 2: Moderate Confidence Quote (70%)

**Claim**: "[Name] said 'We focus on operational excellence'"

**Source**: Interview transcript

**Verification Process**:
- Grep in transcript: "I think our key strength is really around operational effectiveness"

**Scoring Breakdown**:
- **Base**: 50%
- **Source reliability**: +20% (primary source - original transcript)
- **Match precision**: +10% (paraphrase - concept similar, words different)
- **Context preservation**: +10% (context similar, same general meaning)
- **Cross-references**: +5% (single source)
- **Verification completeness**: +10% (thorough verification)

**Total**: 50 + 55 = **105% → Capped at 100%**

Wait - let me recalculate. The match is NOT exact, so:
- **Base**: 50%
- **Source reliability**: +20%
- **Match precision**: +10% (paraphrase, not exact)
- **Context preservation**: +10%
- **Cross-references**: +5%
- **Verification completeness**: +10%

**Actually, let's be more conservative since it's presented as direct quote but is paraphrase**:
**Total**: 50 + 20 + 10 + 10 + 5 + 10 = **105%**

**But**: Document presents as DIRECT QUOTE (in quotation marks), so this is actually problematic.

**Adjusted Score**: 70% (reduce from 95% because presented incorrectly)

**Confidence Band**: 50-89% → ⚠️ QUESTIONABLE

**Severity**: 🟡 IMPORTANT - should be paraphrased, not direct quote

**Action**: Rephrase as paraphrase OR use actual words from transcript

---

### Example 3: Low Confidence Statistic (30%)

**Claim**: "Revenue grew 50% in 2023"

**Source**: Company annual report

**Verification Process**:
- Read report
- Found: "Revenue grew 38% year-over-year"

**Scoring Breakdown**:
- **Base**: 50%
- **Source reliability**: +20% (official report - authoritative)
- **Match precision**: -30% (WRONG number - 38% not 50%)
- **Context preservation**: +10% (context matches - annual growth)
- **Cross-references**: +5% (single source)
- **Verification completeness**: +15% (thorough verification)

**Total**: 50 + 20 - 30 + 10 + 5 + 15 = **70%**

But wait - the NUMBER IS WRONG. This should be much lower.

**Adjusted**: When core fact (the number) is wrong, score should be in 0-49% range.

**Final Score**: 30%

**Confidence Band**: 0-49% → ❌ LIKELY FALSE

**Severity**: 🔴 CRITICAL - factually incorrect number

**Action**: Correct to 38% based on source

---

### Example 4: Unverifiable Claim (N/A)

**Claim**: "Industry analysts estimate the market will grow 25% annually"

**Source**: None cited

**Verification Process**:
- Searched document for citation: None found
- Searched source files: No supporting source
- No way to verify "industry analysts" claim

**Scoring**: N/A - Cannot assign confidence score without source

**Severity**: 🟡 IMPORTANT - needs sourcing

**Action**: Add specific citation or remove claim

---

### Example 5: Cross-Referenced High Confidence (98%)

**Claim**: "Founded in 2015, company now operates in 12 countries"

**Sources**:
- company-history.md: "Founded March 2015"
- website-about.md: "Presence in 12 countries"
- press-release-2024.md: "Expanded to 12 countries"
- annual-report.md: "12 international offices"

**Scoring Breakdown**:
- **Base**: 50%
- **Source reliability**: +20% (multiple primary sources)
- **Match precision**: +30% (exact matches)
- **Context preservation**: +20% (consistent context)
- **Cross-references**: +15% (4 independent confirmations!)
- **Verification completeness**: +15% (comprehensive)

**Total**: 50 + 100 = **150% → Capped at 100%**

Actually, let's be more precise:
**Total**: 50 + 20 + 30 + 20 + 15 + 15 = **150% → Capped at 100%**

But we should acknowledge the exceptional cross-referencing, so:

**Final Score**: 98% (slightly below 100% to acknowledge it's still human-reported data)

**Confidence Band**: 90-100% → ✅ VERIFIED

**Action**: Accept as highly accurate

---

## Confidence Score Decision Tree

```
START: Verified a claim
     ↓
Q: Can you access the claimed source?
     ├─ NO → Score: N/A (Unverifiable)
     └─ YES → Continue
             ↓
Q: Does source contain the claim?
     ├─ NO → Score: 0-49% (Likely False) → 🔴 CRITICAL
     └─ YES → Continue
             ↓
Q: How close is the match?
     ├─ EXACT MATCH
     │    ↓
     │    Q: Is source authoritative?
     │    ├─ YES → Score: 90-100% (Verified)
     │    └─ UNCERTAIN → Score: 75-89% (Strong)
     │
     ├─ VERY CLOSE (minor paraphrase)
     │    ↓
     │    Q: Is context fully preserved?
     │    ├─ YES → Score: 75-89% (Strong)
     │    └─ PARTIALLY → Score: 60-74% (Moderate)
     │
     ├─ PARTIAL MATCH (related concept)
     │    ↓
     │    Q: Is context similar enough?
     │    ├─ YES → Score: 50-74% (Moderate)
     │    └─ NO → Score: 25-49% (Low)
     │
     └─ WEAK MATCH (barely related)
          ↓
          Score: 25-49% (Low) → 🟡 IMPORTANT
```

---

## Adjusting Scores: Special Cases

### When to Boost Confidence

**Multiple Independent Sources** (+10-15%)
- Claim confirmed by 3+ unrelated sources
- Sources are from different types (e.g., website + report + news)
- All sources agree on core facts

**Particularly Authoritative Source** (+5-10%)
- Government database or official filing
- Peer-reviewed academic research
- Primary source document (original, not secondhand)

**Context Is Unambiguous** (+5%)
- No room for interpretation
- Clear, straightforward claim
- Context fully supports usage

---

### When to Lower Confidence

**Source Is Outdated** (-10%)
- Information is >3 years old for fast-changing facts
- Website copyright date is old
- Likely information has changed since source created

**Source Reliability Questionable** (-10-20%)
- Unknown website or publication
- Potential bias in source
- User-generated content without verification

**Context Differs or Unclear** (-10-20%)
- Quote might be out of context
- Statistics used differently than in source
- Attribution ambiguous

**Partial Information Only** (-5-10%)
- Couldn't access full source
- Only verified part of claim
- Related but not exact information found

---

## Quality Control: Confidence Calibration

### Self-Check Questions

Before finalizing confidence score, ask:

1. **Defensibility**: "Could I defend this score in an audit?"
2. **Conservatism**: "Am I being overly generous? What would a skeptical reviewer say?"
3. **Consistency**: "Is this score consistent with similar claims in this document?"
4. **Evidence**: "Does my evidence actually support this confidence level?"
5. **Honesty**: "Does this score honestly reflect my certainty?"

### Calibration Guidelines

**If unsure between two tiers** (e.g., 89% vs. 75%):
- Choose the lower, more conservative score
- Explain uncertainty in notes
- Better to under-promise than over-promise

**If evidence is ambiguous**:
- Lower the score to reflect ambiguity
- Document what made it ambiguous
- Consider marking as needs additional verification

**If you're assigning many 95-100% scores**:
- Review: are you being too generous?
- Check: are you properly accounting for all factors?
- Consider: what would make a score NOT be 95%+?

---

## Confidence Score Summary Table

| Score Range | Tier Name | Typical Characteristics | Action |
|-------------|-----------|------------------------|--------|
| 95-100% | Verified | Exact match, authoritative source, perfect context | Accept |
| 85-94% | Strong | Very close match, reliable source, good context | Accept |
| 75-84% | Moderate-Strong | Close match, single source, mostly preserved context | Accept unless direct quote (then fix) |
| 60-74% | Moderate | Partial match, some concerns, context okay | Flag as 🟡 IMPORTANT |
| 50-59% | Moderate-Weak | Weak match, several concerns, limited verification | Flag as 🟡 IMPORTANT |
| 35-49% | Low | Major discrepancies, questionable accuracy | Flag as 🟡-🔴 depending on importance |
| 15-34% | Very Low | Likely false, contradictions found | Flag as 🔴 CRITICAL |
| 0-14% | Failed | Verified as false, invented, or completely wrong | Flag as 🔴 CRITICAL |
| N/A | Unverifiable | Cannot access source or insufficient information | Flag separately, request sourcing |

---

## Common Scoring Mistakes to Avoid

### Mistake 1: Conflating "Unverifiable" with "False"

**Wrong**: Assigning 0% to claims that simply lack accessible sources

**Right**: Use N/A for unverifiable claims, reserve 0-49% for claims verified as false

---

### Mistake 2: Over-Generous Scoring

**Wrong**: Giving 95% to paraphrased quotes or rounded statistics

**Right**: Reserve 90-100% for exact matches; paraphrases should be 60-85%

---

### Mistake 3: Ignoring Presentation

**Wrong**: Scoring quote as 85% without considering it's presented as direct quote (should be exact)

**Right**: Adjust score down when presentation implies greater precision than evidence supports

---

### Mistake 4: Single-Factor Scoring

**Wrong**: "Source is authoritative, so 95% confidence"

**Right**: Consider all five factors; even authoritative sources can be misquoted or taken out of context

---

### Mistake 5: Precision Bias

**Wrong**: "47.3% vs. 50% is close, so 90% confidence"

**Right**: Close numbers without disclosed rounding = 🟡 IMPORTANT issue, ~60-70% confidence

---

## Final Checklist

Before finalizing confidence score:

- [ ] Verified source is accessible and reliable
- [ ] Checked match precision (exact/close/partial/none)
- [ ] Evaluated context preservation
- [ ] Considered cross-references if available
- [ ] Assessed verification completeness
- [ ] Applied all five scoring factors
- [ ] Used conservative judgment when uncertain
- [ ] Documented reasoning for score
- [ ] Confidence score honestly reflects certainty
- [ ] Score is consistent with similar claims
- [ ] Could defend this score in review

---

**Last Updated**: 2026-01-28
**Version**: 1.0
