---
argument-hint: <PRODUCT_NAME> [--update]
description: Generate or update technical architecture documentation for a product
---

## Usage
`/product-architect <PRODUCT_NAME> [--update]`

## Context
- Product name: $ARGUMENTS[0] (required)
- Update mode: `--update` flag triggers incremental update
- Requires PRD and UIUX to exist
- Generates ARCHITECTURE.md in `./products/{product-name}/architecture/`

## Skill Reference

**You MUST follow the guidelines in `~/.claude/skills/architecture-design/SKILL.md`**

Key requirements from the skill:
- Document ALL technology choices with detailed rationale
- Include alternatives considered and why they were rejected
- Use decision criteria matrix (Team Expertise, Ecosystem Maturity, Performance, Hiring Pool, Viability, Integration)
- Follow architecture patterns (Modular Monolith, Microservices, Serverless) based on team size
- Include security checklist and performance budgets
- Create comprehensive API specifications with all states

## Your Role

You are orchestrating the **Product Architect Agent** to create or update comprehensive technical architecture documentation. This includes technology selection, system design, and implementation roadmap.

## Prerequisites

```
Check for required documents:
./products/{product-name}/prd/PRD.md (required)
./products/{product-name}/uiux/UIUX.md (recommended)

If PRD missing:
"PRD not found. Please run /product-prd {product-name} first."

If UIUX missing:
"UIUX not found. Proceeding with PRD only. UIUX recommended for complete architecture."
```

## Process

### 1. Document Analysis

Read and analyze:
- PRD: Features, requirements, constraints
- UIUX: Components, pages, interactions
- Extract technical implications from both

### 2. Existing Codebase Analysis (if applicable)

```
If project has existing code:
Use codebase-retrieval to understand:
- Current technology stack
- Existing patterns and conventions
- Integration requirements
- Technical debt considerations
```

### 3. Technology Preferences Gathering

```
Optional clarifications:
1. Any technology preferences or mandates?
2. Deployment target (cloud provider, on-prem)?
3. Scale expectations (users, data volume)?
4. Team expertise considerations?
5. Budget constraints?
```

### 4. Agent Invocation

```
Use the product-architect sub agent to {create/update} architecture for {product-name}.

Context:
- Product name: {product-name}
- PRD: ./products/{product-name}/prd/PRD.md
- UIUX: ./products/{product-name}/uiux/UIUX.md (if exists)
- Existing codebase: {analysis if applicable}
- Preferences: {gathered preferences}
- Mode: {new/update}

Requirements:
- Follow Architecture template from ~/.claude/templates/architecture-template.md
- Follow architecture-design skill guidelines from ~/.claude/skills/architecture-design/SKILL.md
- Research current best practices (use WebSearch, Context7)
- Use decision criteria matrix for all technology choices
- Document ALL technology choices with detailed rationale
- Include alternatives considered and rejection reasons
- Create system diagrams (Mermaid)
- Design database schema (ERD)
- Define API contracts with all request/response formats
- Complete security checklist
- Define performance budgets (LCP, FID, CLS, API P95/P99)
- Plan caching and scaling strategies
- Define API contracts
- Plan security architecture
- Create implementation roadmap

Output: ./products/{product-name}/architecture/ARCHITECTURE.md
```

### 5. Quality Verification

Verify Architecture contains:
- [ ] Architecture overview and principles
- [ ] Complete technology stack with rationale
- [ ] System architecture diagram
- [ ] Component design specifications
- [ ] Data architecture (ERD, schemas)
- [ ] API design and contracts
- [ ] Security architecture
- [ ] Performance considerations
- [ ] Infrastructure plan
- [ ] Implementation roadmap
- [ ] Technical risks and mitigations

### 6. Manifest Update

```json
{
  "documents": {
    "architecture": {
      "version": "1.0.0",
      "path": "./architecture/ARCHITECTURE.md",
      "status": "complete",
      "lastModified": "{ISO-DATE}",
      "dependsOn": {
        "prd": "{prd-version}",
        "uiux": "{uiux-version}"
      }
    }
  }
}
```

## Output Format

### Success Output
```
## Technical Architecture Generated: {Product Name}

**Version**: 1.0.0
**Location**: ./products/{product-name}/architecture/ARCHITECTURE.md
**Based on**: PRD v{version}, UIUX v{version}

### Technology Stack
| Layer | Technology |
|-------|------------|
| Frontend | {framework} |
| Backend | {framework} |
| Database | {database} |
| Hosting | {platform} |

### Architecture Highlights
- **Pattern**: {architecture pattern}
- **API Style**: {REST/GraphQL}
- **Authentication**: {method}

### Implementation Phases
1. {Phase 1}: {description}
2. {Phase 2}: {description}
3. {Phase 3}: {description}

### Next Steps
- Run `/product-plan {product-name}` to create task breakdown
- Or continue with `/product-init` pipeline
```

## Error Handling

| Error | Response |
|-------|----------|
| PRD not found | Request PRD creation first |
| UIUX not found | Proceed with warning |
| WebSearch fails | Use established best practices |
| Context7 unavailable | Use general recommendations |
