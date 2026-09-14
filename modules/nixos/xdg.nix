{ config, pkgs, ... }:

{
  # ---------------------------------------------------------- portals ---
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    config.umbriel = {
      default = [
        "umbriel"
        "gtk"
      ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "umbriel" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  systemd.user.services.xdg-desktop-portal-umbriel.restartTriggers = [
    config.programs.umbriel.portalPackage
  ];
}
