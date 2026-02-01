---
created: '2026-01-28'
---
# Audit Report Template

This reference provides standard templates for generating fact-checking audit reports. Use these templates to create consistent, professional documentation of verification findings.

---

## Template 1: Full Audit Report

Use this comprehensive template for complete document audits or high-stakes deliverables requiring thorough verification.

```markdown
# Fact Check Audit Report

**Document Audited**: [filename.md]
**Full Path**: `/path/to/document.md`
**Audit Date**: [YYYY-MM-DD]
**Auditor**: Claude (markdown-fact-checker skill v1.0)
**Audit Type**: [Full Audit / Targeted Audit / Rapid Audit]
**Audit Scope**: [All claims / High-risk claims only / Specific sections]

---

## Executive Summary

### Overall Assessment

- **Total Claims Verified**: [N] claims
- **Verification Timeframe**: [X] minutes
- 🔴 **CRITICAL ISSUES**: [N] *(must fix before delivery)*
- 🟡 **IMPORTANT ISSUES**: [N] *(should fix for quality)*
- 🟢 **MINOR ISSUES**: [N] *(fix if time allows)*
- ✅ **VERIFIED CLAIMS**: [N] claims ([X]% of total verified at 90%+ confidence)

### Document Readiness

**Overall Recommendation**: [Choose one]
- ✅ **Ready for Delivery** - No critical issues; minor improvements optional
- ⚠️ **Fix Critical Issues First** - [N] critical issues must be addressed
- ❌ **Major Revisions Needed** - Significant accuracy concerns require comprehensive review

**Priority Actions**: [List 2-3 highest priority fixes]
1. [Action 1]
2. [Action 2]
3. [Action 3]

---

## Detailed Findings by Severity

### 🔴 CRITICAL Issues (Must Fix Before Delivery)

*[If no critical issues: "None found - document passed critical verification checks"]*

---

#### Issue #1: [Brief One-Line Description]

**Claim**: "[Exact text from document containing the claim]"

**Location**:
- Line Number: [N]
- Section: [Section name or heading]
- Context: [Brief context - what part of argument/narrative]

**Category**: [URL / Quote / Statistic / Name / Date / Technical Spec / Other]

---

**Verification Process**:

**Method Used**: [WebFetch / Read / Grep / Cross-reference]

**Sources Checked**:
- [List all sources examined]
- [File paths or URLs]

**Verification Steps**:
1. [Step 1 taken]
2. [Step 2 taken]
3. [Result of verification]

---

**Verification Results**:

**What Was Found**:
```
[Quote the actual content from source, or describe what was found]
```

**What Was Expected**:
```
[What the document claimed should be in source]
```

**Discrepancy**:
[Explain the specific difference/problem]

**Confidence Score**: [0-49%]

---

**Why This Is Critical**:

[Explain impact and why this severity level]
- Factual error: [Yes/No + explanation]
- Misleading readers: [Yes/No + explanation]
- Affects key conclusions: [Yes/No + explanation]
- Professional credibility impact: [Yes/No + explanation]

---

**Evidence**:

```markdown
**Source**: [file/URL]
**Location**: [line/page]
**Actual Content**: "[exact text or description]"

**Document Claim**: "[what document states]"

