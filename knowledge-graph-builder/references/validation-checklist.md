---
created: '2026-01-31'
---
# Validation Checklist

Quality assurance procedures for knowledge graph extraction.

## ID Uniqueness

- [ ] All entity IDs unique within entities array
- [ ] All theme IDs unique within themes array
- [ ] All quote IDs unique within quotes array
- [ ] All claim IDs unique within claims array
- [ ] All relationship IDs unique within relationships array
- [ ] No ID collisions across different arrays

## Referential Integrity

- [ ] All `speaker_entity_id` values reference existing entities
- [ ] All `about_entity_ids` values reference existing entities
- [ ] All `theme_ids` values reference existing themes
- [ ] All `claim_ids` values reference existing claims
- [ ] All `from_id` values in relationships reference existing entities
- [ ] All `to_id` values in relationships reference existing entities
- [ ] All IDs in `evidence_quote_ids` arrays reference existing quotes
- [ ] No broken references, no orphaned IDs

## Evidence Completeness

- [ ] Every relationship has `evidence_quote_ids` array
- [ ] Every relationship has ≥1 quote ID in evidence array
- [ ] All evidence_quote_ids resolve to actual quotes
- [ ] All claims have supporting quotes
- [ ] All themes have linked quotes

## Timeline Consistency

- [ ] Chronological progression makes sense
- [ ] No impossible date sequences
- [ ] Time contexts align across related entities
- [ ] `time_text` and `time_iso` values consistent
- [ ] No temporal contradictions

## Confidence Scoring

- [ ] All confidence scores in 0.0-1.0 range
- [ ] No missing confidence scores
- [ ] Scores reflect evidence strength
- [ ] Higher confidence for multiple references
- [ ] Lower confidence for ambiguous/inferred

## Entity Normalization

- [ ] Aliases captured for name variations
- [ ] No duplicate entities (check aliases)
- [ ] Entity types correctly assigned
- [ ] Notes field provides context
- [ ] Ambiguity documented where present

## Quote Quality

- [ ] Quotes are verbatim from source
- [ ] Speaker attribution present
- [ ] Sentiment scored (positive/negative/neutral/mixed/unclear)
- [ ] Certainty scored (certain/uncertain/speculative)
- [ ] Context fields populated where applicable

## Graph Completeness

- [ ] All entities have ≥1 relationship
- [ ] No orphaned nodes
- [ ] Key themes represented
- [ ] Visualization-ready structure
- [ ] Graph is connected (not fragmented)

## Schema Compliance

- [ ] All required fields present
- [ ] Correct data types (confidence = float, not string)
- [ ] Valid enum values (sentiment, certainty, entity type)
- [ ] Array fields are arrays (not single values)
- [ ] ISO 8601 format for timestamps

## Quality Metrics

Calculate and report:
- **Entity count** by type (person, org, place, concept, claim)
- **Relationship count** by type
- **Quote count** with confidence distribution
- **Theme coverage**: % themes with quotes
- **Entity connectivity**: % entities with relationships
- **Timeline span**: Start to end date range
- **Average confidence**: Mean confidence across all elements

## Common Issues

**Orphaned entities**: Delete entities with no relationships or document in related entity notes

**Missing evidence**: Search source for implicit evidence or don't create relationship

**Timeline gaps**: Document gaps in validation report, assign lower confidence

**Ambiguous references**: Use aliases, lower confidence, note ambiguity

**Confidence inflation**: Ensure scores reflect actual evidence, not assumptions

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-31
