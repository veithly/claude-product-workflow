# Product Research Skill

> Professional market research and competitive analysis using Chrome DevTools

---

## Skill Metadata

```yaml
name: product-research
version: 1.0.0
description: Comprehensive product research with competitive analysis using browser DevTools
triggers:
  - /product-research
  - /market-research
  - /competitor-analysis
dependencies:
  - mcp: chrome-devtools
  - mcp: augment-context-engine
  - tool: WebSearch
  - tool: WebFetch
```

---

## Core Principles

### 1. Evidence-Based Research
- **NO assumptions** - Every claim must have a source
- **NO guessing** - If data is unavailable, state it explicitly
- **Quantitative first** - Prefer numbers over qualitative descriptions
- **Primary sources** - Use official websites, not aggregator articles

### 2. Competitive Intelligence Depth
- **Minimum 5 direct competitors** - Same product category
- **Minimum 3 indirect competitors** - Adjacent solutions
- **Technical analysis required** - Not just feature lists
- **Historical context** - How products evolved over time

### 3. User-Centric Focus
- **Real user problems** - From reviews, forums, support tickets
- **Jobs-to-be-done framework** - Why users hire products
- **Pain points with evidence** - Specific complaints, not generalizations

---

## Chrome DevTools Analysis Protocol

### MANDATORY: Browser-Based Competitor Analysis

For each competitor website, you MUST use Chrome DevTools MCP to analyze:

#### 1. Elements Panel Analysis
```
Objectives:
├── Identify component library used (inspect class naming conventions)
├── Extract color palette from computed styles
├── Document typography stack (font-family hierarchy)
├── Analyze spacing system (padding/margin patterns)
├── Identify icon library (SVG sprites, font icons, or inline SVGs)
└── Document responsive breakpoints
```

**Required Actions:**
```javascript
// Use take_snapshot to capture page structure
take_snapshot() → Get accessibility tree with UIDs

// Inspect specific elements
hover(uid) → Examine element styles in DevTools
evaluate_script(() => {
  return getComputedStyle(document.body).fontFamily;
})
```

#### 2. Network Panel Analysis
```
Objectives:
├── Identify API architecture (REST, GraphQL, gRPC-Web)
├── Document authentication method (JWT, cookies, OAuth)
├── Analyze payload structures for key endpoints
├── Measure Time to First Byte (TTFB)
├── Identify third-party integrations
└── Document CDN and caching strategies
```

**Required Actions:**
```javascript
// List all network requests
list_network_requests(resourceTypes: ["xhr", "fetch"])

// Analyze specific API call
get_network_request(reqid) → Examine headers, payload, timing
```

#### 3. Performance Panel Analysis
```
Objectives:
├── Core Web Vitals (LCP, FID, CLS)
├── JavaScript bundle analysis
├── Render blocking resources
├── Memory usage patterns
└── Optimization opportunities
```

**Required Actions:**
```javascript
// Start performance trace
performance_start_trace(reload: true, autoStop: true)

// After trace completes, analyze insights
performance_analyze_insight(insightSetId, "LCPBreakdown")
performance_analyze_insight(insightSetId, "RenderBlocking")
```

#### 4. Application Panel Analysis
```
Objectives:
├── Storage strategy (localStorage vs IndexedDB vs cookies)
├── Service Worker presence and caching strategy
├── Manifest.json configuration (if PWA)
├── Session management approach
└── Feature flags storage
```

**Required Actions:**
```javascript
// Evaluate storage usage
evaluate_script(() => {
  return {
    localStorage: Object.keys(localStorage).length,
    sessionStorage: Object.keys(sessionStorage).length,
    cookies: document.cookie.split(';').length
  };
})
```

---

## Analysis Framework

### Feature Analysis: "WHY" Not Just "WHAT"

**PROHIBITED:**
```markdown
❌ "Competitor X has dark mode"
❌ "The app includes a dashboard"
❌ "Users can export data"
```

