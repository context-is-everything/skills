---
created: '2026-01-31'
---
# Entity Extraction Patterns

Guide for identifying and extracting entities from text with confidence scoring.

## Entity Types

### Person
**Patterns**: Names, roles, titles, relationships
**Example**: "Subject A (Senior Manager)" → {type: "person", name: "Subject A", notes: "Senior Manager"}

**Extraction**:
- Full names and variations
- Professional titles
- Role descriptions
- Relationship contexts

**Confidence Factors**:
- Multiple mentions with consistent context: 0.90+
- Single clear reference with title: 0.75-0.89
- Ambiguous reference (common name): 0.60-0.74

### Organization
**Patterns**: Company names, institutions, brands, groups
**Example**: "Alpha Corp (2010-2015)" → {type: "org", name: "Alpha Corp", notes: "2010-2015 employment"}

**Extraction**:
- Official names and aliases
- Operational dates
- Industry/sector
- Geographic location

**Confidence Factors**:
- Explicit company name with context: 0.90+
- Clear reference without details: 0.75-0.89
- Abbreviated or implied: 0.60-0.74

### Place
**Patterns**: Cities, regions, offices, geographic references
**Example**: "City X headquarters" → {type: "place", name: "City X", notes: "headquarters location"}

**Extraction**:
- Location names
- Geographic context
- Office/facility references

**Confidence Factors**:
- Specific location with context: 0.85+
- General region reference: 0.70-0.84
- Implied location: 0.55-0.69

### Concept/Theme
**Patterns**: Recurring topics, abstract ideas, themes
**Example**: "strategic thinking" → {type: "concept", name: "Strategic Thinking", keywords: ["strategy", "planning"]}

**Extraction**:
- Topic keywords
- Recurring patterns
- Theme clusters

**Confidence Factors**:
- Multiple explicit references: 0.85+
- Pattern across text: 0.70-0.84
- Single mention: 0.55-0.69

### Claim
**Patterns**: Quantifiable assertions, verifiable facts
**Example**: "increased revenue 300%" → {type: "claim", name: "Revenue Growth", notes: "300% increase"}

**Extraction**:
- Specific metrics
- Timebound assertions
- Verifiable facts

**Confidence Factors**:
- Multiple supporting quotes: 0.90+
- Single supporting quote: 0.75-0.89
- Inferred from pattern: 0.60-0.74

## Aliases and Normalization

**Capture variations**:
- "Alpha Corp" / "Alpha" / "Alpha Corporation"
- "Subject A" / "A" / "SA"
- "City X" / "X City" / "X metro area"

**Store in aliases array**: All recognized variations

## Disambiguation

**When encountering ambiguity**:
1. Check context (temporal, spatial, relational)
2. Look for distinguishing details
3. Assign lower confidence if unclear
4. Document ambiguity in notes field

**Example**: "Person B" mentioned twice - same person or different?
- Check: Same organization? Same time period? Same role?
- If unclear: Create separate entities with lower confidence
- Document: "Possible duplicate - requires verification"

## Notes Field

**Use for context**:
- Role/title information
- Time periods
- Disambiguation details
- Relationship context

**Format**: Brief, factual, helpful for visualization tooltips

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-31
