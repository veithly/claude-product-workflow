#!/bin/bash
# Claude Product Workflow - macOS/Linux Installation Script

set -e

echo -e "\033[36mInstalling Claude Product Workflow...\033[0m"

# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

# Check if Claude directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo -e "\033[33mCreating Claude config directory...\033[0m"
    mkdir -p "$CLAUDE_DIR"
fi

# Create subdirectories if they don't exist
mkdir -p "$CLAUDE_DIR/templates"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/skills/product-research"
mkdir -p "$CLAUDE_DIR/skills/uiux-design"
mkdir -p "$CLAUDE_DIR/skills/architecture-design"
mkdir -p "$CLAUDE_DIR/skills/project-planning"
mkdir -p "$CLAUDE_DIR/skills/dev-documentation"

# Copy templates
echo -e "\033[32mInstalling templates...\033[0m"
cp -r "$SCRIPT_DIR/templates/"* "$CLAUDE_DIR/templates/"

# Copy agents
echo -e "\033[32mInstalling agents...\033[0m"
cp -r "$SCRIPT_DIR/agents/"* "$CLAUDE_DIR/agents/"

# Copy commands
echo -e "\033[32mInstalling commands...\033[0m"
cp -r "$SCRIPT_DIR/commands/"* "$CLAUDE_DIR/commands/"

# Copy skills
echo -e "\033[32mInstalling skills...\033[0m"
cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"

echo ""
echo -e "\033[36mInstallation complete!\033[0m"
echo ""
echo -e "\033[37mInstalled files:\033[0m"
echo "  - 5 templates in $CLAUDE_DIR/templates/"
echo "  - 5 agents in $CLAUDE_DIR/agents/"
echo "  - 7 commands in $CLAUDE_DIR/commands/"
echo "  - 5 skills:"
echo "    - product-research (Chrome DevTools competitor analysis)"
echo "    - uiux-design (Anti-template professional design)"
echo "    - architecture-design (Tech decision matrices)"
echo "    - project-planning (Task decomposition rules)"
echo "    - dev-documentation (CLAUDE.md synthesis)"
echo ""
echo -e "\033[37mUsage:\033[0m"
echo "  /product-init my-app 'Description of your product'"
echo ""
echo "For more information, see: https://github.com/veithly/claude-product-workflow"
