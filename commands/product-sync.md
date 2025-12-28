---
argument-hint: <PRODUCT_NAME> [--force] [--dry-run] [--verify] [--auto-fix]
description: Intelligently synchronize all product documents with smart change detection
---

## Usage
`/product-sync <PRODUCT_NAME> [--force] [--dry-run] [--verify] [--auto-fix]`

## Context
- Product name: $ARGUMENTS[0] (required)
- `--force`: Regenerate all documents regardless of version
- `--dry-run`: Show what would be updated without making changes
- `--verify`: Check consistency without updating (report only)
- `--auto-fix`: Automatically resolve minor inconsistencies
- Synchronizes document versions and cascades updates

## Your Role

You are the **Intelligent Document Synchronization Orchestrator** responsible for keeping all product documents in sync. You use smart change detection to identify what changed, assess impact, and cascade updates while preserving manual customizations.

## Smart Change Detection

### Detection Methods

| Method | What It Detects | Reliability |
|--------|-----------------|-------------|
| **Version Comparison** | Manifest vs frontmatter version | High |
| **Hash Comparison** | Content hash changes | High |
| **Timestamp Analysis** | File modification times | Medium |
| **Semantic Analysis** | Meaningful content changes | High |
| **Cross-Reference Check** | Broken references between docs | High |

### Change Categories

```
STRUCTURAL CHANGES (require cascade):
├── New features added
├── Features removed
├── Feature requirements changed
├── User flows modified
└── Technical constraints added

CONTENT CHANGES (selective cascade):
├── Description updates
├── Priority changes
├── Estimation updates
└── Documentation clarifications

COSMETIC CHANGES (no cascade):
├── Typo fixes
├── Formatting improvements
├── Comment additions
└── Internal reorganization
```

## Document Dependency Chain

```
PRD (source of truth)
 │
 ├──► UIUX (depends on PRD)
 │     │
 │     └──► Architecture (depends on PRD, UIUX)
 │           │
 │           └──► TODO (depends on PRD, UIUX, Architecture)
 │                 │
 │                 └──► CLAUDE.md (depends on all)
```

### Update Cascade Rules

| Source Change | Documents to Update | Cascade Type |
|---------------|---------------------|--------------|
| PRD feature add | UIUX, Architecture, TODO, CLAUDE.md | Full |
| PRD feature modify | UIUX, Architecture, TODO, CLAUDE.md | Selective |
| PRD feature remove | UIUX, Architecture, TODO, CLAUDE.md | Full |
| UIUX design change | Architecture (if tech impact), TODO, CLAUDE.md | Selective |
| Architecture tech change | TODO, CLAUDE.md | Selective |
| TODO task change | CLAUDE.md | Minimal |

## Process

### Phase 1: Comprehensive Scan

```
1. Read manifest.json
   - Current versions
   - Last sync timestamp
   - Known dependencies
   - Pending updates queue

2. Scan all documents:
   ./products/{product-name}/prd/PRD.md
   ./products/{product-name}/uiux/UIUX.md
   ./products/{product-name}/architecture/ARCHITECTURE.md
   ./products/{product-name}/project/TODO.md
   ./products/{product-name}/development/CLAUDE.md

3. For each document:
   - Read YAML frontmatter
   - Calculate content hash
   - Check file modification time
   - Extract version number
   - Parse key sections
```

### Phase 2: Smart Diff Analysis

```
For each document pair (manifest vs actual):

1. Version Check:
   - manifest.version vs document.version
   - Flag if mismatch

2. Content Analysis:
   - Hash comparison for raw change detection
   - Semantic diff for meaningful changes:
     * Feature list diff
     * Component list diff
     * Task list diff
     * API endpoint diff

3. Cross-Reference Validation:
   - Features in PRD exist in UIUX?
   - UIUX components covered in Architecture?
   - Architecture components have tasks in TODO?
   - All docs referenced in CLAUDE.md?

4. Consistency Checks:
   - Version dependencies aligned?
   - Timestamps logical (parent before child)?
   - No orphaned references?
```

### Phase 3: Change Classification

