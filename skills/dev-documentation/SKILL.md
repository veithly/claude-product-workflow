# Dev Documentation Skill

> CLAUDE.md generation with version management and development guidelines

---

## Skill Metadata

```yaml
name: dev-documentation
version: 1.0.0
description: Developer documentation generation with CLAUDE.md synthesis and auto-sync
triggers:
  - /dev-documentation
  - /claude-md
  - /dev-guide
dependencies:
  - skill: product-research (context)
  - skill: uiux-design (component details)
  - skill: architecture-design (technical specs)
  - skill: project-planning (task list)
  - mcp: augment-context-engine (codebase analysis)
```

---

## Core Principles

### 1. Developer-First Documentation
- **Action-oriented** - How to do things, not just what exists
- **Copy-paste ready** - Commands that work immediately
- **Error-aware** - Common pitfalls and solutions
- **Time-conscious** - Quick start < 5 minutes

### 2. Living Documentation
- **Version-tracked** - Know what changed and when
- **Dependency-aware** - Linked to source documents
- **Auto-updateable** - Sync mechanism built-in
- **Conflict-resistant** - Manual overrides preserved

### 3. Context-Rich Guidance
- **Why before how** - Explain design decisions
- **Patterns over rules** - Show examples of good code
- **Warnings prominent** - Security and performance concerns visible
- **Integration-focused** - How pieces connect

---

## CLAUDE.md Structure

### Required Sections

```markdown
# [Project Name] Development Guide

## Quick Start (MANDATORY - 5 min or less)

### Prerequisites
[Minimum requirements to get started]

### Setup
```bash
# Clone
git clone [url]
cd [project]

# Install
[package manager] install

# Configure
cp .env.example .env
# Edit .env with your values

# Run
[start command]
```

### Verify
[How to confirm setup worked]

---

## Project Overview

### What This Is
[2-3 sentence description]

### Key Technologies
| Category | Technology | Purpose |
|----------|------------|---------|
| Frontend | [Tech] | [Why] |
| Backend | [Tech] | [Why] |
| Database | [Tech] | [Why] |

### Architecture Summary
[High-level diagram or description]

---

## Development Workflow

### Branch Strategy
[Git flow description]

### Commit Convention
[Commit message format]

### Code Review Process
[PR requirements]

---

## Code Standards

### File Organization
[Directory structure with explanations]

### Naming Conventions
[Variables, functions, files, etc.]

### Error Handling
[Standard patterns]

### Testing Requirements
[What needs tests, coverage targets]

---

## Common Tasks

### Adding a New Feature
[Step-by-step guide]

### Fixing a Bug
[Debugging workflow]

### Database Changes
[Migration process]

### Deployment
[Deploy procedure]

---

## Troubleshooting

### Common Issues
[FAQ-style problem/solution pairs]

### Getting Help
[Where to ask questions]

---

## Reference

### Environment Variables
| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| [VAR] | Yes/No | [What it does] | [Example value] |

### API Documentation
[Link or inline docs]

### Related Documents
[Links to PRD, Architecture, etc.]

---

## Task Tracking

### Current Sprint
[Embedded or linked task list]

### Backlog
[Future work]

---

## Document Metadata

```yaml
version: 1.0.0
last_updated: YYYY-MM-DD
sources:
  - prd: v1.0.0
  - uiux: v1.0.0
  - architecture: v1.0.0
  - project-plan: v1.0.0
auto_sync: enabled
```
```

---

## Synthesis Process

### Phase 1: Context Gathering

```markdown
## Collect Source Documents

1. Product Research / PRD
   ├── Feature list with priorities
   ├── User personas
   └── Success metrics

2. UIUX Design
   ├── Component specifications
   ├── Design tokens
   └── Interaction patterns

3. Architecture
   ├── Technology stack
   ├── Data models
   ├── API specifications
   └── Security requirements

4. Project Plan
   ├── Task breakdown
   ├── Dependencies
   └── Milestones
```

### Phase 2: Information Extraction

```markdown
## Extract Developer-Relevant Information

From PRD:
├── Feature descriptions → What to build
├── Acceptance criteria → Done definitions
└── User flows → Implementation context

From UIUX:
├── Component list → What to implement
├── Design tokens → Styling variables
├── States → Edge cases to handle
└── Accessibility → A11y requirements

From Architecture:
├── Tech stack → What to install
├── Folder structure → Where files go
├── API contracts → Interface definitions
├── Database schema → Data structures
└── Security rules → Must-follow patterns

From Project Plan:
├── Task list → What to work on
├── Priorities → What's important
├── Dependencies → Order of work
└── Estimates → Planning info
```

### Phase 3: Content Generation

```markdown
## Generate CLAUDE.md Content

1. Quick Start Section
   - Synthesize: Architecture + Setup requirements
   - Goal: < 5 minute cold start
   - Test: Follow steps on fresh environment

2. Development Workflow
   - Synthesize: Architecture conventions + Project plan process
   - Include: Branch names, commit format, PR template

3. Code Standards
   - Synthesize: Architecture patterns + UIUX component conventions
   - Include: Examples of good code, anti-patterns

4. Common Tasks
   - Synthesize: Project plan tasks → How-to guides
   - Include: Step-by-step for frequent operations

5. Task Tracking
   - Import: Project plan task list
   - Format: Actionable checklist
```

