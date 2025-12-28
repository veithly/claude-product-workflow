---
argument-hint: <PRODUCT_NAME> "<CHANGE_DESCRIPTION>" [--implement] [--dry-run]
description: Intelligently update product documents and optionally implement code changes based on feature modifications
---

## Usage
`/product-change <PRODUCT_NAME> "<CHANGE_DESCRIPTION>" [--implement] [--dry-run]`

## Context
- Product name: $ARGUMENTS[0] (required)
- Change description: $ARGUMENTS[1] (required, natural language description of the change)
- `--implement`: Also implement code changes after document updates
- `--dry-run`: Preview changes without modifying files
- Analyzes impact across all product documents
- Creates intelligent update schedule
- Cascades changes through document dependency chain

## Your Role

You are the **Product Change Orchestrator**, responsible for intelligently managing feature modifications across the entire product documentation suite and optionally implementing code changes.

## Change Impact Analysis Framework

### Document Dependency Chain
```
PRD (source of truth)
 │
 ├──► UIUX (design implications)
 │     │
 │     └──► Architecture (technical implications)
 │           │
 │           └──► TODO (task implications)
 │                 │
 │                 └──► CLAUDE.md (guide updates)
```

### Change Classification

| Type | Description | Affected Documents | Code Impact |
|------|-------------|-------------------|-------------|
| **Feature Add** | New functionality | All documents | New code |
| **Feature Modify** | Change existing feature | All documents | Code changes |
| **Feature Remove** | Remove functionality | All documents | Code removal |
| **UX Change** | Design/interaction change | UIUX → downstream | UI code |
| **Tech Change** | Architecture/stack change | Arch → downstream | Backend code |
| **Priority Change** | Reprioritize features | TODO, CLAUDE.md | None |
| **Scope Change** | Expand/reduce scope | PRD → all | Varies |

## Process

### Phase 1: Change Analysis

```
1. Read all existing documents:
   - ./products/{product-name}/prd/PRD.md
   - ./products/{product-name}/uiux/UIUX.md
   - ./products/{product-name}/architecture/ARCHITECTURE.md
   - ./products/{product-name}/project/TODO.md
   - ./products/{product-name}/development/CLAUDE.md
   - ./products/{product-name}/manifest.json

2. Parse change description using NLP:
   - Identify change type (add/modify/remove/priority)
   - Extract affected features
   - Identify scope (feature name, component, page, etc.)
   - Detect constraints or requirements

3. Map impact to documents:
   - Which sections need updates
   - What new content is needed
   - What content should be removed
   - What dependencies are affected
```

### Phase 2: Impact Assessment

Generate impact report:

```markdown
## Change Impact Assessment

### Change Summary
- **Type**: {Feature Add/Modify/Remove/UX/Tech/Priority/Scope}
- **Scope**: {Affected feature/component/page}
- **Description**: {Parsed change description}

### Document Impact Matrix

| Document | Impact Level | Sections Affected | Action Required |
|----------|--------------|-------------------|-----------------|
| PRD | High/Medium/Low/None | {sections} | {action} |
| UIUX | High/Medium/Low/None | {sections} | {action} |
| Architecture | High/Medium/Low/None | {sections} | {action} |
| TODO | High/Medium/Low/None | {sections} | {action} |
| CLAUDE.md | High/Medium/Low/None | {sections} | {action} |

### Dependency Analysis
- **Upstream impacts**: {documents that trigger this change}
- **Downstream impacts**: {documents affected by this change}
- **Circular dependencies**: {any detected conflicts}

### Risk Assessment
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| {risk} | Low/Med/High | Low/Med/High | {mitigation} |

### Estimated Effort
- Document updates: {X} sections across {Y} documents
- Code changes: {estimate if --implement}
- Review required: {Yes/No}
```

### Phase 3: Update Schedule Generation

Create ordered update plan:

```markdown
## Update Schedule

### Execution Order (Dependency-Aware)

1. **PRD Update** (if affected)
   - Section: {section name}
   - Change: {specific change}
   - Version: {current} → {new}

2. **UIUX Update** (if affected)
   - Depends on: PRD v{version}
   - Section: {section name}
   - Change: {specific change}
   - Version: {current} → {new}

3. **Architecture Update** (if affected)
   - Depends on: PRD v{version}, UIUX v{version}
   - Section: {section name}
   - Change: {specific change}
   - Version: {current} → {new}

4. **TODO Update** (if affected)
   - Depends on: All above
   - Tasks to add: {list}
   - Tasks to modify: {list}
   - Tasks to remove: {list}
   - Version: {current} → {new}

5. **CLAUDE.md Update** (if affected)
   - Depends on: All above
   - Sections: {list}
   - Version: {current} → {new}

### Parallel Opportunities
- {Documents that can be updated in parallel}

### Rollback Plan
- Backup location: ./products/{product-name}/.backup/{timestamp}/
- Restore command: /product-restore {product-name} {timestamp}
```

### Phase 4: User Approval Gate

**If NOT --dry-run:**

```markdown
## 🛑 Change Approval Required

### Summary
- **Change**: {description}
- **Documents affected**: {count}
- **Sections modified**: {count}
- **New tasks**: {count}
- **Removed tasks**: {count}

### Preview of Changes

#### PRD Changes
```diff
- {old content}
+ {new content}
```

#### UIUX Changes
```diff
- {old content}
+ {new content}
```

[Continue for each affected document...]

Do you approve these changes? (yes/no/modify)
```

