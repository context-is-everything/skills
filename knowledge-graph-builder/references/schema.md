---
created: '2026-01-31'
---
# Knowledge Graph JSON Schema

Complete data structure specification for knowledge graph output.

## Root Structure

```json
{
  "source": { /* metadata about source material */ },
  "entities": [ /* array of entity objects */ ],
  "themes": [ /* array of theme objects */ ],
  "quotes": [ /* array of quote objects */ ],
  "claims": [ /* array of claim objects */ ],
  "relationships": [ /* array of relationship objects */ ]
}
```

## Source Object

```json
{
  "title": "string (required)",
  "source_type": "document|transcript|report|article|other (required)",
  "source_url": "string|null (optional)",
  "extracted_at_iso": "ISO 8601 timestamp (required)"
}
```

## Entity Object

```json
{
  "id": "string (required, unique, format: ent_xxx_nnn)",
  "type": "person|org|place|concept|claim (required)",
  "name": "string (required)",
  "aliases": ["string array (optional)"],
  "notes": "string (optional)",
  "confidence": "float 0.0-1.0 (required)"
}
```

## Theme Object

```json
{
  "id": "string (required, unique, format: theme_nnn)",
  "label": "string (required)",
  "keywords": ["string array (required)"],
  "confidence": "float 0.0-1.0 (required)"
}
```

## Quote Object

```json
{
  "id": "string (required, unique, format: q_nnn)",
  "quote_text": "string (required, verbatim)",
  "speaker_entity_id": "string (required, must reference entity)",
  "about_entity_ids": ["string array (optional, must reference entities)"],
  "theme_ids": ["string array (optional, must reference themes)"],
  "claim_ids": ["string array (optional, must reference claims)"],
  "company_context_entity_id": "string (optional, org entity ID)",
  "location_entity_id": "string (optional, place entity ID)",
  "time_text": "string (optional, human-readable)",
  "time_iso": "ISO 8601 (optional)",
  "sentiment": "positive|negative|neutral|mixed|unclear (required)",
  "certainty": "certain|uncertain|speculative (required)",
  "confidence": "float 0.0-1.0 (required)"
}
```

## Claim Object

```json
{
  "id": "string (required, unique, format: claim_nnn)",
  "claim_text": "string (required)",
  "about_entity_ids": ["string array (optional, must reference entities)"],
  "theme_ids": ["string array (optional, must reference themes)"],
  "time_text": "string (optional)",
  "time_iso": "ISO 8601 (optional)",
  "confidence": "float 0.0-1.0 (required)"
}
```

## Relationship Object

```json
{
  "id": "string (required, unique, format: rel_nnn)",
  "type": "string (required, see relationship-types.md)",
  "from_id": "string (required, must reference entity)",
  "to_id": "string (required, must reference entity/theme/quote/claim)",
  "time_text": "string (optional)",
  "time_iso": "ISO 8601 (optional)",
  "strength": "integer 1-5 (optional, default 3)",
  "inferred": "boolean (optional, default false)",
  "evidence_quote_ids": ["string array (REQUIRED, ≥1 quote ID)"],
  "confidence": "float 0.0-1.0 (required)",
  "notes": "string (optional)"
}
```

## Field Definitions

### Required vs Optional

**Required fields**: Must be present in every object
**Optional fields**: May be omitted if not applicable

### Data Types

**string**: Text value
**float**: Decimal number (e.g., 0.95)
**integer**: Whole number (e.g., 5)
**boolean**: true or false
**array**: List of values (e.g., ["id1", "id2"])

### Enum Values

**source_type**: document, transcript, report, article, other

**entity type**: person, org, place, concept, claim

**sentiment**: positive, negative, neutral, mixed, unclear

**certainty**: certain, uncertain, speculative

**relationship type**: See relationship-types.md for complete list

### ID Formats

**Entities**: `ent_person_001`, `ent_org_001`, `ent_place_001`, `ent_concept_001`

**Themes**: `theme_001`, `theme_002`, etc.

**Quotes**: `q_001`, `q_002`, etc.

**Claims**: `claim_001`, `claim_002`, etc.

**Relationships**: `rel_001`, `rel_002`, etc.

### ISO 8601 Timestamps

**Format**: `YYYY-MM-DDTHH:MM:SSZ`
**Example**: `2026-01-31T12:00:00Z`

For date ranges, use separate fields or time_text: "2010-2015"

## Validation Rules

1. All required fields must be present
2. All ID references must resolve to existing objects
3. Confidence scores must be 0.0-1.0 range
4. Enum values must match allowed options
5. Arrays must contain appropriate types
6. No duplicate IDs within or across arrays
7. Every relationship must have ≥1 evidence_quote_id

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-31
