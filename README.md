# Claude Product Workflow

> A comprehensive 5-skill product development workflow for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)

Transform your product ideas into development-ready documentation with AI-powered specialized skills that enforce **professional-grade standards** for market research, design specifications, technical architecture, project planning, and developer guides.

## What Makes This Different

This is not just another documentation generator. Each skill enforces **strict professional standards**:

| Skill | Key Differentiators |
|-------|---------------------|
| **Product Research** | Uses Chrome DevTools MCP for competitor analysis, requires 5+ direct competitors, enforces "WHY not just WHAT" analysis |
| **UIUX Design** | **PROHIBITS** AI-template patterns (blue-purple gradients, generic fonts), **REQUIRES** enterprise component libraries |
| **Architecture Design** | Decision matrices for all tech choices, performance budgets, security checklists |
| **Project Planning** | Three-point estimation, risk registers, explicit dependency types, 16-hour task limits |
| **Dev Documentation** | 5-minute quick start, version tracking, auto-sync with manual overrides |

## Features

- **5 Specialized Skills**: Independent, professional-grade guidelines for each phase
- **Anti-Template Design**: UIUX skill prohibits generic AI-generated patterns
- **Evidence-Based Research**: Chrome DevTools analysis for competitor insights
- **Full Pipeline Orchestration**: Single command to generate all documentation
- **Quality Gates**: User approval points between major phases
- **Auto-Synchronization**: Documents stay in sync when requirements change

## Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/veithly/claude-product-workflow.git

# Run the install script
cd claude-product-workflow
./install.sh  # macOS/Linux
# or
.\install.ps1  # Windows PowerShell
```

### Manual Installation

Copy the directories to your Claude Code config:

```bash
# macOS/Linux
cp -r templates ~/.claude/
cp -r agents ~/.claude/
cp -r commands ~/.claude/
cp -r skills ~/.claude/

# Windows
xcopy /E templates %USERPROFILE%\.claude\templates\
xcopy /E agents %USERPROFILE%\.claude\agents\
xcopy /E commands %USERPROFILE%\.claude\commands\
xcopy /E skills %USERPROFILE%\.claude\skills\
```

## Usage

### Full Pipeline

Initialize a complete product development workflow:

```bash
/product-init my-awesome-app "A task management app for remote teams"
```

This runs through all 5 phases with approval gates:

1. **Discovery** - Requirements clarification
2. **PRD** - Market research and product requirements
3. **UIUX** - Design specifications
4. **Architecture** - Technical design
5. **Planning** - Task breakdown
6. **Dev Guide** - Developer documentation

### Individual Commands

Run specific phases independently:

```bash
/product-prd my-app              # Generate PRD only
/product-uiux my-app             # Generate UIUX specs (requires PRD)
/product-architect my-app        # Generate architecture (requires PRD, UIUX)
/product-plan my-app             # Generate TODO (requires all prior)
/product-dev my-app              # Generate dev guide (requires all)
/product-sync my-app             # Sync all documents
/product-change my-app "desc"    # Intelligent feature updates
```

### Feature Change Management

When you need to add, modify, or remove features:

```bash
# Add a new feature
/product-change my-app "Add dark mode toggle to user settings"

# Modify an existing feature
/product-change my-app "Change auth from email/password to OAuth"

# Remove a feature
/product-change my-app "Remove legacy export, use new API instead"

# Preview changes without applying
/product-change my-app "Add notifications" --dry-run

# Update docs AND implement code
/product-change my-app "Add search functionality" --implement
```

This command:
- Analyzes impact across all documents (PRD → UIUX → Architecture → TODO → CLAUDE.md)
- Classifies changes (Feature Add/Modify/Remove, UX Change, Tech Change, Priority Change, Scope Change)
- Generates update schedule with dependency awareness
- Provides user approval gates before execution
- Optionally implements code changes with `--implement` flag

### Document Synchronization

Sync documents with smart change detection:

```bash
/product-sync my-app             # Sync all documents
/product-sync my-app --verify    # Check consistency (report only)
/product-sync my-app --auto-fix  # Auto-resolve minor issues
/product-sync my-app --dry-run   # Preview what would change
/product-sync my-app --force     # Regenerate all regardless of version
```

### Update Mode

Update existing documents when requirements change:

```bash
/product-prd my-app --update     # Update PRD
/product-sync my-app             # Cascade updates to all documents
```

## Generated Documents

After running `/product-init`, you'll have:

```
./products/my-awesome-app/
├── manifest.json           # Version tracking and sync status
├── prd/
│   └── PRD.md              # Product Requirements Document
├── uiux/
│   ├── UIUX.md             # UI/UX Specifications
│   ├── components/         # Component details
│   └── assets/             # SVG graphics
├── architecture/
│   ├── ARCHITECTURE.md     # Technical Architecture
│   └── diagrams/           # System diagrams
├── project/
│   ├── TODO.md             # Task List with priorities
│   └── milestones.json     # Milestone tracking
└── development/
    └── CLAUDE.md           # Developer Guide
