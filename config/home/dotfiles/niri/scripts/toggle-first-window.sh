#!/usr/bin/env bash
# Toggle focus between the leftmost (first-column) window on the current
# workspace and the previously focused window on that same workspace.
set -euo pipefail

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/niri-toggle-first-window"

focused="$(niri msg --json focused-window)"
if [[ -z "$focused" || "$focused" == "null" ]]; then
    exit 0
fi

current_id="$(jq -r '.id' <<<"$focused")"
workspace_id="$(jq -r '.workspace_id // empty' <<<"$focused")"
column="$(jq -r '.layout.pos_in_scrolling_layout[0] // empty' <<<"$focused")"

if [[ -z "$workspace_id" ]]; then
    exit 0
fi

windows="$(niri msg --json windows)"

# Leftmost tiled window: column 1, lowest tile index on this workspace.
leftmost_id="$(
    jq -r --argjson ws "$workspace_id" '
        [.[]
         | select(.workspace_id == $ws)
         | select(.is_floating == false)
         | select(.layout.pos_in_scrolling_layout != null)
         | {id, col: .layout.pos_in_scrolling_layout[0], tile: .layout.pos_in_scrolling_layout[1]}
         | select(.col == 1)
        ]
        | sort_by(.tile)
        | .[0].id // empty
    ' <<<"$windows"
)"

if [[ -z "$leftmost_id" ]]; then
    exit 0
fi

is_on_first=0
if [[ "$column" == "1" || "$current_id" == "$leftmost_id" ]]; then
    is_on_first=1
fi

if (( is_on_first == 0 )); then
    printf '%s %s\n' "$current_id" "$workspace_id" >"$STATE_FILE"
    niri msg action focus-window --id "$leftmost_id"
    exit 0
fi

# Already on the first column: restore remembered window if still valid.
if [[ ! -f "$STATE_FILE" ]]; then
    exit 0
fi

read -r remembered_id remembered_ws <"$STATE_FILE" || true
if [[ -z "${remembered_id:-}" || -z "${remembered_ws:-}" ]]; then
    rm -f "$STATE_FILE"
    exit 0
fi

# Only restore within the active workspace.
if [[ "$remembered_ws" != "$workspace_id" ]]; then
    rm -f "$STATE_FILE"
    exit 0
fi

if [[ "$remembered_id" == "$current_id" ]]; then
    rm -f "$STATE_FILE"
    exit 0
fi

still_valid="$(
    jq -r --argjson id "$remembered_id" --argjson ws "$workspace_id" '
        any(.[]; .id == $id and .workspace_id == $ws)
    ' <<<"$windows"
)"

if [[ "$still_valid" != "true" ]]; then
    rm -f "$STATE_FILE"
    exit 0
fi

niri msg action focus-window --id "$remembered_id"