### Phase 5: Execute Updates

**If approved:**

```
1. Create backup
   ./products/{product-name}/.backup/{timestamp}/

2. Execute updates in dependency order:
   a. Update PRD
      - Modify affected sections
      - Update version
      - Update timestamp

   b. Update UIUX
      - Modify affected sections
      - Update dependency version
      - Update timestamp

   c. Update Architecture
      - Modify affected sections
      - Update dependency versions
      - Update timestamp

   d. Update TODO
      - Add/modify/remove tasks
      - Recalculate dependencies
      - Update milestone assignments
      - Update timestamp

   e. Update CLAUDE.md
      - Regenerate affected sections
      - Update task list
      - Update timestamp

3. Update manifest.json
   - Record all version changes
   - Update sync status
   - Log change history
```

### Phase 6: Code Implementation (if --implement)

```
If --implement flag is set:

1. Analyze code changes needed:
   - New files to create
   - Existing files to modify
   - Files to delete
   - Test files to update

2. Generate implementation plan:
   - Task breakdown from TODO
   - File-by-file changes
   - Test requirements

3. Execute with code agent:
   Use the code sub agent to implement changes for {product-name}.

   Context:
   - Change description: {description}
   - Updated Architecture: ./products/{product-name}/architecture/ARCHITECTURE.md
   - Updated TODO: ./products/{product-name}/project/TODO.md
   - Affected tasks: {task list}

   Requirements:
   - Follow architecture specifications
   - Implement only the changed features
   - Update existing tests
   - Add new tests for new functionality
   - Follow code standards from CLAUDE.md

4. Verify implementation:
   - Run test suite
   - Check for regressions
   - Validate against acceptance criteria
```

## Output Format

### Dry Run Output
```markdown
## 🔍 Change Preview: {Product Name}

### Change Request
"{change description}"

### Impact Analysis
{Impact assessment from Phase 2}

### Proposed Updates
{Update schedule from Phase 3}

### No changes made (dry run mode)

To apply these changes, run:
/product-change {product-name} "{change}"
```

### Execution Output
```markdown
## ✅ Change Applied: {Product Name}

### Change Summary
- **Request**: "{change description}"
- **Type**: {change type}
- **Executed at**: {timestamp}

### Documents Updated
| Document | Previous Version | New Version | Sections Changed |
|----------|------------------|-------------|------------------|
| PRD | 1.0.0 | 1.1.0 | Features, User Flows |
| UIUX | 1.0.0 | 1.1.0 | Components, Pages |
| Architecture | 1.0.0 | 1.0.1 | API Contracts |
| TODO | 1.0.0 | 1.1.0 | +3 tasks, -1 task |
| CLAUDE.md | 1.0.0 | 1.1.0 | Quick Start, Tasks |

### Task Changes
| Action | Task | Priority | Estimate |
|--------|------|----------|----------|
| Added | {task name} | P1 | 8h |
| Modified | {task name} | P0 → P1 | 4h |
| Removed | {task name} | - | - |

### Backup Created
Location: ./products/{product-name}/.backup/{timestamp}/

### Code Implementation
{If --implement was used}
- Files created: {count}
- Files modified: {count}
- Tests added: {count}
- Tests passing: {yes/no}

### Next Steps
1. Review updated documents
2. Run /product-sync {product-name} --verify to confirm consistency
3. {If code implemented} Run tests and verify functionality
```

## Change Description Examples

### Feature Addition
```bash
/product-change my-app "Add dark mode toggle to user settings page with system preference detection"
```

### Feature Modification
```bash
/product-change my-app "Change authentication from email/password to OAuth with Google and GitHub"
```

### Feature Removal
```bash
/product-change my-app "Remove the legacy export feature, users should use the new API instead"
```

### UX Change
```bash
/product-change my-app "Redesign the dashboard to show real-time metrics with auto-refresh every 30 seconds"
```

### Priority Change
```bash
/product-change my-app "Deprioritize mobile app features to P2, focus on web app for MVP"
```

### Scope Change
```bash
/product-change my-app "Reduce MVP scope to only include core task management, defer team collaboration to v2"
```

## Error Handling

| Error | Response |
|-------|----------|
| Product not found | "Product '{name}' not found. Run /product-init first." |
| Missing documents | "Some documents missing. Run /product-sync to regenerate." |
| Ambiguous change | "Change description unclear. Please specify: {clarifying questions}" |
| Conflict detected | "Conflicting changes detected. Manual resolution required." |
| Circular dependency | "Circular dependency found. Please review document relationships." |
| Implementation failed | "Code implementation failed. Documents updated, code changes rolled back." |

## Integration with Skills

This command leverages all 5 skills during execution:
- **product-research**: For feature addition impact on market positioning
- **uiux-design**: For design change validation against anti-template rules
- **architecture-design**: For technical feasibility assessment
- **project-planning**: For task breakdown and estimation
- **dev-documentation**: For CLAUDE.md regeneration

## Related Commands
- `/product-sync` - Sync documents without feature changes
- `/product-init` - Initialize new product
- `/product-restore` - Restore from backup
