---
created: '2026-01-30'
---
# Layout Patterns Reference

Best practices for positioning, spacing, and preventing overlap in visualizations.

## Table of Contents

1. [Canvas Sizing](#canvas-sizing)
2. [Layer Spacing](#layer-spacing)
3. [Quote Positioning](#quote-positioning)
4. [Node Label Positioning](#node-label-positioning)
5. [Edge Label Readability](#edge-label-readability)
6. [Common Issues and Solutions](#common-issues-and-solutions)

---

## Canvas Sizing

### Optimal Dimensions

Use larger canvases for timeline visualizations to prevent overlap:

```javascript
const CONFIG = {
    width: 3000,      // Wide for temporal spread
    height: 1400,     // ✅ Use 1400+ for timelines with quotes (not 1000)
    margin: {
        top: 150,     // ✅ Increased margins for phase labels
        right: 100,
        bottom: 150,  // Space for year labels
        left: 100
    }
};
```

**Why this matters**:
- Height 1000 causes quote/node overlap
- Height 1400+ provides clean vertical separation
- Larger margins prevent edge clipping

### Responsive Considerations

```javascript
// Desktop-optimized (3000px wide)
// Mobile: Consider separate simplified view

// Container scroll
.viz-container {
    width: 100%;
    overflow-x: auto;
    overflow-y: auto;
}
```

---

## Layer Spacing

### Timeline Layer Structure

Use consistent layer spacing to create clear visual hierarchy:

```javascript
const CONFIG = {
    layerHeight: 250,  // ✅ Use 250 (not 200) for proper vertical separation
};

function layerToY(layer) {
    const centerY = height / 2;
    return centerY + (layer - 0.5) * CONFIG.layerHeight;
}
```

### Standard Layers

```javascript
// Layer -0.8: Quotes (Y≈340)
//   Purpose: Supporting evidence, positioned well above timeline
//   Spacing: 250px to layer 0

// Layer 0: Organizations (Y≈450)
//   Purpose: Primary timeline reference, on the axis
//   Spacing: 250px to layer 1

// Layer 1: People (Y≈700)
//   Purpose: Individual contributors, below orgs
//   Spacing: 250px to layer 2

// Layer 2: Themes (Y≈950)
//   Purpose: Abstract concepts, at bottom
```

### Visual Hierarchy

```
Quotes (-0.8)     [Supporting evidence]
        ↓ 250px
Organizations (0) [Timeline axis] ←── Reference point
        ↓ 250px
People (1)        [Individuals]
        ↓ 250px
Themes (2)        [Abstract concepts]
```

**Why 250px spacing**:
- Accommodates node size (radius 25-35px)
- Accommodates labels (2 lines × 16px)
- Provides visual breathing room
- Prevents edge curve overlap

---

## Quote Positioning

### Horizontal Staggering

Prevent quote overlap with wide horizontal offset pattern:

```javascript
quotes.forEach((quote, idx) => {
    // Get year from company context
    const year = orgYearMap.get(quote.company_context_entity_id) || 2010;

    // Position on dedicated layer
    const layer = -0.8;  // ✅ Well above timeline axis (not -0.3)

    // Wide stagger pattern
    const offsetX = (idx % 7) * 60 - 180;  // ✅ -180 to +180 spread (not -80 to +80)

    const x = yearToX(year) + offsetX;
    const y = layerToY(layer);

    quotePositions.set(quote.id, {x, y, quote});
});
```

### Stagger Pattern Visualization

```
Year 2010: [Q1] [Q8]      [Q2] [Q9]      [Q3] [Q10]     [Q4]
           -180  -120      -60    0        60   120       180
             ↑                     ↑                        ↑
           offset              center                   offset
```

**Pattern explanation**:
- 7 horizontal positions (-180, -120, -60, 0, 60, 120, 180)
- 60px spacing between positions
- Cycles through pattern: idx % 7

**Adjust for density**:
```javascript
// Lower density: Use 9 positions
const offsetX = (idx % 9) * 50 - 200;  // -200 to +200

// Higher density: Use 5 positions
const offsetX = (idx % 5) * 60 - 120;  // -120 to +120
```

### Vertical Positioning

```javascript
// Quote layer must be well above axis to avoid overlap
const layer = -0.8;  // Y≈340 (assuming center at 450)

// Why -0.8 works:
// - Axis at layer 0 (Y≈450)
// - -0.8 gives Y≈340
// - Provides 110px clearance
// - Enough for quote markers (radius 12) + labels
```

**Don't use**:
```javascript
// ❌ Too close to axis - will overlap
const layer = -0.3;  // Only 75px clearance

// ❌ Too high - loses visual connection
const layer = -1.5;  // 375px above axis
```

---

## Node Label Positioning

### Label Below Node Pattern

Position labels below nodes to prevent overlap with node circles:

```javascript
const nodeGroup = svg.selectAll('.node-group')
    .data(timeline)
    .join('g')
    .attr('class', 'node-group')
    .attr('transform', d => `translate(${yearToX(d.year)}, ${layerToY(d.layer)})`);

// Node circle
nodeGroup.append('circle')
    .attr('r', d => CONFIG.nodeRadius[d.type])
    .attr('fill', d => colors[d.type]);

// Main label - positioned BELOW node
nodeGroup.append('text')
    .attr('class', 'node-label')
    .attr('y', d => CONFIG.nodeRadius[d.type] + 20)  // ✅ Below node (not y=0)
    .attr('text-anchor', 'middle')
    .attr('font-size', '14px')
    .attr('font-weight', '600')
    .text(d => d.name);

// Sublabel - positioned even lower
nodeGroup.append('text')
    .attr('class', 'node-sublabel')
    .attr('y', d => CONFIG.nodeRadius[d.type] + 34)  // ✅ Below main label
    .attr('text-anchor', 'middle')
    .attr('font-size', '11px')
    .attr('fill', 'rgba(255,255,255,0.7)')
    .text(d => d.role || d.sublabel);
```

### Label Spacing Calculation

```
Node radius: 35px
Label offset: 20px  (clear of circle)
Label height: 14px
Sublabel offset: 34px (20px + 14px line height)
Sublabel height: 11px
Total vertical space: 35 + 34 + 11 = 80px
```

### Truncation for Long Labels

```javascript
function truncateLabel(text, maxLength = 20) {
    return text.length > maxLength
        ? text.substring(0, maxLength - 1) + '...'
        : text;
}

nodeGroup.append('text')
    .text(d => truncateLabel(d.name));
```

---

## Edge Label Readability

### Background Rectangles

Add background rectangles behind edge labels for readability:

```javascript
// Calculate label dimensions
const labelText = relationship.type.replace(/_/g, ' ').toUpperCase();
const padding = 6;
const textWidth = labelText.length * 5.5;  // Approximate width
const textHeight = 16;

// Create label group at edge midpoint
const labelGroup = svg.append('g')
    .attr('class', 'edge-label-group')
    .attr('transform', `translate(${labelX}, ${labelY})`);

// Background rectangle
labelGroup.append('rect')
    .attr('class', 'edge-label-bg')
    .attr('x', -textWidth / 2 - padding)
    .attr('y', -8)  // Vertically center around text
    .attr('width', textWidth + padding * 2)
    .attr('height', textHeight)
    .attr('rx', 4)  // Rounded corners
    .attr('fill', 'rgba(26, 26, 46, 0.85)');

// Text label
labelGroup.append('text')
    .attr('class', 'edge-label')
    .attr('y', 4)  // Baseline offset
    .attr('text-anchor', 'middle')
    .attr('font-size', '10px')
    .attr('font-weight', '600')
    .attr('fill', 'rgba(255, 255, 255, 0.9)')
    .text(labelText);
```

### Positioning Along Curve

```javascript
// Calculate position at t=0.5 on quadratic Bezier curve
function getCurveMidpoint(source, target) {
    const midX = (source.x + target.x) / 2;
    const controlY = (source.y + target.y) / 2 - Math.abs(target.y - source.y) * 0.3;

    // Bezier formula at t=0.5
    const labelX = 0.25 * source.x + 0.5 * midX + 0.25 * target.x;
    const labelY = 0.25 * source.y + 0.5 * controlY + 0.25 * target.y;

    return {x: labelX, y: labelY};
}
```

### Collision Avoidance

For dense graphs, detect and adjust overlapping labels:

```javascript
// Simple collision detection
const labelBounds = [];

relationships.forEach(rel => {
    const pos = getCurveMidpoint(rel.source, rel.target);
    const width = rel.type.length * 5.5 + 12;
    const bounds = {
        x: pos.x - width/2,
        y: pos.y - 8,
        width,
        height: 16
    };

    // Check for overlap
    const overlapping = labelBounds.some(existing =>
        bounds.x < existing.x + existing.width &&
        bounds.x + bounds.width > existing.x &&
        bounds.y < existing.y + existing.height &&
        bounds.y + bounds.height > existing.y
    );

    if (overlapping) {
        // Offset position
        pos.y += 20;  // Move down
    }

    labelBounds.push(bounds);
});
```

---

## Common Issues and Solutions

### Issue: Quotes Not Showing

**Symptoms**: Orange markers missing or not visible

**Causes**:
1. Wrong layer positioning (too high/low Y value)
2. Missing quotes array in embedded data
3. Incorrect entity ID mapping
4. Z-index issues (quotes behind other elements)

**Solutions**:

```javascript
// 1. Verify layer positioning
console.log('Quote layer Y:', layerToY(-0.8));  // Should be ~340
console.log('Axis Y:', layerToY(0));            // Should be ~450

// 2. Verify quotes exist
if (!EMBEDDED_FULL_DATA.quotes || EMBEDDED_FULL_DATA.quotes.length === 0) {
    console.error('No quotes in embedded data');
    return;
}

// 3. Debug entity mapping
quotes.forEach(q => {
    const company = entities.find(e => e.id === q.company_context_entity_id);
    console.log('Quote company:', company?.name || 'NOT FOUND');
});

// 4. Ensure proper rendering order
// Render in this order: edges → nodes → quotes (quotes on top)
renderEdges();
renderNodes();
renderQuotes();  // Last = on top
```

### Issue: Labels Overlapping Nodes

**Symptoms**: Text appears inside or overlapping node circles

**Causes**:
- Label positioned at y=0 (centered on node)
- Insufficient offset from node radius

**Solutions**:

```javascript
// ❌ Wrong - label overlaps node
group.append('text')
    .attr('y', 0)  // Centers on node
    .text(d.name);

// ✅ Correct - label below node
group.append('text')
    .attr('y', d => CONFIG.nodeRadius[d.type] + 20)  // Below node
    .text(d.name);
```

### Issue: Timeline Too Cramped

**Symptoms**: Nodes overlapping, hard to read

**Causes**:
- Canvas too small (width < 2500, height < 1200)
- Layer spacing too tight (< 200px)
- Too many nodes in same year

**Solutions**:

```javascript
// 1. Increase canvas size
const CONFIG = {
    width: 3000,   // From 2000
    height: 1400,  // From 1000
};

// 2. Increase layer spacing
const CONFIG = {
    layerHeight: 250,  // From 200
};

// 3. Add horizontal jitter for same-year nodes
const sameYearNodes = timeline.filter(n => n.year === year);
const jitterX = (sameYearNodes.indexOf(node) - sameYearNodes.length/2) * 40;
const x = yearToX(year) + jitterX;
```

### Issue: Edge Labels Unreadable

**Symptoms**: Labels overlap edges, hard to read on background

**Causes**:
- No background rectangle
- Label color too similar to edge color
- Font too small

**Solutions**:

```javascript
// Add background (see "Edge Label Readability" section above)

// Increase contrast
labelGroup.append('text')
    .attr('fill', 'rgba(255, 255, 255, 0.95)')  // Near white
    .attr('font-weight', '600')                  // Bold
    .attr('font-size', '11px');                  // Larger

// Add text-shadow for additional contrast
labelGroup.append('text')
    .style('text-shadow', '0 0 3px rgba(0,0,0,0.8), 0 0 6px rgba(0,0,0,0.6)');
```

### Issue: Hover Tooltips Off-Screen

**Symptoms**: Tooltip cuts off at edge of viewport

**Causes**:
- Tooltip positioned without boundary checking
- Fixed width tooltip

**Solutions**:

```javascript
function positionTooltip(event, tooltip) {
    const tooltipWidth = 500;
    const containerRect = event.currentTarget.getBoundingClientRect();

    let left = event.pageX - containerRect.left + 20;
    let top = event.pageY - containerRect.top - 50;

    // Check right edge
    if (left + tooltipWidth > containerRect.width) {
        left = event.pageX - containerRect.left - tooltipWidth - 20;
    }

    // Check left edge
    if (left < 0) {
        left = 10;
    }

    // Check bottom edge
    if (top + tooltip.offsetHeight > containerRect.height) {
        top = containerRect.height - tooltip.offsetHeight - 10;
    }

    // Check top edge
    if (top < 0) {
        top = 10;
    }

    tooltip.style.left = left + 'px';
    tooltip.style.top = top + 'px';
}
```

### Issue: Performance Lag

**Symptoms**: Slow rendering, laggy interactions

**Causes**:
- Too many nodes (> 200)
- Too many animated edges
- Inefficient force simulation

**Solutions**:

```javascript
// 1. Limit nodes
const MAX_NODES = 200;
const filteredNodes = allNodes.slice(0, MAX_NODES);

// 2. Reduce animation
const MAX_ANIMATED_EDGES = 50;
const animatedEdges = edges.filter(e => e.animated).slice(0, MAX_ANIMATED_EDGES);

// 3. Optimize force simulation
const simulation = d3.forceSimulation(nodes)
    .alphaDecay(0.02)  // Faster convergence (default 0.0228)
    .velocityDecay(0.4)  // More damping (default 0.4)
    .force('charge', d3.forceManyBody()
        .strength(-300)
        .distanceMax(400));  // Limit calculation distance
```

---

## Best Practices Summary

### Canvas Sizing
✅ Use 3000×1400 for timeline visualizations
✅ Provide 150px margins for labels and axes
✅ Enable scroll for desktop viewing

### Layer Spacing
✅ Use 250px layerHeight for clean separation
✅ Position quotes at layer -0.8 (well above axis)
✅ Maintain consistent layer hierarchy

### Label Positioning
✅ Position labels below nodes (not centered)
✅ Use radius + 20px offset for main label
✅ Use radius + 34px offset for sublabel
✅ Add background rectangles for edge labels

### Overlap Prevention
✅ Wide horizontal staggering for quotes (-180 to +180)
✅ Adequate vertical spacing between layers (250px)
✅ Render order: edges → nodes → quotes (quotes on top)
✅ Add jitter for same-year nodes

### Performance
✅ Limit to <200 nodes for smooth interaction
✅ Optimize force simulation parameters
✅ Reduce number of animated edges
✅ Use CSS transforms for better performance

---

**Reference Version**: 1.0
**Last Updated**: 2026-01-30
