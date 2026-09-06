{ ... }:

{
  programs.umbriel.settings.window_rule = [
    {
      match.app_id = "^dev\\.noctalia\\.UmbrielSharePicker$";
      default_floating = true;
      default_size = [
        800
        600
      ];
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
      match.app_id = "xdg-desktop-portal-gtk";
      default_floating = true;
      default_size = [
        800
        600
      ];
    }
  ];
}
