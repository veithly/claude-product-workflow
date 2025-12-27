---
argument-hint: <PRODUCT_NAME> [--update]
description: Generate or update project plan with task breakdown for a product
---

## Usage
`/product-plan <PRODUCT_NAME> [--update]`

## Context
- Product name: $ARGUMENTS[0] (required)
- Update mode: `--update` flag triggers incremental update
- Requires PRD, UIUX, and Architecture to exist
- Generates TODO.md in `./products/{product-name}/project/`

## Skill Reference

**You MUST follow the guidelines in `~/.claude/skills/project-planning/SKILL.md`**

Key requirements from the skill:
- Maximum 16 hours per task (split if larger)
- Use three-point estimation (Optimistic, Most Likely, Pessimistic)
- Explicit dependency types (Finish-to-Start, Start-to-Start, etc.)
- Risk register with probability, impact, and mitigation
- Priority levels P0-P3 with clear rationale
- Milestone definitions with measurable success criteria

## Your Role

You are orchestrating the **Project Manager Agent** to create or update a comprehensive project plan. This includes task breakdown, prioritization, dependency mapping, and milestone definition.

## Prerequisites

```
Check for required documents:
./products/{product-name}/prd/PRD.md (required)
./products/{product-name}/uiux/UIUX.md (recommended)
./products/{product-name}/architecture/ARCHITECTURE.md (recommended)

If PRD missing:
"PRD not found. Please run /product-prd {product-name} first."

Missing UIUX or Architecture:
"Proceeding with available documents. Full documentation recommended for complete planning."
```

## Process

### 1. Document Analysis

Read all available documents:
- PRD: Extract features and priorities
- UIUX: Extract pages and components
- Architecture: Extract technical tasks

### 2. Mode Detection

**New Plan Mode**:
- Full task extraction from all documents
- Complete dependency mapping
- New milestone definitions
- Fresh estimates

**Update Mode**:
- Check source document versions
- Identify new/changed requirements
- Add new tasks, update existing
- Preserve task status and history

### 3. Agent Invocation

```
Use the project-manager sub agent to {create/update} project plan for {product-name}.

Context:
- Product name: {product-name}
- PRD: ./products/{product-name}/prd/PRD.md
- UIUX: ./products/{product-name}/uiux/UIUX.md (if exists)
- Architecture: ./products/{product-name}/architecture/ARCHITECTURE.md (if exists)
- Existing TODO: {path if updating}
- Mode: {new/update}

Requirements:
- Follow TODO template from ~/.claude/templates/todo-template.md
- Follow project-planning skill guidelines from ~/.claude/skills/project-planning/SKILL.md
- Extract tasks from ALL source documents
- Break down to 1-2 day granularity (max 16 hours per task)
- Use three-point estimation for all tasks
- Assign priorities P0-P3 with rationale
- Map all dependencies with explicit types
- Define milestones with measurable success criteria
- Include comprehensive risk register (probability, impact, mitigation)
- Identify critical path
- Include effort estimates
- Create dependency graph (Mermaid)
- Include risk register

Output: ./products/{product-name}/project/TODO.md
```

### 4. Quality Verification

Verify TODO contains:
- [ ] Overview with task counts and progress
- [ ] Milestones with objectives
- [ ] All tasks with full details:
  - Priority, estimate, dependencies
  - Acceptance criteria
  - Document references
- [ ] Dependency graph
- [ ] Priority matrix
- [ ] Workload summary
- [ ] Risk register
- [ ] Document sync status

### 5. Milestone File Generation

Create `./products/{product-name}/project/milestones.json`:
```json
{
  "milestones": [
    {
      "id": "M1",
      "name": "Foundation",
      "tasks": ["T-001", "T-002", "T-003"],
      "status": "not-started",
      "targetDate": null
    }
  ],
  "lastUpdated": "{ISO-DATE}"
}
```

### 6. Manifest Update

```json
{
  "documents": {
    "todo": {
      "version": "1.0.0",
      "path": "./project/TODO.md",
      "status": "active",
      "lastModified": "{ISO-DATE}",
      "dependsOn": {
        "prd": "{version}",
        "uiux": "{version}",
        "architecture": "{version}"
      }
    }
  }
}
```

## Output Format

### Success Output
```
## Project Plan Generated: {Product Name}

**Version**: 1.0.0
**Location**: ./products/{product-name}/project/TODO.md

### Summary
| Metric | Count |
|--------|-------|
| Total Tasks | {count} |
| P0 (Critical) | {count} |
| P1 (High) | {count} |
| P2 (Medium) | {count} |
| Milestones | {count} |
| Total Hours | {estimate} |

### Milestones
1. **{M1 Name}**: {task count} tasks
2. **{M2 Name}**: {task count} tasks
3. **{M3 Name}**: {task count} tasks

### Critical Path
{List of P0 tasks in dependency order}

### Next Steps
- Run `/product-dev {product-name}` to generate development guide
- Or continue with `/product-init` pipeline
```

### Update Output
```
## Project Plan Updated: {Product Name}

**Version**: 1.0.0 → 1.1.0

### Changes
- Added: {count} new tasks
- Updated: {count} existing tasks
- Completed: {count} tasks
- Removed: {count} obsolete tasks

### Source Document Changes
- PRD: {old} → {new}
- UIUX: {old} → {new}
- Architecture: {old} → {new}

Run `/product-sync` to ensure all documents are aligned.
```

## Error Handling

| Error | Response |
|-------|----------|
| PRD not found | Request PRD creation first |
| Missing UIUX/Arch | Proceed with warning |
| Circular dependency | Report error, suggest resolution |
| Task too large | Suggest breakdown |
