---
created: '2026-01-30'
---
# Data Structures Reference

Complete JSON schemas for all visualization data types.

## Table of Contents

1. [Embedded Full Data Format](#embedded-full-data-format)
2. [Entity Schema](#entity-schema)
3. [Relationship Schema](#relationship-schema)
4. [Quote Schema](#quote-schema)
5. [Timeline Schema](#timeline-schema)
6. [Dashboard Data Formats](#dashboard-data-formats)

---

## Embedded Full Data Format

The primary data structure for knowledge graph visualizations:

```javascript
const EMBEDDED_FULL_DATA = {
    // Metadata
    source: {
        title: "Executive Assessment - John Doe",
        source_type: "transcript",           // transcript, interview, document
        extracted_at_iso: "2026-01-29T20:00:00Z",
        analyst: "Analyst Name",             // Optional
        version: "1.0"                       // Optional
    },

    // Core entities
    entities: [
        // See Entity Schema section below
    ],

    // Thematic groupings
    themes: [
        {
            id: "theme_001",
            label: "Leadership Development",
            keywords: ["mentorship", "coaching", "development"],
            confidence: 0.95,
            entity_ids: ["ent_person_001", "ent_org_002"]  // Related entities
        }
    ],

    // Supporting quotes
    quotes: [
        // See Quote Schema section below
    ],

    // Verifiable claims
    claims: [
        {
            id: "claim_001",
            claim_text: "Grew revenue from $20M to $320M over 3 years",
            claim_type: "factual",           // factual, opinion, prediction
            verification_status: "verified",  // verified, unverified, disputed
            confidence: 0.95,
            source_quote_id: "q_042",        // Optional reference
            entity_ids: ["ent_org_003"]      // Related entities
        }
    ],

    // Relationships between entities
    relationships: [
        // See Relationship Schema section below
    ]
};
```

---

## Entity Schema

Entities represent people, organizations, places, themes, and claims:

```javascript
{
    id: "ent_person_001",              // Unique identifier
    type: "person",                    // person, org, place, theme, claim
    name: "John Smith",                // Display name
    aliases: [                         // Alternative names
        "John",
        "J. Smith",
        "Johnny"
    ],
    notes: "CEO 2012-2014, ~2012-2014",  // Descriptive notes with time context
    confidence: 0.95,                  // Confidence score 0-1
    metadata: {                        // Optional additional data
        title: "Chief Executive Officer",
        department: "Executive",
        location: "Boston, MA",
        linkedin: "https://linkedin.com/in/johnsmith"
    }
}
```

### Entity Types

**Person**:
```javascript
{
    id: "ent_person_001",
    type: "person",
    name: "John Smith",
    notes: "Reporting relationship to Jane Doe",
    confidence: 0.98
}
```

**Organization**:
```javascript
{
    id: "ent_org_001",
    type: "org",
    name: "Acme Corporation",
    aliases: ["Acme Corp", "ACME"],
    notes: "Fortune 500 company, ~2010-2015",
    confidence: 0.95,
    metadata: {
        industry: "Technology",
        size: "10000+ employees",
        location: "San Francisco, CA"
    }
}
```

**Place**:
```javascript
{
    id: "ent_place_001",
    type: "place",
    name: "Boston Office",
    notes: "Headquarters location 2012-2014",
    confidence: 0.90,
    metadata: {
        address: "123 Main St, Boston, MA",
        coordinates: {lat: 42.3601, lon: -71.0589}
    }
}
```

**Theme**:
```javascript
{
    id: "ent_theme_001",
    type: "theme",
    name: "Operational Excellence",
    notes: "Recurring pattern across multiple roles",
    confidence: 0.88,
    metadata: {
        category: "skill",
        strength: "high"
    }
}
```

**Claim**:
```javascript
{
    id: "ent_claim_001",
    type: "claim",
    name: "Revenue Growth Achievement",
    notes: "Verified through public filings",
    confidence: 0.99,
    metadata: {
        claim_type: "factual",
        verification_status: "verified"
    }
}
```

---

## Relationship Schema

Relationships connect entities with typed, directional links:

```javascript
{
    from_id: "ent_person_001",         // Source entity ID
    to_id: "ent_org_001",              // Target entity ID
    type: "worked_at",                 // Relationship type
    strength: 1.0,                     // Relationship strength 0-1
    confidence: 0.95,                  // Confidence in relationship
    time_context: "2010-2015",         // Optional temporal context
    notes: "CEO role, led transformation",  // Optional description
    metadata: {                        // Optional additional data
        title: "Chief Executive Officer",
        department: "Executive",
        duration_years: 5
    }
}
```

### Common Relationship Types

**Work Relationships**:
- `worked_at` - Person worked at Organization
- `reported_to` - Person reported to Person
- `managed` - Person managed Person
- `collaborated` - Person collaborated with Person

**Organizational Relationships**:
- `owns` - Organization owns Organization
- `acquired_by` - Organization acquired by Organization
- `partner_of` - Organization partner of Organization
- `franchisee` - Organization is franchisee of Organization

**Thematic Relationships**:
- `exemplifies` - Entity exemplifies Theme
- `demonstrated_at` - Theme demonstrated at Organization
- `associated_with` - Entity associated with Entity

**Social Relationships**:
- `followed` - Person followed Person (career progression)
- `hired` - Person hired Person
- `mentored` - Person mentored Person
- `influenced` - Person influenced Person

### Animated Relationships

Mark relationships for animation (e.g., showing loyalty patterns):

```javascript
{
    from_id: "ent_person_001",
    to_id: "ent_person_002",
    type: "followed",
    strength: 1.0,
    confidence: 0.95,
    animated: true,                    // Enable dashed animation
    animation_speed: 20                // Animation duration in seconds
}
```

---

## Quote Schema

Quotes provide supporting evidence with context:

```javascript
{
    id: "q_001",                       // Unique identifier
    quote_text: "I learned more about operations in those three years than in my entire previous career. The franchise model taught me discipline and accountability.",
    speaker_entity_id: "ent_person_001",  // Who said it
    company_context_entity_id: "ent_org_002",  // Where/when context
    time_text: "~2009-2012",           // Human-readable time
    time_iso: "2009/2012",             // Machine-readable time
    sentiment: "positive",             // positive, negative, neutral
    certainty: "certain",              // certain, uncertain, speculative
    confidence: 0.95,                  // Confidence in extraction
    themes: [                          // Related themes
        "theme_001",
        "theme_003"
    ],
    metadata: {                        // Optional additional data
        page: 12,
        line: 245,
        context: "discussing early career"
    }
}
```

### Sentiment Values

- `positive` - Favorable, success-oriented
- `negative` - Unfavorable, challenge-oriented
- `neutral` - Objective, matter-of-fact
- `mixed` - Contains both positive and negative elements

### Certainty Values

- `certain` - Definitive statement
- `uncertain` - Qualified with hedging language
- `speculative` - Hypothetical or future-oriented

---

## Timeline Schema

Timeline-specific data structure for chronological visualizations:

```javascript
const TIMELINE_DATA = {
    // Career phases
    phases: [
        {
            id: 'phase1',
            name: 'Early Career',
            yearStart: 2000,
            yearEnd: 2009,
            color: '#667eea',              // Optional phase color
            description: 'Foundation building'  // Optional
        },
        {
            id: 'phase2',
            name: 'Franchise Leadership',
            yearStart: 2010,
            yearEnd: 2015,
            color: '#f56565'
        }
    ],

    // Timeline nodes
    timeline: [
        {
            id: 'node_001',
            type: 'org',                   // org, person, theme
            name: 'Acme Corporation',
            role: 'Chief Executive Officer',  // Optional subtitle
            year: 2010,                    // Start year
            yearEnd: 2015,                 // End year (optional)
            duration: 5,                   // Duration in years
            confidence: 0.95,
            notes: 'Led transformation to franchise model',
            phase: 'phase2',               // Phase ID
            layer: 0,                      // Visual layer (0=org, 1=person, 2=theme)
            metadata: {
                revenue: '$20M → $320M',
                employees: '50 → 500'
            }
        },
        {
            id: 'node_002',
            type: 'person',
            name: 'Jane Smith',
            role: 'Mentor',
            year: 2011,
            confidence: 0.90,
            phase: 'phase2',
            layer: 1
        },
        {
            id: 'node_003',
            type: 'theme',
            name: 'Operational Excellence',
            year: 2012,
            confidence: 0.88,
            phase: 'phase2',
            layer: 2
        }
    ],

    // Relationships between timeline nodes
    relationships: [
        {
            from: 'node_001',              // Source node ID
            to: 'node_002',                // Target node ID
            type: 'worked_at',             // Relationship type
            animated: true,                // Enable animation
            strength: 1.0,
            confidence: 0.95
        }
    ],

    // Quotes positioned on timeline
    quotes: [
        // Same schema as Quote Schema above
    ]
};
```

---

## Dashboard Data Formats

### Bubble Chart Data

```javascript
const bubbleData = [
    {
        company: "Acme Corp",
        tenure: 5,                         // X-axis: years
        impact: 300,                       // Y-axis: $ millions
        revenue: 320,                      // Bubble size: $ millions
        color: "#667eea",
        category: "Franchise"
    }
];
```

### Sankey Data

```javascript
const sankeyData = {
    nodes: [
        {id: "Entry", name: "Entry Level"},
        {id: "Mid", name: "Mid-Career"},
        {id: "Senior", name: "Senior Leadership"}
    ],
    links: [
        {source: "Entry", target: "Mid", value: 5},
        {source: "Mid", target: "Senior", value: 8}
    ]
};
```

### Waterfall Data

```javascript
const waterfallData = [
    {company: "Company A", impact: 50, cumulative: 50},
    {company: "Company B", impact: 150, cumulative: 200},
    {company: "Company C", impact: 100, cumulative: 300}
];
```

### Radar Data

```javascript
const radarData = {
    dimensions: [
        "Operations",
        "Finance",
        "Strategy",
        "People",
        "Innovation"
    ],
    values: [9, 7, 8, 10, 6]              // Scores 0-10
};
```

### Heatmap Data

```javascript
const heatmapData = [
    {category: "2010-2012", metric: "Revenue", value: 75},
    {category: "2010-2012", metric: "Growth", value: 85},
    {category: "2013-2015", metric: "Revenue", value: 90},
    {category: "2013-2015", metric: "Growth", value: 95}
];
```

### Treemap Data

```javascript
const treemapData = {
    name: "Career",
    children: [
        {
            name: "Franchise",
            children: [
                {name: "Company A", value: 50},
                {name: "Company B", value: 150}
            ]
        },
        {
            name: "Corporate",
            children: [
                {name: "Company C", value: 100}
            ]
        }
    ]
};
```

### Sunburst Data

```javascript
// Same hierarchical structure as treemap
const sunburstData = {
    name: "Career",
    children: [
        {
            name: "Phase 1",
            children: [
                {name: "Role A", value: 3},
                {name: "Role B", value: 5}
            ]
        }
    ]
};
```

### Geographic Data

```javascript
const geoData = [
    {
        location: "Boston, MA",
        lat: 42.3601,
        lon: -71.0589,
        companies: ["Company A", "Company B"],
        years: "2010-2015",
        impact: 200
    }
];
```

### Metrics Dashboard Data

```javascript
const metricsData = {
    totalYears: 25,
    companiesLed: 8,
    revenueGrowth: "$470M",
    avgTenure: 3.1,
    peakRevenue: "$320M",
    teamSize: 500
};
```

---

## Data Validation

### Required Fields

**Entity**:
- `id` (string)
- `type` (string: person/org/place/theme/claim)
- `name` (string)
- `confidence` (number: 0-1)

**Relationship**:
- `from_id` (string)
- `to_id` (string)
- `type` (string)
- `confidence` (number: 0-1)

**Quote**:
- `id` (string)
- `quote_text` (string)
- `speaker_entity_id` (string)
- `confidence` (number: 0-1)

**Timeline Node**:
- `id` (string)
- `type` (string)
- `name` (string)
- `year` (number)
- `layer` (number)

### Validation Example

```javascript
function validateEntity(entity) {
    const required = ['id', 'type', 'name', 'confidence'];
    const missing = required.filter(field => !(field in entity));

    if (missing.length > 0) {
        console.error(`Entity missing fields: ${missing.join(', ')}`, entity);
        return false;
    }

    if (typeof entity.confidence !== 'number' || entity.confidence < 0 || entity.confidence > 1) {
        console.error('Invalid confidence value:', entity.confidence);
        return false;
    }

    const validTypes = ['person', 'org', 'place', 'theme', 'claim'];
    if (!validTypes.includes(entity.type)) {
        console.error('Invalid entity type:', entity.type);
        return false;
    }

    return true;
}

// Validate all entities
EMBEDDED_FULL_DATA.entities.forEach(entity => {
    if (!validateEntity(entity)) {
        throw new Error(`Invalid entity: ${entity.id}`);
    }
});
```

---

## Data Transformation Examples

### Convert Knowledge Graph to Timeline

```javascript
function convertToTimeline(fullData) {
    const timeline = [];

    // Extract organizations with time context
    fullData.entities
        .filter(e => e.type === 'org')
        .forEach(org => {
            const match = org.notes.match(/~(\d{4})-(\d{4})/);
            if (match) {
                timeline.push({
                    id: org.id,
                    type: 'org',
                    name: org.name,
                    year: parseInt(match[1]),
                    yearEnd: parseInt(match[2]),
                    duration: parseInt(match[2]) - parseInt(match[1]),
                    confidence: org.confidence,
                    layer: 0,
                    notes: org.notes
                });
            }
        });

    // Extract people with "worked_at" relationships
    fullData.relationships
        .filter(r => r.type === 'worked_at')
        .forEach(rel => {
            const person = fullData.entities.find(e => e.id === rel.from_id);
            const org = timeline.find(t => t.id === rel.to_id);

            if (person && org) {
                timeline.push({
                    id: person.id,
                    type: 'person',
                    name: person.name,
                    year: org.year,
                    confidence: person.confidence,
                    layer: 1,
                    notes: person.notes
                });
            }
        });

    return timeline;
}
```

### Aggregate Dashboard Metrics

```javascript
function calculateMetrics(fullData) {
    const orgs = fullData.entities.filter(e => e.type === 'org');

    // Calculate total tenure
    const totalYears = orgs.reduce((sum, org) => {
        const match = org.notes.match(/~(\d{4})-(\d{4})/);
        return match ? sum + (parseInt(match[2]) - parseInt(match[1])) : sum;
    }, 0);

    // Calculate average tenure
    const avgTenure = totalYears / orgs.length;

    // Extract revenue data
    const revenues = orgs
        .map(org => {
            const match = org.metadata?.revenue?.match(/\$(\d+)M/);
            return match ? parseInt(match[1]) : 0;
        })
        .filter(r => r > 0);

    const totalRevenue = revenues.reduce((sum, r) => sum + r, 0);
    const peakRevenue = Math.max(...revenues);

    return {
        totalYears: Math.round(totalYears),
        companiesLed: orgs.length,
        revenueGrowth: `$${totalRevenue}M`,
        avgTenure: avgTenure.toFixed(1),
        peakRevenue: `$${peakRevenue}M`
    };
}
```

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-30
