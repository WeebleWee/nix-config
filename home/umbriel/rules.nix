{ ... }:

{
  programs.umbriel.settings.window_rule = [
    {
      match.is_floating = true;
      opacity = 0.95;
    }

    {
      match.app_id = "zen|mpv|freetube|newsflash|vscodium|vesktop|eden|ffrunner\\.exe|solitaire\\.exe|obsidian";
      default_maximize = true;
    }

    {
      match.app_id = "com\\.mitchellh\\.ghostty";
      match.title = "nvim|btop";
      default_maximize = true;
    }

    {
      match.app_id = "^vesktop$";
      default_output = "DVI-D-1";
    }

    {
      match.app_id = "^(xdg-desktop-portal|dev\\.noctalia\\.UmbrielSharePicker)$";
      default_floating = true;
      default_floating_size_px = {
        width = 800;
        height = 600;
      };
    }

    {
      match.app_id = "^dev\\.noctalia\\.Noctalia$";
      default_floating = true;
      default_floating_size_px = {
        width = 1020;
        height = 900;
      };
    }

    {
      match.title = "^notificationtoasts_.+_desktop";
      default_focused = false;
      default_pinned = true;
      default_position = {
        x = 0;
        y = 0;
        anchor = "bottom_right";
      };
    }

    {
      match.title = "^(Open File|Select|Choose a wallpaper|Open Folder|Save As|Library|Choose Where to Download|File Operation Progress|Rename|Copy Files|Move Files|Search Files|File Upload)$";
      default_floating = true;
      default_floating_size_px = {
        width = 800;
        height = 600;
      };
    }
  ];
}
