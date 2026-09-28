# Omarchy Dev Workflows Switcher & Launcher

A dynamic status bar widget and interactive tool-stack launcher for **[Omarchy](https://omarchy.org/) (Arch Linux + Hyprland)**.

Switch between skill-tailored development workflows (AI Prototyping, Full-Stack Web & Cloud, Systems & Performance) directly from your top bar, and dynamically add, remove, or customize tools on the fly.

---

## ✨ Features

- **Dynamic Bar Icon**: The top bar widget shows the live glyph of your active workflow (`󰚩` AI Prototyping, `󰖟` Full-Stack, `󰅟` Systems) and updates instantly when switched.
- **Interactive Switcher & Launcher**: Single left-click opens an interactive Quickshell menu:
  - **Switch Active Workflow**: Switch contexts with 1 click.
  - **Launch Stack Tools**: Dedicated tools pre-configured for that workflow.
  - **Add Tools**: Add any command, TUI, or app to your active workflow with custom icons.
  - **Remove Tools**: Remove tools you no longer need.
  - **Create New Workflows**: Add completely custom workflows (e.g. Mobile Dev, Data Science, Game Dev).
  - **Direct JSON Editing**: Direct edit access in Neovim.
- **Global Keybinding**: Launch the workflow menu from anywhere using <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>W</kbd>.

---

## 🚀 Preconfigured Workflows

1. **🤖 AI-Assisted Prototyping (`ai-assisted`)**:
   - Antigravity CLI (`agy`)
   - Claude Code (`claude`)
   - OpenCode AI (`opencode`)
   - Codex CLI (`codex`)
   - Live Diff Watcher (`hunk diff --watch`)
   - Ollama Local AI Chat (`ollama`)
   - Dropdown Kitty Scratchpad
2. **󰢹 Herdr Swarms & Prototyping (`herdr-prototyping`)**:
   - Herdr Persistent Workspace (`herdr`)
   - Herdr Dev Square (`hds` - Neovim + Hunk Watch + OpenCode + Terminal)
   - Dual AI Review Layout (`hdl agy claude`)
   - 4-Agent Swarm Grid (`hsl 4 agy`)
   - Git Worktree Manager (`herdr worktree list`)
   - Live Diff Watcher (`hunk diff --watch`)
3. **🌐 Full-Stack Web & Cloud (`fullstack-web`)**:
   - Neovim (`nvim`)
   - Tmux Dev Workspace (`tmux`)
   - Lazygit Client (`lazygit`)
   - Lazydocker TUI (`lazydocker`)
   - Live Diff Watcher (`hunk diff --watch`)
   - Project Workspace Switcher (`fzf`)
4. **⚙️ Systems & Performance (`systems-performance`)**:
   - Btop Resource Monitor (`btop`)
   - Hyprland Config Editor
   - Live System Journal (`journalctl`)
   - GPU Mode Switcher (`gpu-profile-switch` - iGPU / dGPU)
   - ASUS Fan & Power Profile Switcher
   - ASUS Battery Threshold Limit Toggle

---

## 📦 Installation

```bash
git clone https://github.com/dragpk247/omarchy-dev-workflows.git
cd omarchy-dev-workflows
chmod +x install.sh
./install.sh
```

---

## 🛠️ CLI Usage

```bash
# Check current active workflow and list available ones
omarchy-workflow status

# Switch active workflow from terminal
omarchy-workflow set fullstack-web
omarchy-workflow set ai-assisted
omarchy-workflow set systems-performance

# Open interactive switcher and tool launcher
omarchy-workflow-menu
```

---

## ⚙️ Configuration File

All workflows, tools, and actions are persisted in standard JSON at:
```text
~/.local/state/omarchy/settings/dev-workflows.json
```

---

## 📄 License

MIT License
