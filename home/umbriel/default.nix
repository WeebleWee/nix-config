{ inputs, ... }:

{
  imports = [
    inputs.umbriel.homeModules.default
    ./keybinds.nix
    ./rules.nix
  ];

  programs.umbriel.enable = true;

  # --- Autostart

  programs.umbriel.settings.general.autostart = [
    "noctalia"
    "sleep 4; vesktop"
    "sleep 4; io.gitlab.news_flash.NewsFlash"
  ];

  # --- Inputs

  programs.umbriel.settings.input = {
    middle_click_paste = true;
    client_window_drag = false;

    focus = {
      follows_mouse = true;
      follows_mouse_max_scroll = 0.0;
    };

    keyboard.numlock_toggle = true;

    cursor = {
      theme = "retrosmart-xcursor-win-ish-violet-shadow";
      size = 32;
      hardware_cursor = true;
    };

  };

  # --- Layouts

  programs.umbriel.settings = {
    layout = {
      mode = "scrolling";
      gap = 4;
      extent_presets = [
        0.333
        0.5
        0.667
      ];

      scrolling = {
        default_extent_fraction = 0.5;
        center_underfull_strip = false;
      };
    };

    workspace = [
      {
        name = "Code";
        layout.mode = "master";
        layout.master.position = "left";
        layout.master.default_width_fraction = 0.666;
      }
    ];
  };

  # --- Other Settings

  programs.umbriel.settings.include.files = [
    "/home/weeble/.config/umbriel/noctalia.toml"
    "/home/weeble/.config/umbriel/animations.toml"
  ];

  programs.umbriel.settings = {

    general.show_cheatsheet = false;
    general.focus_on_activate = true;
    general.xwayland = true;
    general.mod_key = "Super";

    appearance = {
      prefer_no_csd = true;
      corner_radius = 2;
      border_width = 1;
      outer_border_width = 0;

      shadow = {
        enabled = true;
        softness = 1;
        offset_x = 2;
        offset_y = 2;
      };

    };

  };

  # --- Outputs

  programs.umbriel.settings.output = {
  "HDMI-A-1" = {
    mode = "1920x1080@120";
    scale = 1.0;
    vrr = "disabled";
    workspaces = [
      "Discord"
      "Code"
    ];
    position = [
      0
      0
    ];
  };

  "DP-3" = {
    mode = "1920x1080@240";
    scale = 1.0;
    vrr = "fullscreen";
    hdr = "auto";
    sdr_white = 203;
     workspaces = [
      "Web"
      "Gaming"
    ];
    position = [
      1920
      0
    ];
  };
 };

}
