#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing Dev Workflows Widget & Switcher for Omarchy..."

# 1. Install CLI tools
mkdir -p "$HOME/.local/bin"
cp "$REPO_DIR/bin/"* "$HOME/.local/bin/"
chmod +x "$HOME/.local/bin/omarchy-workflow" "$HOME/.local/bin/omarchy-workflow-menu"

# 2. Install Omarchy Plugin
PLUGIN_DIR="$HOME/.config/omarchy/plugins/user.dev-workflows"
mkdir -p "$PLUGIN_DIR"
cp -r "$REPO_DIR/plugin/"* "$PLUGIN_DIR/"

# 3. Initialize Settings
SETTINGS_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/omarchy/settings"
mkdir -p "$SETTINGS_DIR"
if [ ! -f "$SETTINGS_DIR/dev-workflows.json" ]; then
    cp "$REPO_DIR/settings/dev-workflows.json" "$SETTINGS_DIR/"
fi

# 4. Add widget to bar if omarchy is available
if command -v omarchy >/dev/null 2>&1; then
    omarchy-shell shell rescanPlugins 2>/dev/null || true
    echo "==> Placing widget on bar..."
    omarchy bar put user.dev-workflows --before user.agents-control 2>/dev/null || true
    omarchy restart shell 2>/dev/null || true
fi

echo "==> Installation complete! The active Dev Workflow icon is now on your bar."
