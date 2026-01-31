---
name: cool-charts
description: >-
  Create stunning interactive data visualizations using D3.js including
  force-directed network graphs, animated timelines, bubble charts, waterfall
  charts, sankey diagrams, radar charts, and dashboards. Use when creating
  visual representations of career data, knowledge graphs, relationships,
  temporal analysis, or any data that benefits from interactive visualization.
  Supports embedded quotes, relationship labels, animations, hover tooltips, and
  cinematic storytelling modes.
category: data-visualization
icon: "\U0001F3A8"
created: '2026-01-30'
---

# 🎨 Cool Charts

Create stunning, interactive data visualizations that transform complex data into engaging visual stories.

## Quick Start

**Choose your visualization type based on your data and story:**

1. **Network Graph** - Explore relationships and discover patterns
2. **Timeline** - Show progression and temporal patterns
3. **Dashboard** - Combine multiple charts for comprehensive insights
4. **Animated Story** - Create cinematic tours through your data

## Workflow

### 1. Choose Chart Type

**For relationship exploration**: Use force-directed network graph
- Best when: Discovering connections, seeing network structure
- Supports: Interactive filtering, physics simulation, hover details

**For temporal analysis**: Use timeline visualization
- Best when: Showing progression, tracking patterns over time
- Supports: Phases, duration bars, quote integration, relationship flows

**For multi-metric analysis**: Use dashboard with multiple chart types
- Best when: Comprehensive overview, comparing multiple dimensions
- Supports: 17+ chart types including bubble, waterfall, sankey, radar

**For presentations**: Add cinematic animation
- Best when: Telling a story, highlighting key moments
- Supports: Scene-based animation, particle effects, dramatic transitions

### 2. Prepare Your Data

Structure data as embedded JSON in the HTML file:

```javascript
const DATA = {
    entities: [/* people, orgs, themes */],
    relationships: [/* connections between entities */],
    quotes: [/* supporting quotes with context */],
    timeline: [/* chronological events */]
};
```

See [references/data-structures.md](references/data-structures.md) for complete schemas.

### 3. Implement Visualization

**For quick implementation**: Start with template from assets/

**For custom implementation**:
1. Load D3.js v7+ from CDN
2. Embed your data as JavaScript constant
3. Create SVG container with proper dimensions
4. Implement chart using patterns from references/chart-types.md
5. Add interactivity (hover, click, filters)
6. Style using design system from references/

### 4. Customize and Enhance

**Visual polish**: Apply design system (vibrant or minimalist)
**Interactivity**: Add filters, tooltips, animations
**Layout**: Follow spacing guidelines to prevent overlap
**Performance**: Optimize for smooth interaction (<200 nodes)

See [references/layout-patterns.md](references/layout-patterns.md) for detailed positioning guidance.

## Available Chart Types

### Network Visualizations
- **Force-Directed Graph** - Physics-based relationship network
- **Chord Diagram** - Circular relationship flows
- **Network Graph** - Hierarchical relationship mapping

### Timeline Visualizations
- **Chronological Timeline** - Linear progression with phases
- **Swimlane Timeline** - Parallel tracks for multiple dimensions
- **Gantt Chart** - Task duration and dependencies
- **Radial Timeline** - Circular time progression

### Comparative Visualizations
- **Bubble Chart** - Multi-dimensional comparison (size, position, color)
- **Radar Chart** - Multi-axis skill/dimension analysis
- **Parallel Coordinates** - Multi-metric comparison across categories
- **Heatmap** - Performance matrix with color intensity

### Flow Visualizations
- **Sankey Diagram** - Flow between stages with proportional width
- **Waterfall Chart** - Cumulative impact visualization
- **Stream Graph** - Stacked area showing role evolution

### Hierarchical Visualizations
- **Treemap** - Nested rectangles showing portfolio composition
- **Sunburst** - Circular hierarchical structure

### Dashboard Components
- **Metrics Dashboard** - KPI cards with key statistics
- **Geographic Map** - Location-based footprint visualization

## Key Features

### Quote Integration
Position quotes on timeline with hover tooltips showing:
- Speaker and context
- Full quote text (truncated at 300 chars)
- Sentiment and certainty indicators
- Confidence badges

See [references/chart-types.md](references/chart-types.md) for implementation details.

### Relationship Labels
Add semantic labels to edges (e.g., "WORKED AT", "FOLLOWED", "EXEMPLIFIES")
- Positioned at curve midpoint
- Background for readability
- Hover highlighting

### Animations
**Edge animations**: Dashed lines with moving offset for loyalty patterns
**Cinematic mode**: Scene-based storytelling with:
- Particle explosions (50-120 particles)
- Zoom effects (1.5x to 3x scale)
- Shake and glow effects
- Sequential highlighting
- Captions and progress tracking

### Design Systems
**Vibrant**: Gradients, shadows, colorful backgrounds, rounded corners
**Minimalist**: Clean lines, subtle borders, uppercase labels, muted palette

## Reference Documentation

**Detailed chart patterns**: [references/chart-types.md](references/chart-types.md)
- Force-directed graph configuration
- Timeline implementation with quotes
- All 17 dashboard chart types
- Interactive features and filters

**Layout best practices**: [references/layout-patterns.md](references/layout-patterns.md)
- Canvas sizing (prevent overlap)
- Layer spacing for timelines
- Quote positioning strategies
- Label placement
- Common issues and solutions

**Data structures**: [references/data-structures.md](references/data-structures.md)
- Entity schemas
- Relationship formats
- Quote integration
- Timeline data requirements

## Implementation Checklist

**Initial Setup**
- [ ] Load D3.js library (v7+)
- [ ] Embed full JSON data
- [ ] Set up SVG container with proper dimensions
- [ ] Define color schemes
- [ ] Create CSS styles

**Core Visualization**
- [ ] Transform data into appropriate format
- [ ] Render primary visual elements
- [ ] Add labels and legends
- [ ] Implement hover/click interactions

**Enhancement**
- [ ] Add filters and controls
- [ ] Integrate quotes (if applicable)
- [ ] Configure animations
- [ ] Test responsive behavior

**Quality Assurance**
- [ ] Verify all interactive elements work
- [ ] Test on different screen sizes
- [ ] Check z-index layering
- [ ] Validate data mapping
- [ ] Export functionality

## Best Practices

1. **Embed data** - Don't rely on external JSON files for production
2. **Use improved layout defaults** - Follow layout-patterns.md for clean visuals
3. **Verify positioning** - Test with console.log before finalizing
4. **Provide legend** - Always include legend for node types and confidence
5. **Consider mobile** - Complex visualizations work better on desktop
6. **Optimize performance** - Limit to <200 nodes for smooth interaction
7. **Enable export** - Provide SVG export for sharing/printing

## Examples

**Career visualization**: Jose Costa dashboard with 17 chart types
- Location: `/home/sasha/all-project-files/deployed-md-files/docs/innovative-visualizations/`
- Files: `00-dashboard-complete.html`, `00-dashboard-cinematic-fixed.html`

**Knowledge graph**: Executive assessment entity relationships
- Network view with interactive filtering
- Timeline view with integrated quotes

---

**Version**: 2.0 - Reorganized as "cool-charts" with progressive disclosure
**Created**: 2026-01-30
**Category**: Data Visualization
