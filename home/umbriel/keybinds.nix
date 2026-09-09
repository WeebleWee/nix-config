{ pkgs, lib, ... }:

let
  ghostty = "${pkgs.ghostty}/bin/ghostty";
  dolphin = "${pkgs.kdePackages.dolphin}/bin/dolphin";
  newsflash = "${pkgs.newsflash}/bin/newsflash";
in
{
  programs.umbriel.settings.keybinds = {
    # ─── Basics ──────────────────────────────────────────────────────────
    "Mod+Q" = "window-close";
    "Mod+M" = "window-toggle-maximize";
    "Mod+G" = "window-toggle-maximize-to-edges";
    "Mod+Shift+F" = "window-toggle-fullscreen";

    "Print" = {
      action = "spawn:noctalia msg screenshot-region";
      repeat = false;
    };

    "Mod+Print" = {
      action = "spawn:noctalia msg screenshot-fullscreen";
      repeat = false;
    };

    # ─── Navigation: keyboard ────────────────────────────────────────────
    "Mod+Up" = "workspace-previous";
    "Mod+Down" = "workspace-next";
    "Mod+Left" = "window-focus-left";
    "Mod+Right" = "window-focus-right";

    "Mod+Prior" = "workspace-previous";
    "Mod+Next" = "workspace-next";

    "Mod+Shift+Up" = "window-move-to-output-right";
    "Mod+Shift+Down" = "window-move-to-output-left";
    "Mod+Alt+Up" = "column-move-left";
    "Mod+Alt+Down" = "column-move-right";

    "Mod+Tab" = "window-focus-next";
    "Mod+I" = "overview-toggle";

    # ─── Navigation: mouse ───────────────────────────────────────────────
    "Mod+WheelDown" = "window-focus-right";
    "Mod+WheelUp" = "window-focus-left";

    # ─── Apps ────────────────────────────────────────────────────────────
    "Mod+Return" = {
      action = "spawn:${ghostty}";
      repeat = false;
    };

    "Mod+F" = {
      action = "spawn:${dolphin}";
      repeat = false;
    };

    "Mod+A" = {
      action = "spawn:noctalia msg panel-toggle yuuto/calculator:panel";
      repeat = false;
    };

    "Mod+R" = {
      action = "spawn:${newsflash}";
      repeat = false;
    };

    # ─── Noctalia core ───────────────────────────────────────────────────
    "Mod" = {
      action = "spawn:noctalia msg panel-toggle launcher";
      repeat = false;
    };
    "Mod+C" = {
      action = "spawn:noctalia msg panel-toggle control-center";
      repeat = false;
    };
    "Mod+Shift+R" = {
      action = "spawn:noctalia msg config-reload";
      repeat = false;
    };
    "Mod+S" = {
      action = "spawn:noctalia msg settings-toggle";
      repeat = false;
    };
    "Mod+Menu" = {
      action = "spawn:noctalia msg panel-toggle wallpaper";
      repeat = false;
    };
    "Ctrl+Alt+Delete" = {
      action = "spawn:noctalia msg panel-toggle session";
      repeat = false;
    };

    # ─── Audio ───────────────────────────────────────────────────────────
    "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up";
    "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down";
    "XF86AudioMute" = {
      action = "spawn:noctalia msg volume-mute";
      repeat = false;
    };

    # ─── Media ───────────────────────────────────────────────────────────
    "F5" = {
      action = "spawn:noctalia msg media stop";
      repeat = false;
    };
    "F6" = {
      action = "spawn:noctalia msg media previous";
      repeat = false;
    };
    "F7" = {
      action = "spawn:noctalia msg media toggle";
      repeat = false;
    };
    "F8" = {
      action = "spawn:noctalia msg media next";
      repeat = false;
    };

    # ─── Plugins ─────────────────────────────────────────────────────────
    "Mod+T" = {
      action = "spawn:noctalia msg panel-toggle thepunkoff/pomodoro:panel";
      repeat = false;
    };
    "Mod+N" = {
      action = "spawn:noctalia msg panel-toggle noctalia/notes:panel";
      repeat = false;
    };
    "Mod+L" = {
      action = "spawn:noctalia msg panel-toggle nightwatch75/todo:panel";
      repeat = false;
    };
    "Mod+Shift+Menu" = {
      action = "spawn:noctalia msg panel-toggle noctalia/wallhaven:browser";
      repeat = false;
    };

    # ─── Clipboard / misc ────────────────────────────────────────────────
    "Mod+Shift+V" = {
      action = "spawn:noctalia msg panel-toggle clipboard";
      repeat = false;
    };

    # ─── Scratchpad ──────────────────────────────────────────────────────

    "Mod+D" = "scratchpad-toggle";
    "Mod+Shift+D" = "window-move-to-scratchpad";
    "Mod+Alt+D" = {
      action = "window-restore-from-scratchpad";
      repeat = false;
    };
    "Mod+Ctrl+D" = "scratchpad-focus-next";

    "Mod+9" = "scratchpad-toggle:DVI-D-1";
    "Mod+0" = "scratchpad-toggle:HDMI-A-1";
    "Mod+Shift+9" = "window-move-to-scratchpad:DVI-D-1";
    "Mod+Shift+0" = "window-move-to-scratchpad:HDMI-A-1";
  };
}
