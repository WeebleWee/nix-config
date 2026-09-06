{ config, lib, inputs, pkgs, ... }:

let
  niriScreenshare = inputs.niri-screenshare.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  # ---------------------------------------------------------- portals ---
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      niriScreenshare
    ];

    config.umbriel = {
      default = [
        "umbriel"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };

    config.niri = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "niri" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      "org.freedesktop.impl.portal.Access" = [ "gtk" ];
    };
  };

  systemd.user.services.niri-screenshare = {
    path = [ config.programs.niri.package ];
    environment.NIRI_SCREENSHARE_PICKER = "1";
    wantedBy = lib.mkForce [ "niri.service" ];
  };
}
