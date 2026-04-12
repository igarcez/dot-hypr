# Plan: Vim-style jhkl arrows + named workspaces for free letters

## Goal
Add vim-style directional keys (`h/j/k/l`) alongside the existing arrow keys in the `navigation` and `movement` submaps, and bind every currently-unused letter to a new **named** workspace in both submaps.

## Decisions (from clarifying questions)
- **`H` becomes `left`**, replacing its current role as workspace 2. Workspace 2 is rebound to a free letter — proposing **`D`** (right-hand home row, index finger, adjacent to where `H` sits).
- **Every unused letter** (except those touched by the caps/esc swap, which in practice affects no alpha keys) gets a new named workspace.
- **Named workspaces** (`name:<letter>`), not numeric. Existing numeric workspaces 1–9 stay numeric.

## Current key usage (before changes)
Navigation/movement both use: `N=1, H=2, T=3, R=4, G=5, C=6, V=7, M=8, W=9, S=special:magic` plus arrow keys.

Free letters (currently unused in either submap): `A B D E F I J K L O P Q U X Y Z` (16 letters).

## After changes
Reserved letters:
- Arrows: `H=left`, `J=down`, `K=up`, `L=right`
- Numeric workspaces: `N=1, D=2, T=3, R=4, G=5, C=6, V=7, M=8, W=9`
- Special: `S=special:magic`

Free letters → **named workspaces**: `A B E F I O P Q U X Y Z` (12 letters → `name:a`…`name:z`).

## Steps

### Step 1: ~~Add vim arrows to `navigation` submap~~ Done
- **File(s):** `conf/binds.conf`
- **Action:** After the existing four arrow `movefocus` binds (lines 85–88), add four vim-key equivalents. Because `H` is currently bound to workspace 2 on line 94, that binding must be removed in this step as well (see Step 2 for the replacement).
- **Details:** Insert right after line 88:

```conf
bind = , H, movefocus, l
bind = , J, movefocus, d
bind = , K, movefocus, u
bind = , L, movefocus, r
```

And delete the existing block (lines 94–96):

```conf
bind = , H, workspace, 2
bind = , H, exec, $effects reset
bind = , H, submap, reset
```

### Step 2: ~~Rebind workspace 2 to `D` in `navigation`~~ Done
- **File(s):** `conf/binds.conf`
- **Action:** Add a new block for `D = workspace 2` in the `navigation` submap where `H` used to be.
- **Details:**

```conf
bind = , D, workspace, 2
bind = , D, exec, $effects reset
bind = , D, submap, reset
```

### Step 3: ~~Add named-workspace binds to `navigation`~~ Done
- **File(s):** `conf/binds.conf`
- **Action:** For each free letter `A B E F I O P Q U X Y Z`, add a three-line binding block that switches to `name:<letter>` and exits the submap.
- **Details:** Example for `A`:

```conf
bind = , A, workspace, name:a
bind = , A, exec, $effects reset
bind = , A, submap, reset
```

Repeat with the letter substituted for all 12 free letters. Place these after the existing numeric workspace binds and before the `S = togglespecialworkspace, magic` line.

### Step 4: ~~Add vim arrows to `movement` submap~~ Done
- **File(s):** `conf/binds.conf`
- **Action:** Mirror Step 1 for the `movement` submap (lines 133–136 are the existing `movewindow` binds). Add vim equivalents and remove the old `H = movetoworkspace, 2` block (lines 145–147).
- **Details:** Insert after line 136:

```conf
bind = , H, movewindow, l
bind = , J, movewindow, d
bind = , K, movewindow, u
bind = , L, movewindow, r
```

Delete:

```conf
bind = , H, movetoworkspace, 2
bind = , H, exec, $effects reset
bind = , H, submap, reset
```

### Step 5: ~~Rebind movetoworkspace 2 to `D` in `movement`~~ Done
- **File(s):** `conf/binds.conf`
- **Action:** Add the replacement `D` binding for movetoworkspace 2.
- **Details:**

```conf
bind = , D, movetoworkspace, 2
bind = , D, exec, $effects reset
bind = , D, submap, reset
```

### Step 6: ~~Add named-workspace movetoworkspace binds to `movement`~~ Done
- **File(s):** `conf/binds.conf`
- **Action:** For each of the 12 free letters `A B E F I O P Q U X Y Z`, add a `movetoworkspace, name:<letter>` block. Example for `A`:
- **Details:**

```conf
bind = , A, movetoworkspace, name:a
bind = , A, exec, $effects reset
bind = , A, submap, reset
```

Repeat for every free letter. Place these after the numeric workspace movetoworkspace binds and before the `S = movetoworkspace, special:magic` line.

### Step 7: ~~Reload and verify~~ Done
- **File(s):** n/a
- **Action:** Run `hyprctl reload` and smoke-test the new bindings.
- **Details:**
  - Enter `navigation` submap: verify `H/J/K/L` move focus, `D` goes to workspace 2, `A` goes to `name:a` workspace (creates it on first use).
  - Enter `movement` submap: verify the same keys move the active window.
  - Confirm `Escape` still exits both submaps cleanly.

## Notes
- **dvp layout caveat:** On programmer Dvorak, the physical positions of `j`, `h`, `k`, `l` are scattered (`j` and `k` on the bottom row, `h` on home row, `l` on the top row). The bindings still work because Hyprland binds logical keysyms, not physical positions — but the ergonomic vim-row feel you get on QWERTY won't apply here. Arrow keys remain as a fallback.
- **Named workspaces are created on first use** by Hyprland. They persist until emptied, and are not numbered, so they won't show up in numeric iterators like `workspace, +1`.
- **Workspace 2 moves from `H` to `D`.** If you'd rather use a different letter (e.g. `F` or `B`), swap the letter in Steps 2 and 5.
- **Total new bindings:** 8 vim-arrow lines (4 per submap) + 2 × 3 = 6 lines for the `D` rebind + 2 × 12 × 3 = 72 lines for the named workspaces. Roughly **86 new/changed lines** in `conf/binds.conf`.
- No changes to `scripts/submap-effects.sh` or `hyprland.conf` are needed.
