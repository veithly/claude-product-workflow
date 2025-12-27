---
argument-hint: <PRODUCT_NAME> [--update]
description: Generate or update UI/UX design specifications for a product
---

## Usage
`/product-uiux <PRODUCT_NAME> [--update]`

## Context
- Product name: $ARGUMENTS[0] (required)
- Update mode: `--update` flag triggers incremental update
- Requires PRD to exist (./products/{product-name}/prd/PRD.md)
- Generates UIUX.md in `./products/{product-name}/uiux/`

## Skill Reference

**You MUST follow the guidelines in `~/.claude/skills/uiux-design/SKILL.md`**

### PROHIBITED PATTERNS (STRICT):
- ❌ Blue-purple gradients (AI cliche)
- ❌ System default fonts without customization
- ❌ Generic template layouts (centered hero + gradient + floating mockup)
- ❌ Undraw/Humaaans-style flat illustrations
- ❌ Pure #000000 black or #FFFFFF white without purpose
- ❌ Single font family for everything

### MANDATORY REQUIREMENTS:
- ✅ Use enterprise component libraries (shadcn/ui, Radix UI, Chakra UI)
- ✅ Document color psychology rationale for primary color
- ✅ Reference proven design systems (Stripe, Linear, Vercel, Airbnb)
- ✅ Full WCAG 2.1 AA accessibility compliance
- ✅ Consistent design tokens (spacing, typography, radius)
- ✅ All components must have state specifications

## Your Role

You are orchestrating the **UIUX Designer Agent** to create or update comprehensive design specifications. This command focuses specifically on UI/UX documentation.

## Prerequisites

```
Check for PRD:
./products/{product-name}/prd/PRD.md

If PRD missing:
"PRD not found. Please run /product-prd {product-name} first,
or /product-init {product-name} for full pipeline."
```

## Process

### 1. PRD Analysis

Read PRD and extract:
- Feature list with priorities
- User personas
- User flows
- Non-functional requirements

### 2. Mode Detection

**New UIUX Mode**:
- Full design system creation
- All pages designed
- Complete component library
- Full interaction specification

**Update Mode**:
- Compare PRD versions
- Identify new/changed features
- Update affected sections only
- Preserve custom design decisions

### 3. Design Requirements Gathering

For new or major updates:
```
Optional clarifications:
1. Any existing design system to follow?
2. Brand colors/fonts if known?
3. Specific design preferences (modern, minimal, etc.)?
4. Target platforms (web, mobile, desktop)?
```

### 4. Agent Invocation

```
Use the uiux-designer sub agent to {create/update} UIUX specs for {product-name}.

Context:
- Product name: {product-name}
- PRD location: ./products/{product-name}/prd/PRD.md
- PRD version: {version from manifest}
- Mode: {new/update}
- Design preferences: {gathered preferences}

Requirements:
- Follow UIUX template from ~/.claude/templates/uiux-template.md
- Follow uiux-design skill guidelines from ~/.claude/skills/uiux-design/SKILL.md
- STRICTLY AVOID all prohibited patterns (gradients, templates, generic fonts)
- Use enterprise component libraries (shadcn/ui, Radix UI, Chakra UI)
- Document color psychology rationale for all color choices
- Reference proven design systems for inspiration (NOT copying)
- Create page layouts for all PRD features
- Design complete component library with all states
- Document all interactions and micro-animations
- Include WCAG 2.1 AA accessibility specifications
- Define all design tokens (spacing, typography, radius, colors)
- Use Mermaid for flow diagrams
- Use ASCII art for layout illustrations

Output: ./products/{product-name}/uiux/UIUX.md
```

### 5. Quality Verification

Verify UIUX contains:
- [ ] Design philosophy and principles
- [ ] Information architecture (site map)
- [ ] Page specifications for all features
- [ ] Component library with states
- [ ] Interaction patterns
- [ ] Animation specifications
- [ ] Responsive breakpoints
- [ ] Accessibility requirements
- [ ] Design tokens (colors, typography, spacing)

### 6. Manifest Update

Update `./products/{product-name}/manifest.json`:
```json
{
  "documents": {
    "uiux": {
      "version": "1.0.0",
      "path": "./uiux/UIUX.md",
      "status": "complete",
      "lastModified": "{ISO-DATE}",
      "dependsOn": {
        "prd": "{prd-version}"
      }
    }
  }
}
```

## Output Format

### Success Output
```
## UIUX Specifications Generated: {Product Name}

**Version**: 1.0.0
**Location**: ./products/{product-name}/uiux/UIUX.md
**Based on PRD**: v{prd-version}

### Summary
- **Pages Designed**: {count}
- **Components Defined**: {count}
- **Design System**: {custom/framework}
- **Accessibility**: WCAG {level}

### Key Pages
1. {Page 1}
2. {Page 2}
3. {Page 3}

### Next Steps
- Run `/product-architect {product-name}` to create technical architecture
- Or continue with `/product-init` pipeline
```

## Error Handling

| Error | Response |
|-------|----------|
| PRD not found | Request PRD creation first |
| PRD version mismatch | Note in output, suggest sync |
| Design reference unavailable | Use standard patterns |