```markdown
## Change Report

### Detected Changes

#### PRD Changes
| Section | Change Type | Impact | Cascade Required |
|---------|-------------|--------|------------------|
| Features | Addition | High | Yes - All docs |
| User Flows | Modification | Medium | Yes - UIUX, TODO |
| Description | Cosmetic | Low | No |

#### Cross-Reference Issues
| Issue | Location | Severity | Auto-fixable |
|-------|----------|----------|--------------|
| Missing feature | UIUX missing "dark mode" | High | No |
| Orphan task | TODO has task for removed feature | Medium | Yes |
| Version mismatch | UIUX depends on PRD v1.0, PRD is v1.2 | High | Yes |
```

### Phase 4: Build Intelligent Update Plan

```markdown
## Update Plan

### Priority Order (Based on Dependencies)

1. **PRD** - No updates needed (source changed)
   - Status: Source of change
   - Current version: 1.2.0

2. **UIUX** - UPDATE REQUIRED
   - Depends on: PRD v1.2.0 (currently references v1.0.0)
   - Changes needed:
     * Add page: Dark Mode Settings
     * Add component: Theme Toggle
     * Update: Color palette documentation
   - Estimated sections: 3

3. **Architecture** - UPDATE REQUIRED
   - Depends on: PRD v1.2.0, UIUX v1.1.0
   - Changes needed:
     * Add: Theme storage API
     * Update: State management section
   - Estimated sections: 2

4. **TODO** - UPDATE REQUIRED
   - Depends on: All above
   - Changes needed:
     * Add tasks for new features (+4 tasks)
     * Update estimates for modified features
     * Mark completed tasks
   - Estimated tasks: 6 changes

5. **CLAUDE.md** - UPDATE REQUIRED
   - Depends on: All above
   - Changes needed:
     * Update task list
     * Update feature summary
   - Estimated sections: 2

### Parallel Execution Opportunities
- None (strict dependency chain)

### Estimated Total Impact
- Documents: 4 of 5 need updates
- Sections: ~13 section updates
- Tasks: +4 new, 2 modified
```

### Phase 5: Verification Mode (--verify)

If `--verify` flag:

```markdown
## Consistency Report: {Product Name}

### Overall Health: 🟡 Needs Attention

### Document Status
| Document | Version | Status | Issues |
|----------|---------|--------|--------|
| PRD | 1.2.0 | ✅ Current | None |
| UIUX | 1.0.0 | ⚠️ Outdated | 2 issues |
| Architecture | 1.1.0 | ⚠️ Outdated | 1 issue |
| TODO | 1.0.0 | ⚠️ Outdated | 3 issues |
| CLAUDE.md | 1.0.0 | ⚠️ Outdated | 2 issues |

### Issues Found

#### Critical (Blocking)
1. UIUX missing feature from PRD: "dark_mode"
2. TODO has task for removed feature: "legacy_export"

#### Warning (Should Fix)
3. Version dependency mismatch: UIUX → PRD
4. Architecture missing API for new component
5. CLAUDE.md task list out of sync

#### Info (Optional)
6. Minor description inconsistencies
7. Formatting differences

### Recommendations
1. Run `/product-sync {product-name}` to fix issues 3-7
2. Run `/product-change {product-name} "add dark mode"` for issue 1
3. Manually review and resolve issue 2

### No changes made (verify mode).
```

### Phase 6: Auto-Fix Mode (--auto-fix)

If `--auto-fix` flag:

```
Auto-fixable issues:
✅ Version dependency mismatches
✅ Task list synchronization
✅ Cross-reference updates
✅ Manifest inconsistencies

Requires manual intervention:
❌ New feature design decisions
❌ Technology choice changes
❌ Task estimation updates
❌ Conflicting requirements
```

### Phase 7: Execute Updates

For each document in update queue:

```
1. Create backup:
   ./products/{product-name}/.backup/{timestamp}/

2. For each document:
   a. Load current content
   b. Identify protected sections (<!-- MANUAL:START --> blocks)
   c. Invoke appropriate agent with context
   d. Merge: preserve manual sections, update auto sections
   e. Validate result
   f. Write updated document
   g. Update manifest

3. Final validation:
   - All versions aligned
   - No broken references
   - Manifest consistent
```