**REQUIRED:**
```markdown
✅ "Competitor X implemented dark mode to reduce eye strain for their
   power user segment (developers) who spend 8+ hours in the interface.
   Evidence: Their changelog mentions 'developer experience' as the driver."

✅ "The dashboard prioritizes real-time metrics (updating every 5 seconds
   based on WebSocket analysis) because their target users are operations
   teams who need instant visibility. Evidence: Marketing emphasizes
   'real-time monitoring' and Network panel shows persistent WS connection."

✅ "Export supports CSV, JSON, and PDF formats. PDF was added in 2023
   based on user forum requests for 'shareable reports for stakeholders
   who don't use the tool'. Evidence: Community forum thread with 200+ upvotes."
```

### Competitor Analysis Template

For each competitor, document:

```markdown
## [Competitor Name]

### Basic Information
| Attribute | Value | Source |
|-----------|-------|--------|
| Founded | YYYY | Company website/Crunchbase |
| Funding | $XXM Series X | Crunchbase |
| Team Size | ~XXX | LinkedIn |
| Target Market | Description | Marketing materials |
| Pricing Model | Freemium/Enterprise/etc | Pricing page |

### Technical Stack (from DevTools)
| Layer | Technology | Evidence |
|-------|------------|----------|
| Frontend Framework | React 18.2 | `__REACT_DEVTOOLS_GLOBAL_HOOK__` present |
| UI Library | Chakra UI | Class prefix `chakra-` |
| State Management | Redux | `__REDUX_DEVTOOLS_EXTENSION__` |
| API Type | GraphQL | `/graphql` endpoint in Network |
| Auth | JWT + Refresh | Bearer token in Auth header |
| CDN | Cloudflare | Response headers |

### UX Patterns (from Elements)
| Pattern | Implementation | Why It Works |
|---------|----------------|--------------|
| Onboarding | 5-step wizard | Reduces cognitive load for complex setup |
| Navigation | Sidebar + Command palette | Balances discoverability with power users |
| Empty States | Illustrations + CTAs | Guides users to value quickly |

### Performance Metrics (from Performance)
| Metric | Value | Assessment |
|--------|-------|------------|
| LCP | 1.8s | Good (<2.5s) |
| FID | 45ms | Good (<100ms) |
| CLS | 0.05 | Good (<0.1) |
| Bundle Size | 450KB gzipped | Room for improvement |

### Feature Deep Dive
| Feature | What | Why | Evidence |
|---------|------|-----|----------|
| Real-time sync | WebSocket-based collaboration | Team productivity focus | WS frames in Network |
| Offline mode | Service Worker caching | Field workers use case | SW registration in Application |

### Pricing Analysis
| Tier | Price | Key Differentiators | Target Persona |
|------|-------|---------------------|----------------|
| Free | $0 | Limited to 3 projects | Hobbyists/evaluation |
| Pro | $15/mo | Unlimited + API access | Individual professionals |
| Team | $49/user/mo | Collaboration + SSO | Small teams |
| Enterprise | Custom | SLA + dedicated support | Large organizations |

### Strengths
1. [Strength with evidence]
2. [Strength with evidence]

### Weaknesses
1. [Weakness with evidence from reviews/analysis]
2. [Weakness with evidence from reviews/analysis]

### Opportunity Gaps
1. [Unmet need we can address]
2. [Unmet need we can address]
```

---

## Research Workflow

### Phase 1: Market Landscape (2-3 hours)

```
1. Web Search for market overview
   ├── "[product category] market size 2024"
   ├── "[product category] industry trends"
   └── "[product category] competitive landscape"

2. Identify competitor list
   ├── G2/Capterra category pages
   ├── Product Hunt launches
   └── Industry analyst reports

3. Create competitor matrix
   └── Rank by market position, funding, reviews
```

### Phase 2: Deep Competitor Analysis (4-6 hours)

