---
created: '2026-01-30'
---
# Chart Types Reference

Detailed implementation patterns for all supported visualization types.

## Table of Contents

1. [Force-Directed Network Graph](#force-directed-network-graph)
2. [Timeline Visualization](#timeline-visualization)
3. [Dashboard Chart Types](#dashboard-chart-types)
4. [Quote Integration](#quote-integration)
5. [Relationship Labels](#relationship-labels)
6. [Interactive Features](#interactive-features)
7. [Design Systems](#design-systems)

---

## Force-Directed Network Graph

**Best For**: Exploring relationships, discovering patterns, seeing network structure

### Configuration

```javascript
// Physics simulation parameters
const simulation = d3.forceSimulation(nodes)
    .force('link', d3.forceLink(links)
        .id(d => d.id)
        .distance(100))           // Link distance: 50-200
    .force('charge', d3.forceManyBody()
        .strength(-300))          // Repulsion: -100 to -500
    .force('center', d3.forceCenter(width/2, height/2))
    .force('collision', d3.forceCollide()
        .radius(30));             // Collision radius: 20-50

// Node sizing (confidence-based)
svg.selectAll('.node')
    .data(nodes)
    .join('circle')
    .attr('class', 'node')
    .attr('r', d => 8 + (d.confidence * 8))  // Base + confidence factor
    .attr('fill', d => colors[d.type])
    .attr('stroke', '#fff')
    .attr('stroke-width', 2);
```

### Color Schemes

```javascript
const colors = {
    person: '#667eea',   // Blue
    org: '#f56565',      // Red
    theme: '#48bb78',    // Green
    place: '#ed8936',    // Orange
    claim: '#9f7aea'     // Purple
};
```

### Style Variations

**Vibrant Style**:
- Gradients on nodes
- Drop shadows for depth
- Colorful gradient background
- Rounded corners (8-12px)

**Minimalist Style**:
- Solid colors with subtle borders
- White/light gray background
- Clean lines, minimal shadows
- Sharp corners (0-2px)

---

## Timeline Visualization

**Best For**: Career progression, temporal analysis, tracking patterns over time

### Layer Structure

```javascript
// Calculate Y position for each layer
function layerToY(layer) {
    const centerY = height / 2;
    return centerY + (layer - 0.5) * CONFIG.layerHeight;
}

// Standard layers:
// Layer -0.8: Quotes (Y≈340) - well above timeline axis
// Layer 0: Organizations (Y≈450) - on the timeline
// Layer 1: People (Y≈700)
// Layer 2: Themes (Y≈950)
```

### Configuration

```javascript
const CONFIG = {
    width: 3000,
    height: 1400,  // Increased from 1000 to prevent overlap
    margin: {
        top: 150,
        right: 100,
        bottom: 150,
        left: 100
    },
    layerHeight: 250,  // Increased from 200 for better vertical spacing
    nodeRadius: {
        org: 35,
        person: 28,
        theme: 25
    },
    yearStart: 2000,
    yearEnd: 2025
};
```

### Timeline Components

1. **Phase Labels** - Career stages at top
```javascript
svg.selectAll('.phase-separator')
    .data(phases)
    .join('line')
    .attr('class', 'phase-separator')
    .attr('x1', d => yearToX(d.yearStart))
    .attr('x2', d => yearToX(d.yearStart))
    .attr('y1', 0)
    .attr('y2', height)
    .attr('stroke', 'rgba(255,255,255,0.2)')
    .attr('stroke-dasharray', '5,5');
```

2. **Timeline Axis** - Center line with year markers
```javascript
// Main axis line
svg.append('line')
    .attr('class', 'timeline-axis')
    .attr('x1', yearToX(yearStart))
    .attr('x2', yearToX(yearEnd))
    .attr('y', layerToY(0))
    .attr('stroke', 'rgba(255,255,255,0.3)')
    .attr('stroke-width', 2);

// Year markers
for (let year = yearStart; year <= yearEnd; year += 2) {
    svg.append('text')
        .attr('class', 'year-label')
        .attr('x', yearToX(year))
        .attr('y', layerToY(0) + 30)
        .attr('text-anchor', 'middle')
        .text(year);
}
```

3. **Duration Bars** - Show tenure at organizations
```javascript
svg.selectAll('.duration-bar')
    .data(timeline.filter(d => d.type === 'org' && d.duration))
    .join('line')
    .attr('class', 'duration-bar')
    .attr('x1', d => yearToX(d.year))
    .attr('x2', d => yearToX(d.yearEnd || d.year + d.duration))
    .attr('y', d => layerToY(d.layer))
    .attr('stroke', 'rgba(255,255,255,0.4)')
    .attr('stroke-width', 4);
```

4. **Curved Edges** - Connect related nodes
```javascript
svg.selectAll('.edge')
    .data(relationships)
    .join('path')
    .attr('class', 'edge')
    .attr('d', d => {
        const source = positions.get(d.from);
        const target = positions.get(d.to);
        const midX = (source.x + target.x) / 2;
        const controlY = (source.y + target.y) / 2 - Math.abs(target.y - source.y) * 0.3;
        return `M ${source.x},${source.y} Q ${midX},${controlY} ${target.x},${target.y}`;
    })
    .attr('fill', 'none')
    .attr('stroke', 'rgba(255,255,255,0.2)')
    .attr('stroke-width', 2);
```

---

## Dashboard Chart Types

### 1. Bubble Chart - Impact vs Tenure

```javascript
// Multi-dimensional comparison using position and size
svg.selectAll('.bubble')
    .data(data)
    .join('circle')
    .attr('class', 'bubble')
    .attr('cx', d => xScale(d.tenure))
    .attr('cy', d => yScale(d.impact))
    .attr('r', d => sizeScale(d.revenue))
    .attr('fill', d => d.color)
    .attr('opacity', 0.85);
```

### 2. Sankey Diagram - Flow Between Stages

```javascript
// Proportional flow visualization
const sankey = d3.sankey()
    .nodeWidth(20)
    .nodePadding(20)
    .extent([[0, 0], [width, height]]);

const {nodes, links} = sankey({
    nodes: data.nodes.map(d => Object.assign({}, d)),
    links: data.links.map(d => Object.assign({}, d))
});
```

### 3. Waterfall Chart - Cumulative Impact

```javascript
// Show sequential impact contributions
let cumulative = 0;
const waterfall = data.map(d => {
    const start = cumulative;
    cumulative += d.value;
    return {
        ...d,
        start,
        end: cumulative,
        height: d.value
    };
});
```

### 4. Radar Chart - Skill Dimensions

```javascript
// Multi-axis circular chart
const angleSlice = (Math.PI * 2) / dimensions.length;

const radarLine = d3.lineRadial()
    .radius(d => radiusScale(d.value))
    .angle((d, i) => i * angleSlice);
```

### 5. Heatmap - Performance Matrix

```javascript
// Color-coded grid
svg.selectAll('.cell')
    .data(data)
    .join('rect')
    .attr('class', 'cell')
    .attr('x', d => xScale(d.category))
    .attr('y', d => yScale(d.metric))
    .attr('width', xScale.bandwidth())
    .attr('height', yScale.bandwidth())
    .attr('fill', d => colorScale(d.value));
```

### 6. Treemap - Portfolio Composition

```javascript
// Nested rectangles
const treemap = d3.treemap()
    .size([width, height])
    .padding(2);

const root = d3.hierarchy(data)
    .sum(d => d.value)
    .sort((a, b) => b.value - a.value);

treemap(root);
```

### 7. Sunburst - Hierarchical Circle

```javascript
// Circular hierarchy
const partition = d3.partition()
    .size([2 * Math.PI, radius]);

const arc = d3.arc()
    .startAngle(d => d.x0)
    .endAngle(d => d.x1)
    .innerRadius(d => d.y0)
    .outerRadius(d => d.y1);
```

---

## Quote Integration

### Positioning Strategy

```javascript
// 1. Map organizations to years for context
const orgYearMap = new Map();
entities.filter(e => e.type === 'org').forEach(entity => {
    const match = entity.notes.match(/~(\d{4})-(\d{4})/);
    if (match) {
        const midYear = (parseInt(match[1]) + parseInt(match[2])) / 2;
        orgYearMap.set(entity.id, midYear);
    }
});

// 2. Position each quote
quotes.forEach((quote, idx) => {
    // Get year from company context or time_iso
    let year = orgYearMap.get(quote.company_context_entity_id);
    if (!year && quote.time_iso) {
        const match = quote.time_iso.match(/(\d{4})/);
        year = match ? parseInt(match[1]) : 2010;
    }

    // Position on dedicated layer - well above timeline axis
    const layer = -0.8;  // Y≈340

    // Stagger horizontally to prevent overlap
    const offsetX = (idx % 7) * 60 - 180;  // -180 to +180 spread
    const x = yearToX(year) + offsetX;
    const y = layerToY(layer);

    quotePositions.set(quote.id, {x, y, quote});
});
```

### Hover Tooltip

```javascript
function showQuoteTooltip(event, quote) {
    const tooltip = document.getElementById('quote-tooltip');

    // Build tooltip content
    const speaker = entities.find(e => e.id === quote.speaker_entity_id);
    const context = entities.find(e => e.id === quote.company_context_entity_id);

    tooltip.innerHTML = `
        <div class="quote-tooltip-header">
            <span class="quote-icon">💬</span>
            <div>
                <div class="quote-speaker">${speaker?.name || 'Unknown'}</div>
                <div class="quote-context">
                    ${context?.name || 'Unknown context'} •
                    <span class="confidence-badge">${Math.round(quote.confidence * 100)}%</span>
                </div>
            </div>
        </div>
        <div class="quote-tooltip-text">
            "${quote.quote_text.substring(0, 300)}${quote.quote_text.length > 300 ? '...' : ''}"
        </div>
        <div class="quote-tooltip-footer">
            Sentiment: ${quote.sentiment} • Certainty: ${quote.certainty}
        </div>
    `;

    // Position near mouse, keep on screen
    const containerRect = event.currentTarget.getBoundingClientRect();
    let left = event.pageX - containerRect.left + 20;
    let top = event.pageY - containerRect.top - 50;

    // Flip left if would go off right edge
    if (left + 500 > containerRect.width) {
        left = event.pageX - containerRect.left - 520;
    }

    tooltip.style.left = left + 'px';
    tooltip.style.top = top + 'px';
    tooltip.style.display = 'block';
}
```

### CSS Styling

```css
.quote-marker-circle {
    fill: rgba(237, 137, 54, 0.3);
    stroke: #ed8936;
    stroke-width: 2;
    cursor: pointer;
}

.quote-marker:hover .quote-marker-circle {
    fill: rgba(237, 137, 54, 0.8);
    stroke: #ff9f5a;
    filter: drop-shadow(0 0 12px rgba(237, 137, 54, 0.9));
}

.quote-tooltip {
    position: absolute;
    background: rgba(0, 0, 0, 0.95);
    border: 2px solid #ed8936;
    border-radius: 12px;
    padding: 20px;
    max-width: 500px;
    z-index: 2000;
    pointer-events: none;
}

.quote-tooltip-header {
    display: flex;
    gap: 12px;
    margin-bottom: 12px;
}

.quote-icon {
    font-size: 24px;
}

.quote-speaker {
    font-weight: 600;
    font-size: 16px;
    color: #fff;
}

.quote-context {
    font-size: 12px;
    color: #aaa;
    margin-top: 4px;
}

.quote-tooltip-text {
    font-size: 14px;
    line-height: 1.6;
    color: #fff;
    font-style: italic;
    margin-bottom: 12px;
}

.quote-tooltip-footer {
    font-size: 11px;
    color: #888;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.confidence-badge {
    background: rgba(72, 187, 120, 0.3);
    color: #48bb78;
    padding: 2px 6px;
    border-radius: 4px;
    font-size: 10px;
    font-weight: 600;
}
```

---

## Relationship Labels

### Edge Label Positioning

Position labels at the midpoint of quadratic Bezier curves:

```javascript
// 1. Calculate curve control point
const midX = (source.x + target.x) / 2;
const controlY = (source.y + target.y) / 2 - Math.abs(target.y - source.y) * 0.3;

// 2. Calculate position at t=0.5 on curve (Bezier formula)
const labelX = 0.25 * source.x + 0.5 * midX + 0.25 * target.x;
const labelY = 0.25 * source.y + 0.5 * controlY + 0.25 * target.y;

// 3. Create label with background
const labelGroup = svg.append('g')
    .attr('class', 'edge-label-group')
    .attr('transform', `translate(${labelX}, ${labelY})`);

// 4. Add background rectangle
const labelText = relationship.type.replace(/_/g, ' ');
const padding = 6;
const textWidth = labelText.length * 5.5;

labelGroup.append('rect')
    .attr('class', 'edge-label-bg')
    .attr('x', -textWidth / 2 - padding)
    .attr('y', -8)
    .attr('width', textWidth + padding * 2)
    .attr('height', 16)
    .attr('rx', 4);

// 5. Add text
labelGroup.append('text')
    .attr('class', 'edge-label')
    .attr('y', 4)
    .attr('text-anchor', 'middle')
    .text(labelText.toUpperCase());
```

### Label Styling

```css
.edge-label {
    fill: rgba(255, 255, 255, 0.9);
    font-size: 10px;
    font-weight: 600;
    text-anchor: middle;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.edge-label-bg {
    fill: rgba(26, 26, 46, 0.85);
}
```

### Common Relationship Types

```javascript
const relationshipLabels = {
    worked_at: 'WORKED AT',
    exemplifies: 'EXEMPLIFIES',
    demonstrated_at: 'DEMONSTRATED AT',
    franchisee: 'FRANCHISEE',
    followed: 'FOLLOWED',
    hired: 'HIRED',
    reported_to: 'REPORTED TO',
    managed: 'MANAGED',
    collaborated: 'COLLABORATED'
};
```

---

## Interactive Features

### Hover Effects

```javascript
// Node hover
svg.selectAll('.node')
    .on('mouseenter', function(event, d) {
        d3.select(this)
            .attr('stroke-width', 4)
            .attr('stroke', '#fff')
            .style('filter', 'drop-shadow(0 0 8px rgba(255,255,255,0.8))');

        showTooltip(event, d);
    })
    .on('mouseleave', function() {
        d3.select(this)
            .attr('stroke-width', 2)
            .style('filter', 'none');

        hideTooltip();
    });

// Edge hover
svg.selectAll('.edge')
    .on('mouseenter', function() {
        d3.select(this)
            .attr('stroke', 'rgba(255,255,255,0.6)')
            .attr('stroke-width', 3);
    })
    .on('mouseleave', function() {
        d3.select(this)
            .attr('stroke', 'rgba(255,255,255,0.2)')
            .attr('stroke-width', 2);
    });
```

### Click Interactions

```javascript
// Node selection
svg.selectAll('.node')
    .on('click', function(event, d) {
        event.stopPropagation();

        // Clear previous selection
        svg.selectAll('.node').classed('selected', false);

        // Select this node
        d3.select(this).classed('selected', true);

        // Show info panel
        showInfoPanel(d);
    });

// Deselect on background click
svg.on('click', function() {
    svg.selectAll('.node').classed('selected', false);
    hideInfoPanel();
});
```

### Filters

```javascript
// Node type filters
function updateNodeTypeFilter(type, visible) {
    svg.selectAll('.node')
        .filter(d => d.type === type)
        .transition()
        .duration(300)
        .attr('opacity', visible ? 0.85 : 0.1);
}

// Relationship filters
function updateRelationshipFilter(relType, visible) {
    svg.selectAll('.edge')
        .filter(d => d.type === relType)
        .transition()
        .duration(300)
        .attr('opacity', visible ? 0.3 : 0);
}

// UI controls
document.querySelectorAll('.filter-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        const filterType = this.dataset.type;
        const filterValue = this.dataset.value;
        const active = this.classList.toggle('active');

        if (filterType === 'node') {
            updateNodeTypeFilter(filterValue, active);
        } else {
            updateRelationshipFilter(filterValue, active);
        }
    });
});
```

### Animations

```javascript
// Animated edges (dashed flow)
svg.selectAll('.edge-animated')
    .attr('class', 'edge edge-animated')
    .attr('stroke-dasharray', '8, 4');

// CSS animation
const style = document.createElement('style');
style.textContent = `
    .edge-animated {
        animation: dashFlow 20s linear infinite;
    }

    @keyframes dashFlow {
        from { stroke-dashoffset: 0; }
        to { stroke-dashoffset: 240; }
    }
`;
document.head.appendChild(style);

// Toggle animation control
document.getElementById('toggleAnimation').addEventListener('click', function() {
    const edges = svg.selectAll('.edge-animated');
    const animating = this.classList.toggle('active');
    edges.style('animation-play-state', animating ? 'running' : 'paused');
});
```

---

## Design Systems

### Vibrant/Engaging Style

```javascript
// Gradient definitions
const defs = svg.append('defs');

// Node gradients
defs.append('linearGradient')
    .attr('id', 'grad-person')
    .attr('x1', '0%').attr('y1', '0%')
    .attr('x2', '0%').attr('y2', '100%')
    .selectAll('stop')
    .data([
        {offset: '0%', color: '#667eea'},
        {offset: '100%', color: '#764ba2'}
    ])
    .join('stop')
    .attr('offset', d => d.offset)
    .attr('stop-color', d => d.color);
```

```css
/* Vibrant styling */
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    font-family: 'Inter', sans-serif;
}

.node {
    filter: drop-shadow(0 4px 6px rgba(0,0,0,0.3));
}

.control-panel {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 12px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
    padding: 24px;
}

.btn {
    border-radius: 8px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    padding: 12px 24px;
    font-weight: 600;
}
```

### Minimalist/Clean Style

```css
/* Minimalist styling */
body {
    background: #fafafa;
    font-family: 'Inter', sans-serif;
}

.node {
    stroke: 1px solid rgba(0,0,0,0.1);
}

.control-panel {
    background: white;
    border: 1px solid #e0e0e0;
    border-radius: 2px;
    padding: 24px;
}

.btn {
    border-radius: 0;
    background: #1a1a1a;
    color: white;
    border: none;
    padding: 12px 24px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-size: 11px;
}

.label {
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    color: #666;
}
```

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-30
