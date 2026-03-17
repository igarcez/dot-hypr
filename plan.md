# Plan: Fix movement submap color and effects

## Goal
Make the movement submap visually distinct from leader by changing its color to cyan, and remove the gap changes that don't belong in the movement submap.

## Steps

### Step 1: ~~Change movement color to cyan~~ Done
- **File(s):** `scripts/submap-effects.sh`
- **Action:** Replace movement's orange color with cyan
- **Details:** Change the movement case from:
  ```bash
  keyword general:col.active_border rgba(ff6633ee) rgba(ffffffee) 45deg ;\
  keyword decoration:shadow:color rgba(ff663399) ;\
  ```
  To:
  ```bash
  keyword general:col.active_border rgba(00ccffee) rgba(ffffffee) 45deg ;\
  keyword decoration:shadow:color rgba(00ccff99) ;\
  ```

### Step 2: ~~Remove gap changes from movement~~ Done
- **File(s):** `scripts/submap-effects.sh`
- **Action:** Remove `gaps_in` and `gaps_out` keywords from the movement case
- **Details:** Delete these two lines from the movement case:
  ```bash
  keyword general:gaps_in 5 ;\
  keyword general:gaps_out 5 ;\
  ```

## Notes
- After these changes, only `layout` will modify gaps (as intended).
- The full color palette will be: leader=orange, apps=green, navigation=red-pink, movement=cyan, layout=purple, service=yellow.