---

## Version Management

### Version Numbering

```markdown
## Semantic Versioning for Documents

MAJOR.MINOR.PATCH

MAJOR: Breaking changes
├── Fundamental architecture change
├── Major workflow overhaul
└── Incompatible with previous guidance

MINOR: New features
├── New sections added
├── Significant content updates
└── Backward compatible

PATCH: Fixes
├── Typo corrections
├── Clarifications
└── Minor updates
```

### Dependency Tracking

```yaml
# manifest.json
{
  "documents": {
    "claude-md": {
      "version": "1.2.0",
      "path": "CLAUDE.md",
      "sources": {
        "prd": {
          "version": "1.0.0",
          "hash": "abc123",
          "sections_used": ["features", "acceptance_criteria"]
        },
        "uiux": {
          "version": "1.1.0",
          "hash": "def456",
          "sections_used": ["components", "tokens"]
        },
        "architecture": {
          "version": "1.0.0",
          "hash": "ghi789",
          "sections_used": ["stack", "api", "structure"]
        },
        "project-plan": {
          "version": "1.0.0",
          "hash": "jkl012",
          "sections_used": ["tasks", "milestones"]
        }
      }
    }
  }
}
```

### Change Detection

```markdown
## Auto-Sync Process

1. Source Document Change Detection
   ├── Compare file hashes
   ├── Identify changed sections
   └── Determine impact on CLAUDE.md

2. Update Classification
   ├── Auto-update: Formatting, typos, minor additions
   ├── Review-needed: Content changes, new sections
   └── Manual-only: Structural changes, deletions

3. Conflict Resolution
   ├── Preserve: <!-- MANUAL --> blocks
   ├── Merge: Additive changes
   └── Flag: Conflicting updates

4. Version Bump
   ├── Auto: PATCH for auto-updates
   ├── Suggested: MINOR for content changes
   └── Required: MAJOR for structural changes
```

### Manual Override Preservation

```markdown
## Protected Sections

Use HTML comments to mark sections that should not be auto-updated:

<!-- MANUAL:START -->
This content will be preserved during auto-sync.
Any manual customizations, local conventions, or
team-specific instructions go here.
<!-- MANUAL:END -->

## Override Types

<!-- MANUAL:REPLACE -->
Replaces auto-generated content with manual version

<!-- MANUAL:APPEND -->
Adds content after auto-generated section

<!-- MANUAL:PREPEND -->
Adds content before auto-generated section

<!-- MANUAL:SKIP -->
Prevents a section from being generated
```

---

## Quality Standards

### Content Requirements

```markdown
## Every Command Must Be:
- [ ] Tested on fresh environment
- [ ] Copy-paste ready (no placeholders unless explained)
- [ ] Platform-aware (Windows/Mac/Linux if different)
- [ ] Error-aware (what if it fails?)

## Every Code Example Must Have:
- [ ] Context (where this code goes)
- [ ] Imports shown
- [ ] Error handling (or note if omitted for brevity)
- [ ] Comments for non-obvious parts

## Every Section Must Be:
- [ ] Scannable (headers, lists, tables)
- [ ] Actionable (tells you what to do)
- [ ] Current (matches actual codebase)
- [ ] Complete (no "TODO" or "TBD" in production)
```

### Readability Guidelines

```markdown
## Writing Style

DO:
- Use active voice ("Run this command" not "This command should be run")
- Use second person ("You can..." not "One can...")
- Be concise (no fluff)
- Use examples liberally

DON'T:
- Assume knowledge (define acronyms)
- Use jargon without explanation
- Write walls of text
- Leave orphan sections (headers with no content)

## Formatting

- Headers: H2 for main sections, H3 for subsections
- Code: Fenced with language identifier
- Lists: Bullet for unordered, numbers for sequences
- Tables: For structured data, comparisons
- Callouts: > [!NOTE], > [!WARNING], > [!IMPORTANT]
```

---

## Output Requirements

### Deliverable: CLAUDE.md

```markdown
# [Project Name] Development Guide

> Auto-generated development documentation with task tracking

## Quick Start

### Prerequisites
- Node.js 18+ / Python 3.10+ / [Runtime]
- [Package Manager]
- [Database] (optional for local dev)

### Setup (< 5 minutes)

```bash
# 1. Clone repository
git clone [repo-url]
cd [project-name]

# 2. Install dependencies
pnpm install  # or: yarn / pip install -r requirements.txt

# 3. Configure environment
cp .env.example .env
# Edit .env - minimum required:
# - DATABASE_URL=...
# - API_KEY=...

# 4. Initialize database (if applicable)
pnpm db:push  # or: python manage.py migrate

