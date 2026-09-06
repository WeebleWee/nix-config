{ ... }:

{
  programs.niri.settings.window-rules = [
    {
      matches = [
        { app-id = "^io\\.github\\.niri\\.screenshare\\.picker$"; }
        { app-id = "^niri-screenshare-picker$"; }
        { title = "^Screen Sharing$"; }
        ];
      open-floating = true;
      default-column-width.fixed = 800;
      default-window-height.fixed = 600;
    }

    {
      matches = [
        { app-id = "zen|mpv|freetube|newsflash|vscodium|vesktop|eden|ffrunner\\.exe|solitaire\\.exe|obsidian"; }
      ];
      open-maximized = true;
    }

    {
      matches = [
        {
          app-id = "com\\.mitchellh\\.ghostty";
          title = "nvim|btop";
        }
      ];
      open-maximized = true;
    }

    {
      matches = [ { app-id = "^vesktop$"; } ];
      open-on-output = "DVI-D-1";
    }

    {
      matches = [ { app-id = "xdg-desktop-portal-gtk"; } ];
      open-floating = true;
      default-column-width.fixed = 800;
      default-window-height.fixed = 600;
    }
  ];
}
