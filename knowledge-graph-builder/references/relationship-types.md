---
created: '2026-01-31'
---
# Relationship Types Reference

Complete taxonomy of relationship types for knowledge graph connections.

## Core Relationship Types

### Professional Relationships

**works_for**: Person → Organization
- Employment relationship
- Evidence: Job titles, employment dates
- Strength: 5 (current), 4 (recent), 3 (historical)

**reports_to**: Person → Person
- Hierarchical reporting relationship
- Evidence: Org charts, explicit statements
- Strength: 5 (direct), 3 (indirect/matrix)

**manages**: Person → Person
- Management responsibility
- Evidence: Team descriptions, role titles
- Strength: 5 (direct reports), 3 (indirect)

**collaborated_with**: Person ↔ Person
- Working partnership
- Evidence: Project mentions, joint work
- Strength: 5 (frequent), 3 (occasional)

**hired**: Person → Person
- Hiring/recruiting action
- Evidence: Explicit hiring statements
- Strength: 5 (direct hire), 3 (influenced hire)

**followed**: Person → Person
- Career path following (loyalty pattern)
- Evidence: Multiple company overlap
- Strength: 5 (multiple companies), 3 (single move)

**mentored**: Person → Person
- Mentorship relationship
- Evidence: Mentorship descriptions
- Strength: 5 (formal mentor), 3 (informal influence)

### Organizational Relationships

**owns**: Organization → Organization
- Ownership/parent company
- Evidence: Acquisition statements, ownership structure
- Strength: 5 (full ownership), 3 (partial)

**acquired_by**: Organization → Organization
- Acquisition target
- Evidence: Acquisition announcements, dates
- Strength: 5 (completed), 3 (pending/announced)

**partner_of**: Organization ↔ Organization
- Business partnership
- Evidence: Partnership descriptions
- Strength: 5 (strategic partner), 3 (vendor/supplier)

**competes_with**: Organization ↔ Organization
- Competitive relationship
- Evidence: Market positioning statements
- Strength: 4 (direct competitor), 2 (indirect)

### Geographic Relationships

**located_in**: Entity → Place
- Physical location
- Evidence: Address, location statements
- Strength: 5 (headquarters), 3 (office), 2 (presence)

**operates_in**: Organization → Place
- Market/operational presence
- Evidence: Market descriptions, territories
- Strength: 5 (primary market), 3 (secondary)

### Evidence Relationships

**said**: Person → Quote
- Speaker attribution
- Evidence: The quote itself
- Strength: 5 (verbatim), 4 (paraphrased)

**mentioned_in**: Entity → Quote
- Entity mentioned in quote
- Evidence: Entity reference in quote text
- Strength: 5 (primary subject), 3 (secondary)

**related_to_theme**: Quote → Theme
- Quote supports theme
- Evidence: Theme assignment rationale
- Strength: Based on theme confidence

**evidence_for**: Quote → Claim
- Quote supports claim
- Evidence: Claim-quote mapping
- Strength: 5 (explicit), 3 (implicit)

**made_claim**: Person → Claim
- Person made assertion
- Evidence: Quote attribution
- Strength: 5 (direct statement), 3 (implied)

## Relationship Attributes

### Required Fields
- `id`: Unique identifier
- `type`: Relationship type from taxonomy
- `from_id`: Source entity ID
- `to_id`: Target entity ID
- `confidence`: 0.0-1.0 score
- `evidence_quote_ids`: Array of supporting quote IDs

### Optional Fields
- `time_text`: Human-readable time context
- `time_iso`: ISO 8601 timestamp
- `strength`: 1-5 relationship strength
- `inferred`: Boolean (explicitly stated vs contextual)
- `notes`: Additional context

## Strength Scoring

**5 - Very Strong**: Multiple clear references, high confidence
**4 - Strong**: Clear reference, good confidence
**3 - Moderate**: Reasonable evidence, moderate confidence
**2 - Weak**: Limited evidence, some uncertainty
**1 - Very Weak**: Minimal evidence, high uncertainty

## Evidence Requirements

**CRITICAL**: Every relationship MUST have evidence_quote_ids array with ≥1 quote ID.

**If no evidence exists**: Do NOT create the relationship.

**Acceptable evidence**:
- Explicit statements in quotes
- Contextual references with inference
- Multiple corroborating quotes (strongest)

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-31
