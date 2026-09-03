{ config, pkgs, ... }:

let
  home = config.home.homeDirectory;

  interface = ''
    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=0
    cursor_flash_time=1000
    dialog_buttons_have_icons=1
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=2
    menus_have_icons=true
    show_shortcuts_in_context_menus=true
    stylesheets=@Invalid()
    toolbutton_style=4
    underline_shortcut=1
    wheel_scroll_lines=3

    [Troubleshooting]
    force_raster_widgets=1
    ignored_applications=@Invalid()
  '';
in
{
  # ---------------------------------------------------------------- Qt ---
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=${home}/.config/qt5ct/colors/noctalia.conf
    custom_palette=true
    icon_theme=pixora-dark
    standard_dialogs=xdgdesktopportal
    style=Fusion

    [Fonts]
    fixed="CozetteVector,12,-1,5,57,0,0,0,0,0,Medium"
    general="CozetteVector,12,-1,5,57,0,0,0,0,0,Medium"

    ${interface}
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${home}/.config/qt6ct/colors/noctalia.conf
    custom_palette=true
    icon_theme=pixora-dark
    standard_dialogs=xdgdesktopportal
    style=Breeze

    [Fonts]
    fixed="CozetteVector,12,-1,5,500,0,0,0,0,0,0,0,0,0,0,1,Medium,0,0"
    general="CozetteVector,12,-1,5,500,0,0,0,0,0,0,0,0,0,0,1,Medium,0,0"

    ${interface}
  '';

  # --------------------------------------------------------------- GTK ---
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "pixora-dark";
      package = pkgs.pixora-icons;
    };

    font = {
      name = "CozetteVector";
      size = 12;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.retrosmart-cursor;
    name = "retrosmart-xcursor-win-ish-violet-shadow";
    size = 24;
  };
}
