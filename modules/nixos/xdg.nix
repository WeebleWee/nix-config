{ config, pkgs, inputs, ... }:

let
  strata = inputs.strata.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  environment.systemPackages = [ strata ];
  # ---------------------------------------------------------- portals ---
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      strata.fileChooserPortal
    ];

    config.umbriel = {
      default = [
        "umbriel"
        "gtk"
      ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "umbriel" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "strata" ];
    };
  };

  services.dbus.packages = [ strata.fileManagerService ];
  xdg.mime.defaultApplications."inode/directory" = "io.github.lgse.Strata.desktop";

  systemd.user.services.xdg-desktop-portal-umbriel.restartTriggers = [
    config.programs.umbriel.portalPackage
  ];
}
