---
argument-hint: <PRODUCT_NAME> [--update]
description: Generate or update development guide (CLAUDE.md) for a product
---

## Usage
`/product-dev <PRODUCT_NAME> [--update]`

## Context
- Product name: $ARGUMENTS[0] (required)
- Update mode: `--update` flag triggers incremental update
- Requires all previous documents to exist
- Generates CLAUDE.md in `./products/{product-name}/development/`

## Skill Reference

**You MUST follow the guidelines in `~/.claude/skills/dev-documentation/SKILL.md`**

Key requirements from the skill:
- Quick Start must be < 5 minutes to dev ready
- All commands must be copy-paste ready and tested
- Version tracking with dependency chains
- Auto-sync sections with manual override preservation
- Code examples must be complete and runnable
- Include troubleshooting for known issues

## Your Role

You are orchestrating the **Dev Guide Generator Agent** to create or update a comprehensive development guide. This synthesizes all product documentation into a developer-ready CLAUDE.md file.

## Prerequisites

```
Check for required documents:
./products/{product-name}/prd/PRD.md
./products/{product-name}/uiux/UIUX.md
./products/{product-name}/architecture/ARCHITECTURE.md
./products/{product-name}/project/TODO.md

Missing documents will be noted in the output.
```

## Process

### 1. Document Collection

Read all source documents:
- PRD: Product vision, features
- UIUX: Design specifications
- Architecture: Technical approach
- TODO: Task list
- manifest.json: Version tracking

### 2. Mode Detection

**New Guide Mode**:
- Full synthesis of all documents
- Complete quick start guide
- Full code standards section
- All tasks imported

**Update Mode**:
- Check version changes in manifest
- Update auto-sync sections only
- Preserve manual customizations
- Update task list from TODO

### 3. Agent Invocation

```
Use the dev-guide-generator sub agent to {create/update} development guide for {product-name}.

Context:
- Product name: {product-name}
- Source documents: ./products/{product-name}/
- Existing CLAUDE.md: {path if updating}
- Mode: {new/update}

Requirements:
- Follow CLAUDE.md template from ~/.claude/templates/claude-md-template.md
- Follow dev-documentation skill guidelines from ~/.claude/skills/dev-documentation/SKILL.md
- Create actionable quick start guide (< 5 minutes)
- All commands must be tested and copy-paste ready
- Synthesize project context from PRD
- Include tech stack from Architecture
- Import current tasks from TODO with auto-sync markers
- Document code standards with examples
- Set up version tracking with dependency chains
- Preserve manual override sections (<!-- MANUAL --> blocks)
- Include troubleshooting for common issues
- Set up auto-sync mechanism
- Include troubleshooting section

Output: ./products/{product-name}/development/CLAUDE.md
```

### 4. Quality Verification

Verify CLAUDE.md contains:
- [ ] Quick Start (< 5 minutes to dev ready)
- [ ] Project Context (from PRD)
- [ ] Architecture Summary (from Architecture)
- [ ] Development Workflow (from TODO)
- [ ] Code Standards
- [ ] Quality Gates
- [ ] Task Synchronization section
- [ ] Key Files Reference
- [ ] Common Tasks guide
- [ ] Troubleshooting
- [ ] Sync Metadata

### 5. Manifest Update

```json
{
  "documents": {
    "claudeMd": {
      "version": "1.0.0",
      "path": "./development/CLAUDE.md",
      "status": "active",
      "lastModified": "{ISO-DATE}",
      "dependsOn": {
        "prd": "{version}",
        "uiux": "{version}",
        "architecture": "{version}",
        "todo": "{version}"
      }
    }
  },
  "workflow": {
    "currentPhase": "development",
    "completedPhases": ["discovery", "prd", "uiux", "architecture", "planning", "guide"]
  }
}
```

## Output Format

### Success Output
```
## Development Guide Generated: {Product Name}

**Version**: 1.0.0
**Location**: ./products/{product-name}/development/CLAUDE.md

### Contents
1. ✅ Quick Start
2. ✅ Project Context
3. ✅ Development Workflow ({task_count} tasks)
4. ✅ Code Standards
5. ✅ Quality Gates
6. ✅ Task Synchronization
7. ✅ Key Files Reference
8. ✅ Common Tasks
9. ✅ Troubleshooting

### Source Document Versions
| Document | Version |
|----------|---------|
| PRD | {version} |
| UIUX | {version} |
| Architecture | {version} |
| TODO | {version} |

### Auto-Sync Sections
These sections will auto-update when source documents change:
- Project Context (from PRD)
- Development Workflow (from TODO)
- Key Files Reference (from manifest)

### Next Steps
Development is ready to begin!
1. Read the guide: ./products/{product-name}/development/CLAUDE.md
2. Start with P0 tasks
3. Run `/product-sync {product-name}` when documents change
```

## Error Handling

| Error | Response |
|-------|----------|
| Missing source docs | Generate partial guide, note gaps |
| Version mismatch | Update from latest versions |
| Template not found | Use inline structure |
