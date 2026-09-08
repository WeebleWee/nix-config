{
  config,
  pkgs,
  ...
}:

let
  inherit (config.lib.niri.actions) spawn;
  ghostty = "${pkgs.ghostty}/bin/ghostty";
  pcmanfm = "${pkgs.lxqt.pcmanfm-qt}/bin/pcmanfm-qt";
  newsflash = "${pkgs.newflash}/bin/newsflash";
in
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # ─── Basics ──────────────────────────────────────────────────────────
    "Mod+Q".action = close-window;
    "Mod+M".action = maximize-column;
    "Mod+G".action = expand-column-to-available-width;
    "Mod+Shift+F".action = fullscreen-window;

    "Print" = {
      action = spawn "noctalia" "msg" "screenshot-region";
      repeat = false;
    };
    "Mod+Print" = {
      action = spawn "noctalia" "msg" "screenshot-fullscreen";
      repeat = false;
    };

    # ─── Navigation: keyboard ────────────────────────────────────────────
    "Mod+Up".action = focus-workspace-up;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Left".action = focus-column-or-monitor-left;
    "Mod+Right".action = focus-column-or-monitor-right;

    "Mod+Prior".action = focus-workspace-up;
    "Mod+Next".action = focus-workspace-down;

    "Mod+Shift+Up".action = move-window-to-monitor-right;
    "Mod+Shift+Down".action = move-window-to-monitor-left;
    "Mod+Alt+Up".action = move-column-left;
    "Mod+Alt+Down".action = move-column-right;

    "Mod+Tab".action = switch-focus-between-floating-and-tiling;
    "Mod+I".action = toggle-overview;

    # ─── Navigation: mouse ───────────────────────────────────────────────
    "Mod+WheelScrollDown" = {
      action = focus-column-right;
      cooldown-ms = 50;
    };
    "Mod+WheelScrollUp" = {
      action = focus-column-left;
      cooldown-ms = 50;
    };

    # ─── Apps ────────────────────────────────────────────────────────────
    "Mod+Return" = {
      action = spawn ghostty;
      repeat = false;
    };
    "Mod+F" = {
      action = spawn pcmanfm;
      repeat = false;
    };
    "Mod+A" = {
      action = spawn "noctalia" "msg" "panel-toggle" "yuuto/calculator:panel";
      repeat = false;
    };
    "Mod+R" = {
      action = spawn newsflash;
      repeat = false;
    }

    # ─── Noctalia core ───────────────────────────────────────────────────
    "Mod" = {
      action = spawn "noctalia" "msg" "panel-toggle" "launcher";
      repeat = false;
    };
    "Mod+C" = {
      action = spawn "noctalia" "msg" "panel-toggle" "control-center";
      repeat = false;
    };
    "Mod+Shift+R" = {
      action = spawn "noctalia" "msg" "config-reload";
      repeat = false;
    };
    "Mod+S" = {
      action = spawn "noctalia" "msg" "settings-toggle";
      repeat = false;
    };
    "Mod+Menu" = {
      action = spawn "noctalia" "msg" "panel-toggle" "wallpaper";
      repeat = false;
    };
    "Ctrl+Alt+Delete" = {
      action = spawn "noctalia" "msg" "panel-toggle" "session";
      repeat = false;
    };

    # ─── Audio ───────────────────────────────────────────────────────────
    "XF86AudioRaiseVolume" = {
      action = spawn "noctalia" "msg" "volume-up";
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action = spawn "noctalia" "msg" "volume-down";
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action = spawn "noctalia" "msg" "volume-mute";
      repeat = false;
      allow-when-locked = true;
    };

    # ─── Media ───────────────────────────────────────────────────────────
    "F5" = {
      action = spawn "noctalia" "msg" "media" "stop";
      repeat = false;
    };
    "F6" = {
      action = spawn "noctalia" "msg" "media" "previous";
      repeat = false;
    };
    "F7" = {
      action = spawn "noctalia" "msg" "media" "toggle";
      repeat = false;
    };
    "F8" = {
      action = spawn "noctalia" "msg" "media" "next";
      repeat = false;
    };

    # ─── Plugins ─────────────────────────────────────────────────────────
    "Mod+T" = {
      action = spawn "noctalia" "msg" "panel-toggle" "thepunkoff/pomodoro:panel";
      repeat = false;
    };
    "Mod+N" = {
      action = spawn "noctalia" "msg" "panel-toggle" "noctalia/notes:panel";
      repeat = false;
    };
    "Mod+L" = {
      action = spawn "noctalia" "msg" "panel-toggle" "nightwatch75/todo:panel";
      repeat = false;
    };
    "Mod+Shift+Menu" = {
      action = spawn "noctalia" "msg" "panel-toggle" "noctalia/wallhaven:browser";
      repeat = false;
    };
    "Mod+R" = {
      action = spawn "noctalia" "msg" "panel-toggle" "nilsonlinux/rss-notifier:list" "text";
      repeat = false;
    };

    # ─── Clipboard ───────────────────────────────────────────────────────
    "Mod+Shift+V" = {
      action = spawn "noctalia" "msg" "panel-toggle" "clipboard";
      repeat = false;
    };

  };
}
