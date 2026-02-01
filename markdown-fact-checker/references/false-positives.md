---
created: '2026-01-28'
---
# False Positives Reference

This reference documents cases that appear to be hallucinations or errors during fact-checking but are actually acceptable variations, reasonable interpretations, or standard editorial practices.

**Purpose**: Prevent over-flagging of acceptable variations that look wrong at first glance but are actually fine.

**When to Use**: Review this guide before finalizing report to ensure flagged issues are genuinely problematic.

---

## What Are False Positives?

**Definition**: Verification findings that initially appear to be errors but are actually acceptable upon closer examination.

**Marking in Reports**: Use ⚪ FALSE POSITIVE classification with brief explanation of why variation is acceptable.

**Principle**: Better to explain why something is acceptable than to flag it incorrectly as an error.

---

## URL Variations

### ✅ Trailing Slash Differences

**Appears Wrong**:
- Document: `https://example.com/about`
- Source/Actual: `https://example.com/about/`

**Why Acceptable**:
- URLs are functionally equivalent
- Both resolve to same page
- Web servers typically treat these identically

**Verdict**: ⚪ FALSE POSITIVE

**Note**: If verification shows both work, accept either form

---

### ✅ HTTP vs HTTPS

**Appears Wrong**:
- Document: `http://example.com`
- Source/Actual: `https://example.com`

**Why Acceptable**:
- HTTP typically auto-redirects to HTTPS
- Same destination, secure version preferred
- Standard web practice

**Verdict**: ⚪ FALSE POSITIVE

**Note in Report**: "Document shows HTTP; site uses HTTPS (standard redirect)"

**When NOT Acceptable**: If HTTP doesn't redirect (unusual but possible)

---

### ✅ www vs non-www

**Appears Wrong**:
- Document: `www.example.com`
- Actual: `example.com` (or vice versa)

**Why Acceptable**:
- Usually resolve to same website
- Both are valid ways to access same site
- Standard DNS configuration

**Verdict**: ⚪ FALSE POSITIVE

**Verification**: WebFetch both versions to confirm they go to same site

**When NOT Acceptable**: If they genuinely point to different content (rare)

---

### ❌ NOT Acceptable: Different Subdomains

**Actually Wrong**:
- Document: `blog.example.com`
- Actual: `docs.example.com`

**Why**: Different subdomains = different sites, different content

**Verdict**: 🔴 CRITICAL if content doesn't match claim

---

### ❌ NOT Acceptable: Different Domains

**Actually Wrong**:
- Document: `example.com`
- Actual: `example.net` or `example-site.com`

**Why**: Completely different sites

**Verdict**: 🔴 CRITICAL

---

## Quote Variations

### ✅ Quotelization (Cleaning Up Spoken Language)

**Appears Wrong**: Document quote is cleaner than transcript

**Why Acceptable**: Standard editorial practice to improve readability while preserving meaning

**Acceptable Quotelization**:
- **Removing filler words**: "um," "uh," "like," "you know," "so," "well"
- **Removing false starts**: "I think, well, actually, what I mean is..."
- **Fixing grammar**: "We was focused" → "We were focused"
- **Removing repetition**: "We really, really focused on growth" → "We really focused on growth"

**Requirements for Acceptability**:
- [ ] Core meaning preserved
- [ ] No substantive words removed
- [ ] Context unchanged
- [ ] Attribution correct

**Example**:

**Source (transcript)**:
```
"So, um, I think, you know, we really focused on, like, operational excellence, which was, uh, really important to us"
```

**Document (quotelized)**:
```
"We really focused on operational excellence, which was really important to us"
```

**Verdict**: ⚪ FALSE POSITIVE - Acceptable quotelization

---

### ✅ Minor Grammar Corrections

**Appears Wrong**: Quote has better grammar than source

**Why Acceptable**: Standard practice for formal documents

**Acceptable Corrections**:
- Subject-verb agreement fixes
- Tense consistency
- Pronoun clarity

**Example**:

**Source**: "We was focused on growth and it help us succeed"

**Document**: "We were focused on growth and it helped us succeed"

**Verdict**: ⚪ FALSE POSITIVE - Standard grammar correction

**When NOT Acceptable**: If grammar change alters meaning or tone

---

### ✅ Combining Related Statements

**Appears Wrong**: Single quote combines content from multiple places in source

**Why Acceptable**: If all from same interview/context and meaning preserved

