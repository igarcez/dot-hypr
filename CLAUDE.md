# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Communication

Be as concise as possible in every interaction.

## Overview

This is a Hyprland Wayland compositor configuration. There are no build steps or tests — changes take effect by reloading Hyprland.

## Applying Changes

```bash
# Reload Hyprland config (hot-reload, no restart needed)
hyprctl reload

# Test a single keyword change live
hyprctl keyword <section>:<key> <value>

# Apply multiple keywords at once (used heavily in submap-effects.sh)
hyprctl --batch "keyword foo:bar val ; keyword baz:qux val2"
```

## File Structure

- `hyprland.conf` — Main entry point. Defines variables, autostart, env vars, visual settings, input, and window rules. Sources `conf/monitors.conf` and `conf/binds.conf`.
- `conf/monitors.conf` — Monitor layout by display description (make/model/serial). Monitors are matched by `desc:` to be portable across hardware setups.
- `conf/binds.conf` — All keybindings. Uses a leader-key submap system instead of modifier+key combos.
- `scripts/submap-effects.sh` — Called on submap entry/exit to update border colors and shadow via `hyprctl --batch`. Each submap has a distinct color theme as a visual indicator of the current mode.

## Keybinding Architecture

Bindings use a **leader-key submap system** centered on the `Delete` key (`$leader`):

- `Delete` → enters `leader` submap (amber border)
- `Shift+Delete` → enters `service` submap directly (yellow border)

From `leader`, single keys open nested submaps:
- `A` → `apps` (green border) — launch applications
- `N` → `navigation` (red border) — switch focus/workspace
- `M` → `movement` (orange border) — move windows/workspaces
- `L` → `layout` (purple border) — resize, float, split
- `S` → `service` (yellow border) — volume, brightness, media, screenshots

Workspace keys use **Dvorak home row**: N=1, H=2, T=3, R=4, G=5, C=6, V=7, M=8, W=9.

Every submap exits via `Escape` or the action key itself (most binds trigger `submap reset` after acting). The `reset` case in `submap-effects.sh` restores the default border/shadow/gap values from `hyprland.conf`.

## Key Variables (hyprland.conf)

```
$terminal     = kitty
$fileManager  = thunar
$menu         = wofi --show drun
$copyclip_menu = cliphist list | wofi -S dmenu | cliphist decode | wl-copy
$leader       = Delete            (defined in conf/binds.conf)
$effects      = ~/.config/hypr/scripts/submap-effects.sh
```

## Keyboard Layout

Input uses **Programmer Dvorak** (`kb_variant = dvp`) with `caps:swapescape` (Caps Lock ↔ Escape swap) and `compose:ralt` (Right Alt as Compose key). This affects which physical keys map to which submap letters.

## Autostart Services

- `hyprpaper` — wallpaper (configured in `hyprpaper.conf`, reads from `~/Sync/Images/WallPapers/wp.jpg`)
- `start-waybar.sh` — status bar
- `hyprpolkitagent` — polkit authentication agent (via systemd user service)
- `wl-paste --watch cliphist store` — clipboard history
- `syncthing serve --no-browser` — file sync
- MPD is started via systemd (not exec-once)