**Type of Error**: [Fabrication / Misattribution / Wrong number / Context misrepresentation / etc.]
```

---

**Recommendation**:

**Specific Fix**: [Exact action to take]
- [Change X to Y]
- [Add source citation: ...]
- [Revise paragraph to...]

**Priority**: Immediate (before any delivery or publication)

**Estimated Fix Time**: [Quick / Moderate / Requires research]

---

*[Repeat this format for each critical issue]*

---

### 🟡 IMPORTANT Issues (Should Fix for Quality)

*[If none: "No important issues identified"]*

---

#### Issue #[N]: [Brief Description]

**Claim**: "[claim text]"

**Location**: Line [N] / Section: [X]

**Category**: [type]

---

**Verification**:

**Method**: [tool/approach]

**Finding**: [What was discovered]

**Confidence Score**: [50-89%]

---

**Why This Is Important**:

[Explain concern - e.g., "Paraphrased content presented as direct quote," "Rounding not disclosed," "Source ambiguous"]

---

**Evidence**:

```markdown
**Source**: [where verified]
**Document Version**: "[what doc says]"
**Source Version**: "[what source says]"
**Difference**: [describe discrepancy]
```

---

**Recommendation**:

[Suggested fix - e.g., "Rephrase as paraphrase," "Add qualifier 'approximately'," "Add specific citation"]

**Priority**: High (recommended before delivery)

**Estimated Fix Time**: [Quick / Moderate]

---

*[Repeat for each important issue]*

---

### 🟢 MINOR Issues (Optional Improvements)

*[If none: "No minor issues flagged"]*

**Summary Format** (briefer than CRITICAL/IMPORTANT):

1. **[Brief description]** (Line [N])
   - Issue: [What's the problem]
   - Fix: [Suggested improvement]
   - Impact: Low

2. **[Brief description]** (Line [N])
   - Issue: [What's the problem]
   - Fix: [Suggested improvement]
   - Impact: Low

*[List all minor issues in concise format]*

---

### ⚪ FALSE POSITIVES (Acceptable Variations)

*[If none: "No false positives documented"]*

These items initially appeared to be errors but are actually acceptable upon review:

---

#### FP #1: [What Initially Looked Wrong]

**Claim**: "[claim that raised flag]"

**Location**: Line [N]

**Why It Appeared Wrong**: [What triggered the flag]

**Why It's Actually Acceptable**: [Explanation]

**Pattern**: [Quotelization / Reasonable Rounding / Name Variation / URL Format / etc.]

**Reference**: See [false-positives.md](false-positives.md#relevant-section) for similar patterns

---

**Example**:

**Document**: "approximately 50%"
**Source**: "47.3%"
**Verdict**: ⚪ Acceptable because "approximately" qualifier is present, and rounding 47.3% → 50% is reasonable (2.7 point difference)

---

*[Repeat for each false positive]*

---

## Unverifiable Claims

### Claims Lacking Sources

These claims could be verified IF sources were provided:

1. **"Industry analysts estimate..."** (Line 56)
   - **Issue**: No specific source or citation
   - **Claim Type**: Statistic / market estimate
   - **Recommendation**: Add citation (e.g., "According to Gartner Report 2024...") or remove
   - **Severity**: 🟡 IMPORTANT

2. **"Studies show..."** (Line 92)
   - **Issue**: Vague attribution, no specific study cited
   - **Claim Type**: Research claim
   - **Recommendation**: Specify which study or provide citation
   - **Severity**: 🟡 IMPORTANT

*[Continue for all unverifiable claims]*

**Summary**: [N] claims lack sufficient sourcing for verification

---

### Claims with Inaccessible Sources

These claims reference sources that couldn't be accessed:

1. **[Claim]** (Line [N])
   - **Issue**: Source requires authentication / paywall
   - **Attempted**: [What was tried]
   - **Recommendation**: [Suggest alternative if possible]

*[List all inaccessible sources]*

---

## Verified Claims - Findings by Category

### URLs ([N] verified)

| Line | URL | Status | Content Match | Confidence | Severity | Notes |
|------|-----|--------|---------------|------------|----------|-------|
| 42   | https://example.com/about | ✅ 200 OK | ✅ Matches | 95% | - | Content verified |
| 87   | https://fake.com/page | ❌ 404 | N/A | 0% | 🔴 CRITICAL | URL doesn't exist |
| 120  | https://company.com/team | ✅ 200 OK | ✅ Matches | 90% | ⚪ FALSE POS | Minor URL difference (www) |

**URL Verification Summary**:
- Total URLs checked: [N]
- Accessible (200 OK): [X] ([Y]%)
- Failed (404/error): [Z]
- Content matched claim: [A] ([B]%)
- Average confidence: [C]%

**Issues**:
- 🔴 CRITICAL: [List problematic URLs]
- 🟡 IMPORTANT: [List questionable URLs]

---

### Quotes ([N] verified)

| Line | Quote (abbreviated) | Source | Match Type | Context | Confidence | Severity |
|------|---------------------|---------|------------|---------|------------|----------|
| 15   | "We focus on..." | interview.md:156 | Exact | Preserved | 95% | ✅ |
| 67   | "Growth is key" | report.pdf:45 | Paraphrase | Preserved | 75% | 🟡 |
| 103  | "Strategic vision..." | [not found] | None | N/A | 0% | 🔴 |

**Quote Verification Summary**:
- Total quotes checked: [N]
- Exact matches: [X]
- Acceptable paraphrases: [Y]
- Quotelization (acceptable): [Z]
- Not found: [A]
- Context issues: [B]

**Issues**:
- 🔴 CRITICAL: [List fabricated/misattributed quotes]
- 🟡 IMPORTANT: [List paraphrases presented as direct quotes]
- ⚪ FALSE POSITIVES: [List acceptable quotelizations]

---

### Statistics ([N] verified)

| Line | Statistic | Source | Actual Value | Match | Confidence | Severity |
|------|-----------|---------|--------------|-------|------------|----------|
| 34   | 50% growth | report.md:78 | 50% | ✅ Exact | 100% | ✅ |
| 78   | $1.5M revenue | [no source] | N/A | N/A | N/A | 🟡 |
| 145  | 25% increase | report.md:92 | 38% increase | ❌ Wrong | 0% | 🔴 |

**Statistics Verification Summary**:
- Total statistics checked: [N]
- Exact matches: [X]
- Acceptable rounding (w/qualifier): [Y]
- Wrong numbers: [Z]
- Unsourced: [A]

**Issues**:
- 🔴 CRITICAL: [List wrong numbers]
- 🟡 IMPORTANT: [List unsourced stats or undisclosed rounding]

---

### Names & Organizations ([N] verified)

| Line | Name/Organization | Spelling | Consistency | Issues | Severity |
|------|------------------|----------|-------------|--------|----------|
| 23   | Acme Corp | Correct | Consistent | None | ✅ |
| 56   | John Smith | Correct | Consistent | None | ✅ |
| 89   | Acme Corporation | Variation | OK (same entity) | None | ⚪ |
| 134  | Acme Technologies | Wrong entity | Confusion | Wrong company | 🔴 |

**Names/Organizations Summary**:
- Total entities checked: [N]
- Correct and consistent: [X]
- Acceptable variations: [Y]
- Entity confusion: [Z]
- Misspellings: [A]

**Issues**:
- 🔴 CRITICAL: [List wrong entities or serious misspellings]
- 🟢 MINOR: [List minor spelling variations]

---

### Dates & Timelines ([N] verified)

| Line | Date/Event | Source | Verified | Match | Issues | Severity |
|------|-----------|---------|----------|-------|--------|----------|
| 45   | Founded 2015 | history.md | 2015 | ✅ | None | ✅ |
| 78   | Launched Q2 2023 | press-release | May 2023 (Q2) | ✅ | None | ✅ |
| 112  | Event in 2024 | [source] | Actually 2023 | ❌ | Wrong year | 🔴 |

**Dates/Timelines Summary**:
- Total dates checked: [N]
- Correct: [X]
- Chronology issues: [Y]
- Wrong dates: [Z]

**Issues**:
- 🔴 CRITICAL: [List wrong dates or timeline errors]

---

### Technical Specifications ([N] verified)

*[Include if applicable, format similar to above categories]*

---

## Verification Coverage Analysis

### By Document Section

| Section | Word Count | Claims Found | Claims Verified | Issues | Coverage |
|---------|-----------|--------------|-----------------|--------|----------|
| Introduction | 450 | 12 | 10 | 2 🔴 | 83% |
| Background | 890 | 25 | 23 | 1 🟡 | 92% |
| Analysis | 1,240 | 45 | 40 | 3 🔴, 2 🟡 | 89% |
| Conclusions | 320 | 8 | 8 | 0 | 100% |
| **TOTAL** | **2,900** | **90** | **81** | **5 🔴, 3 🟡** | **90%** |

### By Claim Type

| Claim Type | Total | Verified (90-100%) | Questionable (50-89%) | Likely False (0-49%) | Unverifiable |
|------------|-------|-------------------|----------------------|---------------------|--------------|
| URLs | 15 | 12 (80%) | 1 (7%) | 2 (13%) | 0 |
| Quotes | 22 | 18 (82%) | 3 (14%) | 1 (5%) | 0 |
| Statistics | 18 | 14 (78%) | 2 (11%) | 1 (6%) | 1 (6%) |
| Names/Orgs | 31 | 30 (97%) | 0 | 1 (3%) | 0 |
| Dates | 12 | 12 (100%) | 0 | 0 | 0 |
| Other | 12 | 9 (75%) | 2 (17%) | 0 | 1 (8%) |
| **TOTAL** | **110** | **95 (86%)** | **8 (7%)** | **5 (5%)** | **2 (2%)** |

**Key Metrics**:
- **Overall Verification Rate**: [X]% of claims successfully verified
- **High Confidence Rate**: [Y]% of claims verified at 90%+ confidence
- **Critical Error Rate**: [Z]% of claims found to be false
- **Unverifiable Rate**: [A]% of claims lack verifiable sources

---

## Systematic Issues & Patterns

*[Include this section if patterns emerge across multiple findings]*

### Pattern 1: [Issue Pattern Name]

**Description**: [What pattern was observed]

**Frequency**: Observed in [N] instances across [X] sections

**Examples**:
- Line [A]: [Brief example]
- Line [B]: [Brief example]
- Line [C]: [Brief example]

**Root Cause**: [Likely reason this pattern occurs]

**Systematic Fix**: [Recommendation to address pattern broadly]

---

*[Repeat for additional patterns]*

---

## Recommendations

### Priority 1: Immediate Actions (Required Before Delivery)

1. **[Action]**: [Specific description]
   - **Related Issues**: Issue #[N], Issue #[M]
   - **Impact**: [Why this is critical]
   - **Estimated Time**: [Quick / Moderate / Significant]

2. **[Action]**: [Specific description]
   - **Related Issues**: Issue #[N]
   - **Impact**: [Why this is critical]
   - **Estimated Time**: [Quick / Moderate / Significant]

3. **[Action]**: [Specific description]
   - **Related Issues**: Issue #[N], Issue #[M], Issue #[O]
   - **Impact**: [Why this is critical]
   - **Estimated Time**: [Quick / Moderate / Significant]

---

### Priority 2: Quality Improvements (Strongly Recommended)

1. **[Action]**: [Specific description]
   - **Related Issues**: Issue #[N]
   - **Impact**: Improves accuracy and credibility
   - **Estimated Time**: [Quick / Moderate]

2. **[Action]**: [Specific description]
   - **Related Issues**: Issue #[N], Issue #[M]
   - **Impact**: Eliminates ambiguity
   - **Estimated Time**: [Quick / Moderate]

---

### Priority 3: Optional Enhancements

1. **[Enhancement]**: [Description]
   - **Benefit**: [What this improves]
   - **Estimated Time**: [Quick / Moderate]

2. **[Enhancement]**: [Description]
   - **Benefit**: [What this improves]
   - **Estimated Time**: [Quick / Moderate]

---

### Process Improvements for Future Documents

*[Suggest systemic improvements if patterns indicate process issues]*

**Recommendations for Future Work**:
1. [Process suggestion 1]
2. [Process suggestion 2]
3. [Process suggestion 3]

---

## Verification Methodology

### Tools & Procedures Used

**Primary Tools**:
- **Read**: [N] file reads performed
- **Grep**: [N] pattern searches executed
- **WebFetch**: [N] URL validations completed
- **Glob**: [N] file pattern searches performed

**Verification Procedures Applied**:
- URL Verification (Procedure 3A): [N] URLs checked
- Quote Verification (Procedure 3B): [N] quotes verified
- Statistical Verification (Procedure 3C): [N] statistics checked
- Name/Organization Verification (Procedure 3D): [N] entities verified
- Date/Timeline Verification (Procedure 3E): [N] dates checked
- Cross-Reference Verification (Procedure 3F): [N] cross-checks performed

**Confidence Scoring**:
- Applied 5-factor scoring rubric (Source Reliability, Match Precision, Context Preservation, Cross-References, Verification Completeness)
- Used conservative scoring approach
- Documented scoring rationale for borderline cases

---

### Verification Limitations

**Sources Not Accessible**:
- [List any sources that couldn't be accessed and why]

**Verification Scope Limitations**:
- [Note any intentional scope limitations]
- [Explain what was not verified and why]

**Ambiguities**:
- [Note any cases where verification was inconclusive]
- [Explain uncertainties in interpretation]

**Time Constraints**:
- [Note if rapid audit vs. comprehensive audit]
- [Explain any trade-offs made]

---

## Appendices

### Appendix A: Complete Claim Inventory

*[Optional: Full list of all claims with basic metadata]*

| Line | Claim | Type | Confidence | Severity | Notes |
|------|-------|------|------------|----------|-------|
| [N] | [Brief claim] | [Type] | [Score] | [Level] | [Brief note] |

*[Full table of all verified claims]*

---

### Appendix B: Source Quality Assessment

*[Optional: Analysis of source quality distribution]*

**Primary Sources Used**: [N]
- Official company websites: [X]
- Original documents: [Y]
- Press releases: [Z]

**Secondary Sources Used**: [N]
- News articles: [A]
- Industry reports: [B]
- Other: [C]

**Source Quality Distribution**:
- High quality (authoritative primary): [X]%
- Medium quality (reliable secondary): [Y]%
- Lower quality (less reliable): [Z]%

---

### Appendix C: Verification Evidence Archive

*[Optional: Store detailed verification outputs for reference]*

**Evidence for Issue #[N]**:
```
[Full verification output - WebFetch response, Grep results, etc.]
```

*[Continue for key issues requiring detailed evidence preservation]*

---

## Audit Completion & Sign-Off

**Audit Status**: ✅ Complete

**Completion Date**: [YYYY-MM-DD]

**Total Verification Time**: [X] minutes ([Y] hours)

**Claims Processed**: [N] total claims

**Overall Document Confidence**: [X]% of claims verified with 90%+ confidence

---

**Auditor Assessment**:

[Brief summary paragraph of overall document quality]

**Key Strengths**:
- [Strength 1]
- [Strength 2]
- [Strength 3]

**Key Concerns**:
- [Concern 1]
- [Concern 2]
- [Concern 3]

**Final Recommendation**: [Ready / Fix Critical Issues / Major Revision Needed]

---

**Next Steps**:
1. [Immediate action 1]
2. [Immediate action 2]
3. [Follow-up action if needed]

**Re-Audit Recommended**: [Yes/No] - [If yes, explain when/why]

---

*Audit performed using markdown-fact-checker skill v1.0*
*Report generated: [YYYY-MM-DD HH:MM]*

```

