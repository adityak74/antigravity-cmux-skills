# Design Spec: Porting `claude-cmux-skill` to Google Antigravity

- **Author**: Antigravity AI
- **Date**: 2026-07-15
- **Status**: Approved by User

## 1. Overview
The goal of this project is to port the `claude-cmux-skill` plugin from Claude Code to Google Antigravity. The plugin enables the agent to orchestrate parallel sessions inside a `cmux` macOS terminal. The ported version will support the new metadata structures of Antigravity plugins and the `agy` CLI, adjusting configuration files and replacing references to `claude` with `agy`.

## 2. Directory Layout
We will create a standalone project directory at `/Users/adityakarnam/Projects/antigravity-cmux-skill/` with the following structure:
- `gemini-extension.json` (Extension manifest)
- `plugin.json` (Plugin declaration)
- `hooks.json` (Lifecycle hooks mapped to Antigravity schema)
- `README.md` (Updated user documentation)
- `scripts/`
  - `install.sh` (Installer script to symlink to global config)
- `skills/`
  - `cmux/`
    - `SKILL.md` (Main instructions using `agy` command)
    - `references/` (Detailed guides updated for `agy`)
      - `browser-automation.md`
      - `complete-cli.md`
      - `notifications.md`
      - `orchestration.md`

## 3. Configuration Conversions

### 3.1. `gemini-extension.json`
This acts as the extension manifest for Antigravity:
```json
{
  "name": "antigravity-cmux-skill",
  "description": "Skill for orchestrating independent Antigravity sessions in cmux terminal — split panes, agent monitoring, browser automation, sidebar metadata, notifications, and full CLI coverage.",
  "version": "2.0.0",
  "contextFileName": "README.md"
}
```

### 3.2. `plugin.json`
Specifies name configuration for namespacing:
```json
{
  "name": "antigravity-cmux-skill"
}
```

### 3.3. `hooks.json`
The lifecycle hooks mapped to the Antigravity schema.
- We group `SessionStart` under a module name `cmux-hooks` with matcher `startup|clear|compact`.
- We write `Stop` as a flat handler list.
- We exclude the `Notification` hook since it's unsupported in Antigravity.
```json
{
  "cmux-hooks": {
    "SessionStart": [
      {
        "matcher": "startup|clear|compact",
        "hooks": [
          {
            "type": "command",
            "command": "if [ -n \"$CMUX_SOCKET_PATH\" ]; then cmux claude-hook session-start; else exit 0; fi"
          }
        ]
      }
    ],
    "Stop": [
      {
        "type": "command",
        "command": "if [ -n \"$CMUX_SOCKET_PATH\" ]; then cmux claude-hook stop; else exit 0; fi"
      }
    ]
  }
}
```

## 4. Documentation & Content Translations
- Update `README.md` to reference `antigravity-cmux-skill`.
- Update `skills/cmux/SKILL.md` to replace references to `claude` with `agy` and adjust explanations about execution mode (interactive vs print mode).
  - Claude: `claude` (interactive) vs `claude -p` (print)
  - Antigravity: `agy -i` (interactive) vs `agy -p` (print)
- Update `skills/cmux/references/*.md` files similarly.

## 5. Verification Plan
- Run lint/check on generated files.
- Verify symlink creation using `scripts/install.sh`.
- Check if global plugins load without validation errors.