```
For each of top 5 direct competitors:
1. Navigate to product website
   └── new_page(url) → take_snapshot()

2. Analyze landing page
   ├── Value proposition extraction
   ├── Target audience signals
   └── Social proof elements

3. Sign up for trial/demo
   ├── Onboarding flow analysis
   ├── Time-to-value measurement
   └── Friction points identification

4. DevTools deep dive
   ├── Elements → Tech stack
   ├── Network → API architecture
   ├── Performance → Core Web Vitals
   └── Application → Storage/PWA

5. Document findings in template
```

### Phase 3: User Research (2-3 hours)

```
1. Review aggregator analysis
   ├── G2 reviews (filter by 2-3 star for pain points)
   ├── Capterra comparisons
   └── TrustRadius detailed reviews

2. Community research
   ├── Reddit subreddits
   ├── Twitter/X discussions
   ├── Product Hunt comments
   └── Hacker News threads

3. Support analysis
   ├── Public knowledge bases
   ├── Community forums
   └── Common complaint patterns
```

### Phase 4: Synthesis (1-2 hours)

```
1. Pattern identification
   ├── Common features across competitors
   ├── Differentiation strategies
   └── Pricing patterns

2. Gap analysis
   ├── Underserved user segments
   ├── Missing features
   └── UX improvement opportunities

3. Recommendation formation
   ├── Must-have features (table stakes)
   ├── Differentiators (our edge)
   └── Future considerations (roadmap)
```

---

## Output Requirements

### Deliverable: Product Research Document (PRD Section 1-3)

```markdown
# Product Research Report: [Product Name]

## Executive Summary
[2-3 paragraphs summarizing key findings and recommendations]

## Market Analysis
### Market Size & Trends
[Quantitative data with sources]

### Target Segments
[User personas with evidence]

## Competitive Landscape

### Direct Competitors (5+)
[Full analysis per competitor using template above]

### Indirect Competitors (3+)
[Abbreviated analysis focusing on overlap areas]

### Competitive Matrix
| Feature | Us | Comp A | Comp B | Comp C | Comp D | Comp E |
|---------|-----|--------|--------|--------|--------|--------|
| Feature 1 | ✅ | ✅ | ❌ | ✅ | ❌ | ✅ |
| Feature 2 | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ |

## User Pain Points
[Evidence-based pain points from reviews and research]

## Opportunity Analysis
[Gaps and recommendations based on research]

## Appendix
### DevTools Analysis Screenshots
### Raw Data Sources
### Research Timeline
```

---

## Quality Gates

### Minimum Requirements
- [ ] 5+ direct competitors analyzed with DevTools
- [ ] 3+ indirect competitors identified
- [ ] Performance metrics captured for each competitor
- [ ] Tech stack identified with evidence
- [ ] User pain points backed by review sources
- [ ] Feature analysis includes "WHY" not just "WHAT"
- [ ] Pricing analysis complete
- [ ] All claims have sources cited

### Quality Score Rubric
| Criterion | Weight | 90+ | 70-89 | Below 70 |
|-----------|--------|-----|-------|----------|
| Competitor Depth | 25% | 5+ detailed | 3-4 detailed | <3 analyzed |
| Evidence Quality | 25% | All sourced | Mostly sourced | Many assumptions |
| Technical Analysis | 20% | Full DevTools | Partial DevTools | No DevTools |
| User Research | 15% | Multiple sources | Single source | No evidence |
| Actionable Insights | 15% | Clear recommendations | Vague suggestions | Missing |

---

## Integration Points

### Feeds Into:
- `uiux-design` skill (design patterns from competitors)
- `architecture-design` skill (tech stack insights)
- `project-planning` skill (feature prioritization)

### Receives From:
- User requirements (initial scope)
- Business constraints (budget, timeline)

---

## Version History
| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2024-12-28 | Initial release with Chrome DevTools requirements |