**Agent Invocations:**

```
UIUX Update:
Use the uiux-designer sub agent to update UIUX for {product-name}.
- Context: PRD changes detected
- Follow uiux-design skill guidelines
- Preserve existing design decisions
- Add new pages/components for new features
- Maintain anti-template standards

Architecture Update:
Use the product-architect sub agent to update architecture for {product-name}.
- Context: PRD/UIUX changes detected
- Follow architecture-design skill guidelines
- Preserve technology decisions
- Extend API contracts for new features
- Update data models if needed

TODO Update:
Use the project-manager sub agent to update TODO for {product-name}.
- Context: All upstream changes
- Follow project-planning skill guidelines
- Add tasks for new features
- Update estimates for changed features
- Preserve task status for existing tasks
- Remove tasks for removed features
- Use three-point estimation

CLAUDE.md Update:
Use the dev-guide-generator sub agent to update CLAUDE.md for {product-name}.
- Context: All documents updated
- Follow dev-documentation skill guidelines
- Update Project Context from PRD
- Update Tech Stack from Architecture
- Sync task list from TODO
- Preserve Quick Start and manual sections
```

## Output Formats

### Dry Run Output
```markdown
## 🔍 Sync Preview: {Product Name}

### Detected Changes
{Change classification from Phase 3}

### Proposed Updates
{Update plan from Phase 4}

### Impact Summary
- Documents to update: 4
- Sections to modify: 13
- Tasks to add/modify: 6
- Estimated scope: Medium

### No changes made (dry run mode)

To apply these changes, run:
/product-sync {product-name}

To just verify consistency:
/product-sync {product-name} --verify
```

### Success Output
```markdown
## ✅ Sync Complete: {Product Name}

### Documents Updated
| Document | Old Version | New Version | Changes |
|----------|-------------|-------------|---------|
| UIUX | 1.0.0 | 1.1.0 | +2 pages, +3 components |
| Architecture | 1.1.0 | 1.2.0 | +1 API endpoint |
| TODO | 1.0.0 | 1.1.0 | +4 tasks, 2 updated |
| CLAUDE.md | 1.0.0 | 1.1.0 | Context updated |

### Sync Summary
- Source changes: PRD 1.0.0 → 1.2.0
- Documents updated: 4
- Sections modified: 13
- Tasks changed: 6
- Conflicts resolved: 0
- Manual review needed: 0

### Backup Location
./products/{product-name}/.backup/{timestamp}/

### Next Steps
All documents are now synchronized.
- Review changes in updated documents
- Run tests if code was affected
- Use /product-change for new features
```

### Conflict Output
```markdown
## ⚠️ Sync Completed with Conflicts: {Product Name}

### Documents Updated
{...}

### ⚠️ Conflicts Requiring Manual Resolution

#### Conflict 1: Technology Mismatch
- **Location**: Architecture → Frontend Framework
- **PRD suggests**: "Modern React-based SPA"
- **Architecture has**: Vue.js with Nuxt
- **Impact**: High - requires design decision
- **Recommendation**: Review with tech lead

#### Conflict 2: Feature Scope Unclear
- **Location**: PRD → UIUX
- **Issue**: "Advanced analytics" undefined in UIUX
- **Impact**: Medium - missing design specs
- **Recommendation**: Run /product-uiux {name} --update

### Auto-Fixed Issues
1. ✅ Version dependencies aligned
2. ✅ Task list synchronized
3. ✅ Manifest updated

### Resolution Steps
1. Review conflicts listed above
2. Make decisions and update documents
3. Run `/product-sync {product-name} --verify` to confirm
```

## Error Handling

| Error | Response |
|-------|----------|
| Missing manifest | Create from document versions |
| Document not found | Skip, note in output, suggest regeneration |
| Agent fails | Retry once, then report for manual resolution |
| Parse error | Report location, skip document |
| Circular dependency | Should not happen, error if detected |
| Backup fails | Abort sync, report error |

## Related Commands

- `/product-change` - Make feature changes with intelligent updates
- `/product-init` - Initialize new product
- `/product-restore` - Restore from backup
- Individual document commands for targeted updates
