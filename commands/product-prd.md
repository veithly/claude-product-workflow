---
argument-hint: <PRODUCT_NAME> [--update]
description: Generate or update Product Requirements Document (PRD) for a product
---

## Usage
`/product-prd <PRODUCT_NAME> [--update]`

## Context
- Product name: $ARGUMENTS[0] (required)
- Update mode: `--update` flag triggers incremental update vs full regeneration
- Generates PRD.md in `./products/{product-name}/prd/`
- Can be run standalone or as part of `/product-init` pipeline

## Skill Reference

**You MUST follow the guidelines in `~/.claude/skills/product-research/SKILL.md`**

Key requirements from the skill:
- Use Chrome DevTools MCP for competitor analysis (Elements, Network, Performance, Application panels)
- Analyze minimum 5 direct competitors and 3 indirect competitors
- Explain "WHY" features exist, not just "WHAT" they are
- All claims must have evidence sources
- Technical analysis must include stack detection, performance metrics, and UX patterns

## Your Role

You are orchestrating the **Product Manager Agent** to create or update a comprehensive Product Requirements Document. This command provides focused PRD generation outside the full pipeline.

## Process

### 1. Initialization Check

```
Check if ./products/{product-name}/ exists:
- If exists: Check for existing PRD
- If not exists: Create directory structure
```

### 2. Mode Detection

**New PRD Mode** (no existing PRD or no --update flag):
- Full market research
- Complete competitor analysis
- New user personas
- Full feature definition

**Update Mode** (--update flag with existing PRD):
- Read existing PRD
- Identify sections to update
- Preserve unchanged content
- Increment version

### 3. Requirements Gathering

If creating new PRD or significant update needed:
```
Ask user:
1. What is the core problem this product solves?
2. Who are the target users?
3. What are the must-have features?
4. Any specific constraints or preferences?
```

### 4. Agent Invocation

```
Use the product-manager sub agent to {create/update} PRD for {product-name}.

Context:
- Product name: {product-name}
- Mode: {new/update}
- User requirements: {gathered requirements}
- Existing PRD: {path if updating}

Requirements:
- Follow PRD template from ~/.claude/templates/prd-template.md
- Follow product-research skill guidelines from ~/.claude/skills/product-research/SKILL.md
- Use Chrome DevTools MCP for competitor website analysis (MANDATORY)
- Analyze minimum 5 direct competitors + 3 indirect competitors
- Explain "WHY" for each feature decision (not just "WHAT")
- Use WebSearch for market research
- Create detailed user personas with evidence
- Define features with priorities (P0-P3)
- Document user flows with Mermaid diagrams
- Include success metrics and KPIs
- All claims must have sources cited

Output: ./products/{product-name}/prd/PRD.md
```

### 5. Quality Verification

Verify PRD contains:
- [ ] Executive summary with clear vision
- [ ] Market analysis with competitors
- [ ] User personas (minimum 1 primary)
- [ ] Feature matrix with priorities
- [ ] User flows (Mermaid diagrams)
- [ ] Success metrics
- [ ] Revision history

### 6. Manifest Update

Update `./products/{product-name}/manifest.json`:
```json
{
  "documents": {
    "prd": {
      "version": "1.0.0",
      "path": "./prd/PRD.md",
      "status": "complete",
      "lastModified": "{ISO-DATE}"
    }
  }
}
```

## Output Format

### Success Output
```
## PRD Generated: {Product Name}

**Version**: 1.0.0
**Location**: ./products/{product-name}/prd/PRD.md

### Summary
- **Vision**: {1-2 sentences}
- **Target Users**: {Primary persona}
- **Features**: {count} total ({P0 count} P0, {P1 count} P1)
- **Competitors Analyzed**: {list}

### Next Steps
- Run `/product-uiux {product-name}` to create design specs
- Or run `/product-init {product-name}` to continue full pipeline
```

### Update Output
```
## PRD Updated: {Product Name}

**Version**: 1.0.0 → 1.1.0
**Changes**:
- {Change 1}
- {Change 2}

⚠️ Dependent documents may need sync:
- UIUX: /product-uiux {product-name} --update
- Architecture: /product-architect {product-name} --update
- TODO: /product-plan {product-name} --update

Run `/product-sync {product-name}` to update all documents.
```

## Error Handling

| Error | Response |
|-------|----------|
| Product doesn't exist | Create directory structure first |
| Missing input | Request clarification |
| WebSearch fails | Proceed with available info, note limitation |
| Template not found | Use inline template structure |