```

## Skills Overview

### Product Research Skill (`skills/product-research/`)

**Chrome DevTools-Powered Competitor Analysis**

- Uses Chrome DevTools MCP to analyze competitor websites
- Analyzes Elements, Network, Performance, and Application panels
- Requires 5+ direct competitors and 3+ indirect competitors
- Enforces "WHY not just WHAT" feature analysis
- All claims must have evidence sources

### UIUX Design Skill (`skills/uiux-design/`)

**Anti-Template Professional Design**

PROHIBITED:
- Blue-purple gradients (AI cliche)
- System default fonts
- Template layouts (centered hero + gradient + mockup)
- Undraw/Humaaans-style illustrations

REQUIRED:
- Enterprise component libraries (shadcn/ui, Radix UI, Chakra UI)
- Color psychology rationale
- Reference proven design systems (Stripe, Linear, Vercel, Airbnb)
- Full WCAG 2.1 AA accessibility compliance

### Architecture Design Skill (`skills/architecture-design/`)

**Decision-Matrix-Driven Technical Design**

- Technology selection with criteria matrix (Team Expertise, Ecosystem, Performance)
- Architecture patterns based on team size
- Complete security checklist
- Performance budgets (LCP, FID, CLS, API P95/P99)
- API specification with all states

### Project Planning Skill (`skills/project-planning/`)

**Risk-Aware Task Decomposition**

- Maximum 16 hours per task
- Three-point estimation (Optimistic, Most Likely, Pessimistic)
- Explicit dependency types (Finish-to-Start, Start-to-Start, etc.)
- Risk register with probability, impact, mitigation
- Milestone definitions with measurable success criteria

### Dev Documentation Skill (`skills/dev-documentation/`)

**Developer-Ready CLAUDE.md**

- Quick start < 5 minutes to dev ready
- All commands copy-paste ready
- Version tracking with dependency chains
- Auto-sync sections with manual override preservation
- Troubleshooting for common issues

## Workflow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    /product-init                             │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Phase 1: Discovery                                         │
│  └── Requirements clarification (Quality Gate: 80+ clarity) │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Phase 2: PRD Generation (product-research skill)           │
│  └── Chrome DevTools analysis + 5+ competitors              │
│  🛑 USER APPROVAL REQUIRED                                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Phase 3: UIUX Design (uiux-design skill)                   │
│  └── Anti-template design + enterprise components           │
│  🛑 USER APPROVAL REQUIRED                                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Phase 4: Architecture (architecture-design skill)          │
│  └── Decision matrices + performance budgets                │
│  🛑 USER APPROVAL REQUIRED                                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Phase 5: Project Planning (project-planning skill)         │
│  └── Three-point estimation + risk register                 │
│  🛑 USER APPROVAL REQUIRED                                  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│  Phase 6: Dev Guide (dev-documentation skill)               │
│  └── CLAUDE.md with auto-sync                               │
│  ✅ COMPLETE                                                │
└─────────────────────────────────────────────────────────────┘
```

## Synchronization

Documents are linked with version dependencies. When a source document changes:

```
PRD changes
    │
    ├──► UIUX updates
    │     │
    │     └──► Architecture updates
    │           │
    │           └──► TODO updates
    │                 │
    │                 └──► CLAUDE.md updates
```

Run `/product-sync my-app` to cascade updates, or use `--dry-run` to preview changes.

## Directory Structure

```
claude-product-workflow/
├── skills/                     # Independent skill guidelines
│   ├── product-research/       # Chrome DevTools competitor analysis
│   ├── uiux-design/            # Anti-template design standards
│   ├── architecture-design/    # Tech decision matrices
│   ├── project-planning/       # Task decomposition rules
│   └── dev-documentation/      # CLAUDE.md synthesis
├── templates/                  # Document templates
├── agents/                     # Agent definitions
├── commands/                   # Command definitions
├── install.sh                  # macOS/Linux installer
├── install.ps1                 # Windows installer
└── README.md
```

## Requirements

- Claude Code CLI installed
- Internet access (for market research)
- **Required**: Chrome DevTools MCP (for competitor analysis)
- Optional: Context7 MCP for library docs
- Optional: Serena MCP for codebase analysis

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Design Prompts](https://www.designprompts.dev/) for UI/UX best practices
- [Mermaid](https://mermaid.js.org/) for diagram syntax
- [shadcn/ui](https://ui.shadcn.com/) for component library reference
- Claude Code team for the extension platform

---

Made with AI by the Claude Code community
