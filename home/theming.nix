{ config, pkgs, ... }:

{
  # ---------------------------------------------------------------- Qt ---
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

  qt.qt6ctSettings = {
    Appearance = {
      color_scheme_path = "${config.home.homeDirectory}/.config/qt6ct/colors/noctalia.conf";
      custom_palette = "true";
      icon_theme = "pixelitos-dark";
      standard_dialogs = "xdgdesktopportal";
      style = "Fusion";
    };

    Fonts = {
      fixed = "\"CozetteVector,12\"";
      general = "\"CozetteVector,12\"";
    };
  };

  # --------------------------------------------------------------- GTK ---
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme.name = "pixora-dark";

    font = {
      name = "CozetteVector";
      size = 12;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
 
  gtk.cursorTheme = {
    name = "retrosmart-xcursor-win-ish-violet-shadow";
    size = 32;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "retrosmart-xcursor-win-ish-violet-shadow";
    XCURSOR_SIZE = 32;
  };
}