# 5. Start development server
pnpm dev  # or: python manage.py runserver
```

### Verify Installation
```bash
# Should see: "Server running on http://localhost:3000"
curl http://localhost:3000/health
# Should return: {"status": "ok"}
```

---

## Project Structure

```
[project-name]/
├── src/
│   ├── components/     # UI components
│   ├── pages/          # Route handlers
│   ├── lib/            # Utilities
│   └── styles/         # CSS/tokens
├── tests/              # Test files
├── docs/               # Documentation
└── scripts/            # Build/deploy scripts
```

---

## Development Workflow

### Branch Naming
```
feature/[ticket-id]-short-description
bugfix/[ticket-id]-short-description
hotfix/[ticket-id]-short-description
```

### Commit Messages
```
type(scope): description

Types: feat, fix, docs, style, refactor, test, chore
Example: feat(auth): add password reset flow
```

### Pull Requests
1. Create branch from `main`
2. Make changes with atomic commits
3. Run tests locally: `pnpm test`
4. Create PR with description template
5. Request review from team
6. Squash merge after approval

---

## Code Standards

### TypeScript / JavaScript
```typescript
// Use named exports
export function calculateTotal(items: Item[]): number {
  // Early returns for edge cases
  if (!items.length) return 0;

  // Descriptive variable names
  const subtotal = items.reduce((sum, item) => sum + item.price, 0);

  return subtotal;
}
```

### React Components
```tsx
// Component file structure
interface Props {
  title: string;
  onAction: () => void;
}

export function FeatureCard({ title, onAction }: Props) {
  // Hooks at top
  const [isOpen, setIsOpen] = useState(false);

  // Handlers
  const handleClick = () => {
    setIsOpen(true);
    onAction();
  };

  // Render
  return (
    <Card onClick={handleClick}>
      <CardTitle>{title}</CardTitle>
    </Card>
  );
}
```

---

## Common Tasks

### Adding a New API Endpoint
1. Define types in `src/types/[domain].ts`
2. Create handler in `src/api/[domain]/[action].ts`
3. Add route in `src/api/routes.ts`
4. Write tests in `tests/api/[domain].test.ts`
5. Update API documentation

### Adding a New Component
1. Create component in `src/components/[ComponentName]/`
2. Add index.ts for exports
3. Add Storybook story if visual component
4. Write unit tests
5. Document props in JSDoc

### Database Migration
```bash
# Create migration
pnpm db:migrate:create [migration-name]

# Apply migrations
pnpm db:migrate

# Rollback last migration
pnpm db:migrate:rollback
```

---

## Environment Variables

| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| `DATABASE_URL` | Yes | Database connection string | `postgresql://...` |
| `API_KEY` | Yes | External API authentication | `sk_live_...` |
| `DEBUG` | No | Enable debug logging | `true` |

---

## Troubleshooting

### Build Fails
```
Error: Cannot find module 'xyz'
Solution: Run `pnpm install` to ensure all dependencies are installed
```

### Database Connection Error
```
Error: ECONNREFUSED 127.0.0.1:5432
Solution: Ensure PostgreSQL is running: `brew services start postgresql`
```

---

## Current Tasks

<!-- AUTO-SYNC:TASKS -->
### P0 - Critical
- [ ] [Task 1 from project plan]
- [ ] [Task 2 from project plan]

### P1 - High
- [ ] [Task 3 from project plan]
<!-- AUTO-SYNC:TASKS:END -->

---

## Related Documentation

- [PRD](./products/[name]/prd/PRD.md) - Product requirements
- [UIUX](./products/[name]/uiux/UIUX.md) - Design specifications
- [Architecture](./products/[name]/architecture/ARCHITECTURE.md) - Technical design
- [TODO](./products/[name]/project/TODO.md) - Full task list

---

## Document Info

```yaml
version: 1.0.0
last_updated: 2024-12-28
auto_sync: enabled
sources:
  prd: 1.0.0
  uiux: 1.0.0
  architecture: 1.0.0
  project-plan: 1.0.0
```
```

---

## Quality Gates

### Documentation Review Checklist

- [ ] Quick start tested on fresh environment
- [ ] All commands are copy-paste ready
- [ ] Code examples are complete and runnable
- [ ] Environment variables are documented
- [ ] Common tasks cover major workflows
- [ ] Troubleshooting addresses known issues
- [ ] Task list is current
- [ ] Version metadata is accurate
- [ ] All source documents are referenced

### Quality Score Rubric

| Criterion | Weight | 90+ | 70-89 | Below 70 |
|-----------|--------|-----|-------|----------|
| Quick Start Quality | 25% | < 5 min, tested | < 10 min | > 10 min or broken |
| Completeness | 25% | All sections | Minor gaps | Major gaps |
| Accuracy | 20% | All current | Mostly current | Outdated |
| Actionability | 15% | Clear guidance | Some vague parts | Unclear |
| Maintainability | 15% | Auto-sync ready | Partial sync | Manual only |

---

## Integration Points

### Receives From:
- `product-research` skill (feature context)
- `uiux-design` skill (component details)
- `architecture-design` skill (technical specifications)
- `project-planning` skill (task list)

### Produces:
- CLAUDE.md (primary deliverable)
- manifest.json (version tracking)

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2024-12-28 | Initial release |
