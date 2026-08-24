# Known issue: workspace buttons don't switch on click

Clicking a workspace number in the bar does nothing. This is not a config
bug on our end — it's an upstream incompatibility between Hyprland's new
native Lua config (`hypr/hyprland.lua`) and Waybar.

## Why

Under the Lua config, Hyprland's IPC socket no longer accepts the classic
`dispatch <name> <args>` syntax that external tools send (e.g. Waybar's
built-in workspace click handler sends `dispatch workspace 2`). It now
expects Lua expressions instead, e.g.:

```
hyprctl dispatch 'hl.dsp.focus({workspace = 2})'
```

The old syntax fails with a Lua parse error. Waybar's `hyprland/workspaces`
module has no config option to override its click behavior, so there's
currently no way to fix this from waybar's config alone.

Confirmed as expected/intentional upstream behavior, not yet fixed:

- https://github.com/Alexays/Waybar/issues/5008
- https://github.com/hyprwm/Hyprland/discussions/14255

## TODO

Check back on these links periodically. Once Waybar adds support for the
new dispatch syntax (or Hyprland adds a compat shim), this file can be
deleted and the workspace buttons should just work again.

Until then, workspaces still switch fine via keybinds
(`mainMod + [0-9]` etc.) — it's only the waybar click that's broken.
