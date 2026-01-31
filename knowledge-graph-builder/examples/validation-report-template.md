---
created: '2026-01-31'
---
# Knowledge Graph Validation Report

**Source**: [Source Title]
**Extracted**: [YYYY-MM-DD]
**Validated By**: [Name/Tool]

---

## Summary Metrics

| Metric | Count | Notes |
|--------|-------|-------|
| Entities | [N] | [N] person, [N] org, [N] place, [N] concept |
| Themes | [N] | Coverage: [N]% |
| Quotes | [N] | Avg confidence: [0.XX] |
| Claims | [N] | Avg confidence: [0.XX] |
| Relationships | [N] | [N] types |

---

## ID Uniqueness ✅ / ❌

- [ ] All entity IDs unique
- [ ] All theme IDs unique
- [ ] All quote IDs unique
- [ ] All claim IDs unique
- [ ] All relationship IDs unique
- [ ] No ID collisions

**Issues**: [List any ID collisions or duplicates]

---

## Referential Integrity ✅ / ❌

- [ ] All speaker_entity_id values valid
- [ ] All about_entity_ids values valid
- [ ] All theme_ids values valid
- [ ] All from_id/to_id values valid
- [ ] All evidence_quote_ids valid
- [ ] No broken references

**Issues**: [List any broken references]

---

## Evidence Completeness ✅ / ❌

- [ ] All relationships have evidence_quote_ids
- [ ] All relationships have ≥1 quote
- [ ] All claims have supporting quotes
- [ ] All themes have linked quotes

**Coverage**:
- Relationships with evidence: [N]%
- Claims with evidence: [N]%
- Themes with quotes: [N]%

**Issues**: [List relationships/claims without evidence]

---

## Timeline Consistency ✅ / ❌

- [ ] Chronological progression valid
- [ ] No date contradictions
- [ ] Time contexts align

**Timeline Span**: [Start] to [End]

**Issues**: [List any timeline contradictions]

---

## Confidence Scoring ✅ / ❌

- [ ] All scores in 0.0-1.0 range
- [ ] No missing scores
- [ ] Scores reflect evidence

**Distribution**:
- High (0.90-1.00): [N]%
- Good (0.75-0.89): [N]%
- Moderate (0.60-0.74): [N]%
- Low (<0.60): [N]%

**Issues**: [List confidence scoring issues]

---

## Entity Normalization ✅ / ❌

- [ ] Aliases captured
- [ ] No duplicate entities
- [ ] Types correctly assigned

**Entities**:
- Person: [N] entities, [N] aliases
- Organization: [N] entities, [N] aliases
- Place: [N] entities, [N] aliases
- Concept: [N] entities, [N] aliases

**Issues**: [List normalization issues]

---

## Graph Completeness ✅ / ❌

- [ ] All entities have ≥1 relationship
- [ ] No orphaned nodes
- [ ] Graph is connected

**Connectivity**:
- Entities with relationships: [N]% ([N]/[N])
- Orphaned entities: [N]

**Issues**: [List orphaned entities]

---

## Schema Compliance ✅ / ❌

- [ ] All required fields present
- [ ] Correct data types
- [ ] Valid enum values
- [ ] Arrays properly formatted

**Issues**: [List schema violations]

---

## Quality Assessment

**Overall Quality Score**: [N]% / 100%

**Strengths**:
- [List strengths]

**Areas for Improvement**:
- [List improvements needed]

**Recommendations**:
- [List specific recommendations]

---

## Detailed Issues

### Critical Issues (Must Fix)

1. [Issue description and location]
2. [Issue description and location]

### Warnings (Should Fix)

1. [Issue description and location]
2. [Issue description and location]

### Informational (Optional)

1. [Observation or suggestion]
2. [Observation or suggestion]

---

## Next Steps

- [ ] [Action item 1]
- [ ] [Action item 2]
- [ ] [Action item 3]

---

**Validation Completed**: [YYYY-MM-DD HH:MM]
**Report Version**: 1.0
