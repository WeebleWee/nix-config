{ ... }:

{

  programs.umbriel.settings.include.files = [ "/home/weeble/.config/umbriel/noctalia.toml" ];

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

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Umbriel";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Umbriel";
  };
}