**Requirements**:
- [ ] All parts from same source document
- [ ] All parts about same topic
- [ ] No contradictory parts omitted
- [ ] Combined meaning is accurate
- [ ] No cherry-picking to misrepresent

**Example**:

**Source (interview transcript)**:
- Line 42: "We focused on growth"
- Line 156: "That growth focus drove everything we did"

**Document**: "We focused on growth, and that growth focus drove everything we did"

**Verdict**: ⚪ FALSE POSITIVE - Acceptable synthesis of related statements

**When NOT Acceptable**:
- Combining statements from different speakers
- Combining statements from different contexts/time periods
- Creating composite that misrepresents original meaning

---

### ❌ NOT Acceptable: Changing Meaning

**Actually Wrong**: Paraphrase or edit changes what was said

**Example**:

**Source**: "We tried to focus on growth but struggled with execution"

**Document**: "We focused on growth"

**Why Wrong**: Removes critical qualifier ("tried to...but struggled")

**Verdict**: 🔴 CRITICAL - Meaning significantly altered

---

### ❌ NOT Acceptable: Adding Words That Change Meaning

**Actually Wrong**: Adding qualifiers or words not in original

**Example**:

**Source**: "We focused on growth"

**Document**: "We exclusively focused on growth"

**Why Wrong**: "Exclusively" adds meaning not in original

**Verdict**: 🔴 CRITICAL or 🟡 IMPORTANT depending on impact

---

## Statistical Variations

### ✅ Reasonable Rounding WITH Qualifier

**Appears Wrong**: Number doesn't match source exactly

**Why Acceptable**: Rounding is disclosed with qualifier word

**Acceptable Qualifiers**:
- "approximately"
- "about"
- "around"
- "roughly"
- "~" (tilde symbol)
- "nearly"
- "close to"

**Example**:

**Source**: "47.3% growth"

**Document**: "approximately 50% growth"

**Verdict**: ⚪ FALSE POSITIVE - Acceptable rounding with qualifier

**Rounding Guidelines**:
- Rounding to nearest 5% or 10% is typically reasonable
- Rounding 47.3% → 50% is acceptable
- Rounding 42% → 50% is questionable (too much rounding)

---

### ✅ Range vs Specific Number

**Appears Wrong**: Source has specific number, document has range

**Why Acceptable**: Range includes the specific number

**Example**:

**Source**: "$1.5M revenue"

**Document**: "$1-2M revenue"

**Verdict**: ⚪ FALSE POSITIVE - Range accurately includes specific value

**Requirements**:
- [ ] Specific number falls within stated range
- [ ] Range isn't misleadingly wide
- [ ] Context appropriate for range vs. specific number

**When NOT Acceptable**:
- Range doesn't include actual number
- Range so wide it's meaningless (e.g., "$1-10M" for "$1.5M")

---

### ❌ NOT Acceptable: Rounding Without Qualifier

**Actually Wrong**: "50%" when source says "47.3%" with no qualifier

**Why Wrong**: Implies precision when actually rounded

**Verdict**: 🟡 IMPORTANT - Add qualifier ("approximately")

**Fix**: Change to "approximately 50%" or use exact number "47.3%"

---

### ❌ NOT Acceptable: Wrong Magnitude

**Actually Wrong**: "$1.5M" stated as "$1.5B"

**Why Wrong**: Completely different number (1000x difference)

**Verdict**: 🔴 CRITICAL - Major factual error

---

### ❌ NOT Acceptable: Wrong Units

**Actually Wrong**: Percentage vs. decimal, absolute vs. relative

**Examples**:
- Source: "0.50" → Document: "50" (missing %)
- Source: "50% increase" → Document: "increased to 50%" (relative vs. absolute)

**Verdict**: 🔴 CRITICAL - Changes meaning significantly

---

## Name/Organization Variations

### ✅ Company Name Variations (Same Entity)

**Appears Wrong**: Different forms of same company name

**Why Acceptable**: Companies often have multiple valid name forms

**Acceptable Variations**:
- "Corporation" / "Corp" / "Corp."
- "Incorporated" / "Inc" / "Inc."
- "Limited" / "Ltd" / "Ltd."
- "Company" / "Co" / "Co."
- With or without legal suffix
- "The" vs. no "The"

**Example**:

**Source**: "Acme Corporation"

**Document**: "Acme Corp"

**Verdict**: ⚪ FALSE POSITIVE - Same entity, acceptable abbreviation

**Verification**: Confirm both forms refer to same entity (check context, website, official documents)

