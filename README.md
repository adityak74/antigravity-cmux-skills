<div align="center">

# antigravity-cmux-skill

**Orchestrate independent Antigravity sessions in cmux — split panes, monitor agents, automate browsers, coordinate parallel work**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0.0-green.svg)]()
[![cmux](https://img.shields.io/badge/cmux-Terminal-blue.svg)](https://github.com/manaflow-ai/cmux)
[![macOS](https://img.shields.io/badge/macOS-14.0+-999999.svg)](https://www.apple.com/macos/)

Running multiple AI agents but can't see what they're doing?<br>
That's what happens when your terminal wasn't built for agent orchestration.

[Installation](#installation) • [Usage](#when-to-use-what) • [How It Works](#how-it-works) • [Examples](#real-world-scenarios)

</div>

This plugin teaches Google Antigravity how to use [cmux](https://github.com/manaflow-ai/cmux) — a native macOS terminal built for AI coding agents. Use `/cmux` to spawn parallel Antigravity sessions in split panes, monitor agent output, automate browsers, manage notifications, and coordinate multi-agent workflows.

## Installation

Run the installation script in this repository:
```bash
./scripts/install.sh
```

> [!NOTE]
> Requires [cmux](https://github.com/manaflow-ai/cmux) (macOS 14.0+) and [Antigravity](https://antigravity.google) CLI (`agy`). Use `/cmux` to invoke the skill inside a cmux terminal.

## When to Use What

<table>
<tr>
  <th width="280">You're thinking...</th>
  <th width="280">Use</th>
  <th>What happens</th>
</tr>
<tr>
  <td>"I need three agents working in parallel"</td>
  <td><code>/cmux</code> Spin up 3 agents to research X, Y, Z</td>
  <td>Creates split panes, launches independent Antigravity sessions, monitors output via <code>read-screen</code>, coordinates with sync tokens</td>
</tr>
<tr>
  <td>"What's my other agent doing?"</td>
  <td><code>/cmux</code> Check agent progress in surface:5</td>
  <td>Reads terminal output from any surface without switching to it, reports status</td>
</tr>
<tr>
  <td>"I need to test this in a browser"</td>
  <td><code>/cmux</code> Open browser and test the login flow</td>
  <td>Opens browser surface, snapshots for element refs, interacts via <code>click</code>/<code>fill</code> — no CSS selectors</td>
</tr>
<tr>
  <td>"Notify me when the build finishes"</td>
  <td><code>/cmux</code> Notify me when the build finishes</td>
  <td>Uses <code>cmux notify</code> (in-app) or <code>osascript</code> (system-level) based on context</td>
</tr>
<tr>
  <td>"I need agents to share data"</td>
  <td><code>/cmux</code> Share API findings with the test agent</td>
  <td>Stores results in named buffers, signals completion with <code>wait-for</code> tokens</td>
</tr>
</table>

## How It Works

Invoke with `/cmux` inside a cmux terminal. The skill uses **progressive disclosure** — core concepts load when `/cmux` is invoked, while detailed references load only when the agent needs them.

```
antigravity-cmux-skill/
├── gemini-extension.json        # Extension metadata
├── plugin.json                  # Plugin namespace
├── hooks.json                   # Lifecycle hooks (SessionStart, Stop)
└── skills/
    └── cmux/
        ├── SKILL.md             # /cmux skill
        └── references/
            ├── orchestration.md       # Multi-agent patterns
            ├── browser-automation.md  # Full browser API
            ├── notifications.md       # Notification systems
            └── complete-cli.md        # Complete CLI catalog
```

### Key Capabilities

<table>
<tr>
  <th width="200">Capability</th>
  <th>What the agent can do</th>
</tr>
<tr>
  <td><strong>Agent Orchestration</strong></td>
  <td>Split panes, launch independent Antigravity sessions, monitor output via <code>read-screen</code>, coordinate with <code>wait-for</code> sync tokens, track progress in sidebar</td>
</tr>
<tr>
  <td><strong>Terminal I/O</strong></td>
  <td>Read terminal output from any surface, pipe through commands, share data between panes via named buffers</td>
</tr>
<tr>
  <td><strong>Browser Automation</strong></td>
  <td>Snapshot-based browser control with element refs — <code>click</code>, <code>fill</code>, <code>type</code> using refs like <code>e3</code> instead of CSS selectors</td>
</tr>
<tr>
  <td><strong>Sidebar Metadata</strong></td>
  <td>Status pills, progress bars, and log entries for real-time orchestration visibility</td>
</tr>
<tr>
  <td><strong>Notifications</strong></td>
  <td>Context-aware selection between in-app (<code>cmux notify</code>) and system-level (<code>osascript</code>) alerts</td>
</tr>
<tr>
  <td><strong>Workspace Management</strong></td>
  <td>Create, switch, rename, and close workspaces with optional startup commands</td>
</tr>
</table>

## Real-World Scenarios

### Parallel feature implementation

```
You: /cmux Implement auth and payments modules in parallel

Antigravity splits two panes, launches an independent session in each:
  surface:5 → "agy -i 'implement auth module'"
  surface:6 → "agy -i 'implement payments module'"

Antigravity monitors both via read-screen, updates sidebar progress,
and collects results when sessions finish.
```

## Acknowledgments

- **[cmux](https://github.com/manaflow-ai/cmux)** — The native macOS terminal for AI coding agents
- **Google Antigravity** — The AI-first development platform

## License

[MIT](LICENSE)