---

## Template 2: Rapid Audit Summary

Use this abbreviated template for quick spot-checks or time-constrained audits.

```markdown
# Quick Fact Check Summary

**Document**: [filename.md]
**Date**: [YYYY-MM-DD]
**Audit Type**: Rapid 15-Minute Spot Check
**Auditor**: Claude (markdown-fact-checker skill)

---

## Quick Snapshot

- 🔴 **CRITICAL ISSUES**: [N] *(must fix)*
- ⚠️ **CAUTIONS**: [N] *(review recommended)*
- ✅ **VERIFIED**: [N] spot-checks passed
- **Audit Time**: [X] minutes

---

## 🔴 Red Flags (Immediate Attention Required)

*[If none: "No critical issues found in spot check"]*

1. **[Issue]** (Line [N])
   - Problem: [Brief description]
   - Fix: [What to do]
   - Impact: High

2. **[Issue]** (Line [N])
   - Problem: [Brief description]
   - Fix: [What to do]
   - Impact: High

*[List all critical issues found]*

---

## ⚠️ Cautions (Review Recommended)

*[If none: "No important issues flagged"]*

1. **[Issue]** (Line [N])
   - Concern: [Brief description]
   - Suggestion: [What to consider]

2. **[Issue]** (Line [N])
   - Concern: [Brief description]
   - Suggestion: [What to consider]

*[List important issues]*

---

## ✅ Verified (For Reference)

- [N] URLs checked - [X] working correctly
- [N] quotes spot-checked - [X] found in sources
- [N] statistics verified - [X] match sources

---

## Recommendation

[Choose one:]
- ✅ **Clear for Delivery** - Spot check passed, no critical issues
- ⚠️ **Fix Red Flags First** - Address [N] critical issues before proceeding
- 🔍 **Full Audit Recommended** - Multiple issues suggest comprehensive review needed

---

## Next Steps

**Immediate**: [Top priority action]

**If Time Allows**: [Secondary improvements]

**Consider**: [Full audit if X or more critical issues found]

---

*Quick audit completed: [YYYY-MM-DD HH:MM]*
*For comprehensive verification, run full audit using main fact-checker procedures*

```