---

### ✅ Acronyms and Full Names

**Appears Wrong**: Acronym vs. full name

**Why Acceptable**: Standard practice to use both forms

**Example**:

**Source**: "Chief Executive Officer"

**Document**: "CEO"

**Verdict**: ⚪ FALSE POSITIVE - Standard abbreviation

**Also Acceptable**: Using acronym after first defining it

---

### ✅ Personal Name Variations

**Appears Wrong**: Different forms of same person's name

**Why Acceptable**: People go by multiple name forms

**Acceptable Variations**:
- "Robert Smith" / "Bob Smith" (if source uses both)
- "John Smith, Jr." / "John Smith" (if context clear)
- "Dr. Smith" / "Smith" / "Jane Smith"

**Verdict**: ⚪ FALSE POSITIVE - If clearly same person

**Requirement**: Evidence that source uses both forms or context makes identity clear

---

### ❌ NOT Acceptable: Similar Names, Different Entities

**Actually Wrong**: Confusing entities with similar names

**Example**:

**Source**: "Acme Corporation"

**Document**: "Acme Technologies"

**Why Wrong**: Different companies despite similar names

**Verdict**: 🔴 CRITICAL - Wrong entity

**How to Verify**: Check if they're in same industry, location, have same people, etc.

---

## Date/Time Variations

### ✅ Date Format Differences

**Appears Wrong**: Same date in different formats

**Why Acceptable**: Multiple valid date formats

**Acceptable Variations**:
- "January 15, 2024" / "15 January 2024" / "Jan 15, 2024"
- "2024-01-15" (ISO format)
- "01/15/2024" / "15/01/2024" (context determines interpretation)
- "1/15/24"

**Verdict**: ⚪ FALSE POSITIVE - Same date, different format

**Verification**: Confirm the actual date is the same

---

### ✅ Approximate Timeframes

**Appears Wrong**: Specific date vs. general timeframe

**Why Acceptable**: Appropriate level of precision for context

**Example**:

**Source**: "March 15, 2024"

**Document**: "Q1 2024" or "early 2024" or "spring 2024"

**Verdict**: ⚪ FALSE POSITIVE - Acceptable generalization

**Requirement**: Specific date falls within stated timeframe

**When NOT Acceptable**: Timeframe doesn't include specific date

---

### ❌ NOT Acceptable: Wrong Month/Year

**Actually Wrong**: Date components don't match

**Example**:

**Source**: "January 2024"

**Document**: "January 2023"

**Verdict**: 🔴 CRITICAL - Wrong year

---

## Attribution Variations

### ✅ Company vs Official Spokesperson

**Appears Wrong**: Document attributes to company, source quotes individual

**Why Acceptable**: Official representatives speak for organization

**Example**:

**Source**: "CEO John Smith stated in press release..."

**Document**: "Acme Corp stated..."

**Verdict**: ⚪ FALSE POSITIVE - CEO speaks officially for company

**Requirements**:
- [ ] Person has authority to speak for organization
- [ ] Statement made in official capacity (not personal opinion)
- [ ] Context makes organizational attribution reasonable

**When NOT Acceptable**:
- Personal opinion attributed to company
- Unofficial statement attributed as official
- Individual speaking against company position

---

### ✅ Press Release vs Company

**Appears Wrong**: Attribution to "company" vs "company press release"

**Why Acceptable**: Press releases are official company communications

**Verdict**: ⚪ FALSE POSITIVE

---

### ❌ NOT Acceptable: Misattribution Between Entities

**Actually Wrong**: Attributes to Company A what Company B said

**Verdict**: 🔴 CRITICAL

---

## Content Organization Variations

### ✅ Reordered Information

**Appears Wrong**: Document presents points in different order than source

**Why Acceptable**: Reorganization for clarity and flow

