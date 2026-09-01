# Migrated from niri's dms/binds.kdl (plus the recent-windows Alt+Tab
# override in config.kdl) and then from DMS's `spawn dms ipc call ...`
# commands to noctalia's `spawn:noctalia msg ...` IPC. See the migration
# report for every bind that was dropped or changed behavior.
{ ... }: {
  programs.umbriel.settings.keybinds = {
    # System & overview
    "Mod+O" = { action = "overview-toggle"; repeat = false; };
    "Mod+Tab" = { action = "overview-toggle"; repeat = false; };
    "Mod+Shift+Slash" = "cheatsheet-toggle";

    # Application launchers
    "Mod+T" = "spawn:ghostty";
    "Mod+Space" = "spawn:noctalia msg panel-toggle launcher";
    # Alt+Space (DMS "spotlight-bar", a compact launcher variant) dropped --
    # noctalia only has one launcher surface. See report.
    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Ctrl+Alt+Delete" = "spawn:noctalia msg panel-toggle session";
    "Mod+Comma" = "spawn:noctalia msg settings-toggle";
    "Mod+Y" = "spawn:noctalia msg panel-toggle wallpaper";
    "Mod+N" = "spawn:noctalia msg panel-toggle control-center notifications";
    # Mod+Shift+N (DMS notepad) dropped -- noctalia has no notepad panel.

    # Security
    "Mod+L" = "spawn:noctalia msg session lock";
    "Mod+Shift+E" = "session-quit";
    # Ctrl+Shift+Escape (DMS task manager) dropped -- noctalia has no
    # process-list / task-manager panel.

    # Audio controls
    "XF86AudioRaiseVolume" = { action = "spawn:noctalia msg volume-up 3"; allow_when_locked = true; };
    "XF86AudioLowerVolume" = { action = "spawn:noctalia msg volume-down 3"; allow_when_locked = true; };
    "XF86AudioMute" = { action = "spawn:noctalia msg volume-mute"; allow_when_locked = true; };
    "XF86AudioMicMute" = { action = "spawn:noctalia msg mic-mute"; allow_when_locked = true; };
    "XF86AudioPause" = { action = "spawn:noctalia msg media toggle"; allow_when_locked = true; };
    "XF86AudioPlay" = { action = "spawn:noctalia msg media toggle"; allow_when_locked = true; };
    "XF86AudioPrev" = { action = "spawn:noctalia msg media previous"; allow_when_locked = true; };
    "XF86AudioNext" = { action = "spawn:noctalia msg media next"; allow_when_locked = true; };
    # Ctrl+XF86Audio{Raise,Lower}Volume (DMS: per-player MPRIS volume via
    # "mpris increment/decrement") dropped -- noctalia's `media` command
    # only has playback controls (previous/next/toggle/play/pause/stop/
    # previous-player/next-player), no per-player volume action.

    # Brightness controls
    "XF86MonBrightnessUp" = { action = "spawn:noctalia msg brightness-up 5"; allow_when_locked = true; };
    "XF86MonBrightnessDown" = { action = "spawn:noctalia msg brightness-down 5"; allow_when_locked = true; };

    # Window management
    "Mod+Q" = { action = "window-close"; repeat = false; };
    "Mod+F" = "window-toggle-maximize";
    "Mod+Shift+F" = "window-toggle-fullscreen";
    "Mod+Shift+T" = "window-toggle-floating";
    "Mod+Shift+V" = "window-focus-switch-floating";
    # Mod+Shift+W (DMS window-rules editor) dropped -- no equivalent
    # panel/IPC command in noctalia.

    # Focus navigation
    "Mod+Left" = "window-focus-left";
    "Mod+Down" = "window-focus-or-workspace-down";
    "Mod+Up" = "window-focus-or-workspace-up";
    "Mod+Right" = "window-focus-right";

    # Window movement
    "Mod+Shift+Left" = "column-move-left";
    "Mod+Shift+Down" = "window-move-down";
    "Mod+Shift+Up" = "window-move-up";
    "Mod+Shift+Right" = "column-move-right";
    "Mod+Shift+H" = "column-move-left";
    "Mod+Shift+J" = "window-move-down";
    "Mod+Shift+K" = "window-move-up";
    "Mod+Shift+L" = "column-move-right";

    # Column navigation
    "Mod+Home" = "column-focus-first";
    "Mod+End" = "column-focus-last";
    "Mod+Ctrl+Home" = "column-move-to-first";
    "Mod+Ctrl+End" = "column-move-to-last";

    # Monitor navigation
    "Mod+Ctrl+Left" = "output-focus-left";
    "Mod+Ctrl+Right" = "output-focus-right";
    "Mod+Ctrl+H" = "output-focus-left";
    "Mod+Ctrl+J" = "output-focus-down";
    "Mod+Ctrl+K" = "output-focus-up";
    "Mod+Ctrl+L" = "output-focus-right";

    # Move column to monitor
    "Mod+Shift+Ctrl+Left" = "column-move-to-output-left";
    "Mod+Shift+Ctrl+Down" = "column-move-to-output-down";
    "Mod+Shift+Ctrl+Up" = "column-move-to-output-up";
    "Mod+Shift+Ctrl+Right" = "column-move-to-output-right";
    "Mod+Shift+Ctrl+H" = "column-move-to-output-left";
    "Mod+Shift+Ctrl+J" = "column-move-to-output-down";
    "Mod+Shift+Ctrl+K" = "column-move-to-output-up";
    "Mod+Shift+Ctrl+L" = "column-move-to-output-right";

    # Workspace navigation
    "Mod+Page_Down" = "workspace-next";
    "Mod+Page_Up" = "workspace-previous";
    "Mod+U" = "workspace-next";
    "Mod+I" = "workspace-previous";
    "Mod+Ctrl+Down" = "column-move-to-workspace-next";
    "Mod+Ctrl+Up" = "column-move-to-workspace-previous";
    "Mod+Ctrl+U" = "column-move-to-workspace-next";
    "Mod+Ctrl+I" = "column-move-to-workspace-previous";

    # Workspace management
    # Ctrl+Shift+R (DMS workspace-rename) dropped -- noctalia has no
    # workspace-rename IPC command.

    # Move workspaces
    "Mod+Shift+Page_Down" = "workspace-move-down";
    "Mod+Shift+Page_Up" = "workspace-move-up";
    "Mod+Shift+U" = "workspace-move-down";
    "Mod+Shift+I" = "workspace-move-up";

    # Mouse wheel navigation (umbriel has no per-bind cooldown-ms option)
    "Mod+WheelDown" = "workspace-next";
    "Mod+WheelUp" = "workspace-previous";
    "Mod+Ctrl+WheelDown" = "column-move-to-workspace-next";
    "Mod+Ctrl+WheelUp" = "column-move-to-workspace-previous";
    "Mod+WheelRight" = "window-focus-right";
    "Mod+WheelLeft" = "window-focus-left";
    "Mod+Ctrl+WheelRight" = "column-move-right";
    "Mod+Ctrl+WheelLeft" = "column-move-left";
    "Mod+Shift+WheelDown" = "window-focus-right";
    "Mod+Shift+WheelUp" = "window-focus-left";
    "Mod+Ctrl+Shift+WheelDown" = "column-move-right";
    "Mod+Ctrl+Shift+WheelUp" = "column-move-left";

    # Numbered workspaces
    "Mod+1" = "workspace-switch:1";
    "Mod+2" = "workspace-switch:2";
    "Mod+3" = "workspace-switch:3";
    "Mod+4" = "workspace-switch:4";
    "Mod+5" = "workspace-switch:5";
    "Mod+6" = "workspace-switch:6";
    "Mod+7" = "workspace-switch:7";
    "Mod+8" = "workspace-switch:8";
    "Mod+9" = "workspace-switch:9";

    # Move to numbered workspaces
    "Mod+Shift+1" = "column-move-to-workspace:1";
    "Mod+Shift+2" = "column-move-to-workspace:2";
    "Mod+Shift+3" = "column-move-to-workspace:3";
    "Mod+Shift+4" = "column-move-to-workspace:4";
    "Mod+Shift+5" = "column-move-to-workspace:5";
    "Mod+Shift+6" = "column-move-to-workspace:6";
    "Mod+Shift+7" = "column-move-to-workspace:7";
    "Mod+Shift+8" = "column-move-to-workspace:8";
    "Mod+Shift+9" = "column-move-to-workspace:9";

    # Column management
    "Mod+BracketLeft" = "window-consume-or-expel-left";
    "Mod+BracketRight" = "window-consume-or-expel-right";

    # Sizing & layout
    "Mod+R" = "window-cycle-width";
    "Mod+Shift+R" = "window-cycle-height";
    "Mod+Ctrl+R" = "window-set-height:1.0";
    "Mod+C" = "column-center";

    # Manual sizing
    "Mod+Minus" = "window-modify-width:-0.1";
    "Mod+Equal" = "window-modify-width:+0.1";
    "Mod+Shift+Minus" = "window-modify-height:-0.1";
    "Mod+Shift+Equal" = "window-modify-height:+0.1";

    # Screenshots -- niri's built-in screenshot/screenshot-screen actions
    # have no umbriel equivalent, but noctalia itself ships native
    # screenshot IPC commands, so these spawn those directly instead of the
    # earlier grim/slurp/satty workaround script.
    "Print" = "spawn:noctalia msg screenshot-region";
    "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
    "XF86Launch1" = "spawn:noctalia msg screenshot-region";
    "Ctrl+Print" = "spawn:noctalia msg screenshot-fullscreen";
    "Ctrl+XF86Launch1" = "spawn:noctalia msg screenshot-fullscreen";
    # Alt+Print / Alt+XF86Launch1 (screenshot-window) dropped -- noctalia's
    # fullscreen modes are monitor-based (focused/pick/output/all), no
    # single-window capture.

    # Mod+P (DMS "outputs cycleProfile", a display/monitor-arrangement
    # profile switcher) dropped -- noctalia has no equivalent IPC namespace.
    # Don't confuse with `power-cycle`, which cycles UPower power profiles
    # (performance/balanced/power-saver), a different feature entirely.

    # System controls
    "Mod+Shift+P" = "dpms-off";

    # Custom
    "Mod+E" = { action = "spawn:nautilus"; repeat = false; };

    # Alt-Tab recent-windows override (config.kdl `recent-windows` block).
    # Best-effort: umbriel's window-focus-next/previous are not scoped to
    # the current output like niri's `scope="output"` was. The
    # filter="app-id" variants (Alt+grave / Alt+Shift+grave) have no
    # equivalent and were dropped -- see report.
    "Alt+Tab" = "window-focus-next";
    "Alt+Shift+Tab" = "window-focus-previous";
  };
}