---

## Template 3: Single Claim Verification Report

Use this template when verifying a specific fact or claim in isolation.

```markdown
# Claim Verification Report

**Claim Verified**: "[exact claim text]"

**Source Document**: [document containing claim]
**Location**: Line [N] / Section: [X]
**Verification Date**: [YYYY-MM-DD]

---

## Claim Details

**Type**: [URL / Quote / Statistic / Name / Date / Technical Spec / Other]

**Context**: [Brief context of how claim is used in document]

**Importance**: [Why this claim matters / Impact if incorrect]

---

## Verification Process

### Sources Checked

1. **[Source 1]**: [file/URL]
   - Method: [Read / Grep / WebFetch]
   - Result: [What was found]

2. **[Source 2]**: [file/URL]
   - Method: [Read / Grep / WebFetch]
   - Result: [What was found]

*[List all sources checked]*

---

### Verification Steps

1. [Step 1 description]
   - Action taken: [Tool/command used]
   - Finding: [What was discovered]

2. [Step 2 description]
   - Action taken: [Tool/command used]
   - Finding: [What was discovered]

3. [Step 3 if needed]
   - Action taken: [Tool/command used]
   - Finding: [What was discovered]

---

## Findings

### Match Assessment

**Claimed**: "[what document states]"

**Found**: "[what sources contain]"

**Match Type**: [Exact / Close / Partial / None]

**Context**: [Preserved / Shifted / Misrepresented / N/A]

---

### Confidence Score: [0-100% or N/A]

**Scoring Breakdown**:
- Source reliability: [+/- points] ([authoritative / reliable / questionable])
- Match precision: [+/- points] ([exact / close / partial / none])
- Context preservation: [+/- points] ([preserved / mostly / partially / not preserved])
- Cross-references: [+/- points] ([multiple / single / none])
- Verification completeness: [+/- points] ([comprehensive / thorough / basic])

**Total**: [Score]% → [Verified / Questionable / Likely False / Unverifiable]

---

### Severity Assessment

**Classification**: [🔴 CRITICAL / 🟡 IMPORTANT / 🟢 MINOR / ⚪ FALSE POSITIVE / ✅ VERIFIED]

**Rationale**: [Explain why this severity level applies]

---

## Evidence

**Source Material**:
```
[Quote or describe actual content from source]
```

**Document Claim**:
```
[Quote from document]
```

**Analysis**: [Compare and explain any discrepancies]

---

## Recommendation

**Action**: [What should be done]

**Specific Fix** (if needed):
```
[Exact text to use as replacement, or specific action to take]
```

**Priority**: [Immediate / High / Medium / Low]

**Estimated Fix Time**: [Quick / Moderate / Requires Research]

---

**Verification Status**: [✅ Approved / ⚠️ Needs Fix / ❌ Reject / ❓ Needs More Info]

---

*Verification completed: [YYYY-MM-DD HH:MM]*
*Verifier: Claude (markdown-fact-checker skill v1.0)*

```