**Requirements**:
- [ ] All information still present
- [ ] No meaning changed by reordering
- [ ] Chronology not violated (don't put effects before causes)
- [ ] Logical relationships preserved

**Example**:

**Source**: "We increased revenue, hired staff, and expanded operations"

**Document**: "Through expanding operations and hiring staff, revenue increased"

**Verdict**: ⚪ FALSE POSITIVE - Reordered for narrative flow

---

### ✅ Synthesized Information

**Appears Wrong**: Document synthesizes multiple sources

**Why Acceptable**: Synthesis is analysis, not hallucination

**Requirements**:
- [ ] All sources properly cited
- [ ] Synthesis is accurate representation
- [ ] No unsupported claims in synthesis
- [ ] Clear when it's synthesis vs. direct claim from source

**Example**:

**Sources**:
- Report A: "Company has 200 employees"
- Report B: "Offices in 10 cities"

**Document**: "Company has 200 employees across 10 cities [sources A, B]"

**Verdict**: ⚪ FALSE POSITIVE - Accurate synthesis

---

## Technical/Formatting Variations

### ✅ Number Formatting

**Appears Wrong**: Numbers formatted differently

**Why Acceptable**: Multiple valid formats

**Acceptable Variations**:
- "1,000" / "1000" (comma vs. no comma)
- "$1.5M" / "$1,500,000" / "$1.5 million"
- "50%" / "50 percent"

**Verdict**: ⚪ FALSE POSITIVE

---

### ✅ Capitalization Differences

**Appears Wrong**: Different capitalization

**Why Acceptable**: Style choice

**Acceptable Variations**:
- "internet" / "Internet"
- "Company" / "company" (when referring to specific entity)
- Title case vs. sentence case in headings

**Verdict**: ⚪ FALSE POSITIVE - Style variation

---

## How to Use This Guide

### Before Finalizing Report

**Step 1**: Review all flagged issues

**Step 2**: For each issue, check this guide:
- Is this variation actually listed as acceptable?
- Do all requirements for acceptability apply?
- Is there a similar pattern listed?

**Step 3**: Reclassify as ⚪ FALSE POSITIVE if:
- Pattern matches guide examples
- All requirements met
- Variation doesn't materially change accuracy

**Step 4**: Document why it's acceptable:
- Reference this guide: "FALSE POSITIVE: Acceptable quotelization (see false-positives.md)"
- Brief explanation in report
- Note in findings section

---

### When Uncertain

**If unsure whether variation is acceptable**:

1. **Ask the key question**: "Does this variation materially affect accuracy or mislead the reader?"
   - NO → Likely false positive
   - YES → Likely real issue

2. **Mark as 🟡 IMPORTANT** (not CRITICAL) with note: "Uncertain if false positive - needs review"

3. **Explain the variation** and provide both versions for comparison

4. **Let user decide** whether to accept or fix

**Principle**: Better to flag uncertainty than to either wrongly criticize or miss real error

---

## Summary Table: Quick Reference

| Variation Type | Acceptable | Not Acceptable |
|----------------|------------|----------------|
| **URLs** | Trailing slash, http/https, www variations | Different paths, different domains |
| **Quotes** | Quotelization (filler removed), grammar fixes | Meaning changes, added content |
| **Numbers** | Rounding WITH qualifier, ranges including number | Rounding without qualifier, wrong magnitude |
| **Names** | Corp/Corporation, CEO vs. full name | Similar names of different entities |
| **Dates** | Format differences, date within timeframe | Wrong month/year, wrong timeframe |
| **Attribution** | Company vs. CEO (official statement) | Wrong entity attribution |
| **Organization** | Reordering for flow, accurate synthesis | Chronology violations, unsupported synthesis |

---

## Common False Positive Patterns

### Pattern 1: "Different but Equivalent"
- URL variations (http→https, www)
- Name abbreviations (Corp/Corporation)
- Date formats (Jan 15 vs. 1/15)

**Verdict**: ⚪ Accept if truly equivalent

---

### Pattern 2: "Precision Appropriate to Context"
- Specific date → Quarter/Season
- Exact number → "Approximately X"
- Formal quote → Cleaned quotelization

**Verdict**: ⚪ Accept if precision level appropriate

---

### Pattern 3: "Standard Editorial Practice"
- Removing filler words from quotes
- Grammar corrections
- Reordering for narrative flow

**Verdict**: ⚪ Accept if meaning preserved

---

## Final Check

Before marking something as FALSE POSITIVE, verify:

- [ ] I understand why it initially appeared wrong
- [ ] I can explain why it's actually acceptable
- [ ] The variation doesn't materially affect accuracy
- [ ] The variation doesn't mislead readers
- [ ] Pattern matches examples in this guide OR follows same principles
- [ ] All requirements for acceptability are met
- [ ] I would be comfortable defending this as acceptable

If all checkboxes are YES → Mark as ⚪ FALSE POSITIVE with explanation

If any are NO → Keep as flagged issue with appropriate severity

---

**Last Updated**: 2026-01-28
**Version**: 1.0