---

## Report Selection Guide

**Use Full Audit Report (Template 1) when**:
- Document is high-stakes (client deliverable, publication, EA report)
- Comprehensive verification required
- Need detailed documentation for review
- Multiple claim types present
- Systematic issues need documentation

**Use Rapid Audit Summary (Template 2) when**:
- Time-constrained situation (pre-meeting check)
- Quick spot-check before delivery
- Initial assessment to determine if full audit needed
- Internal document review
- Quick verification of small documents

**Use Single Claim Verification (Template 3) when**:
- Verifying one specific disputed fact
- Deep-dive on critical claim
- Follow-up verification after document update
- Need detailed evidence trail for single claim
- Training/example documentation

---

## Template Customization Guidelines

### Adapting Templates

**For Different Document Types**:
- EA Reports: Emphasize quote verification, add Hogan cross-reference checks
- Research Documents: Focus on URL and source verification
- Technical Documents: Add technical specification verification sections
- Marketing Materials: Check superlatives and unsupported claims

**For Different Audiences**:
- Technical audience: Include detailed methodology and evidence
- Executive audience: Focus on executive summary and recommendations
- Client-facing: Emphasize professionalism, clarity, and actionable fixes

**For Different Audit Scopes**:
- Full audit: Use complete template
- Targeted audit: Remove irrelevant sections, focus on specific claim types
- Rapid audit: Use summary template
- Follow-up audit: Focus on previously flagged issues

---

## Best Practices for Report Writing

### Clarity

- Use plain language, avoid jargon
- Provide specific line numbers for all findings
- Quote exact text (both claimed and actual)
- Explain technical terms if used

### Completeness

- Document what WAS verified, not just what failed
- Include methodology so audit is reproducible
- Provide evidence for all major findings
- Note limitations and scope boundaries

### Actionability

- Give specific fixes, not just "fix this"
- Prioritize recommendations clearly
- Estimate fix effort (quick/moderate/significant)
- Separate "must fix" from "nice to have"

### Professionalism

- Maintain objective, neutral tone
- Avoid accusatory language ("you made up..." → "no source found for...")
- Present facts, not judgments
- Acknowledge good sourcing when present

---

**Last Updated**: 2026-01-28
**Version**: 1.0
