{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  # ------------------------------------------------------- Noctalia v5 ---
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
    inputs.umbriel.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # ---------------------------------------------------------- Umbriel ---
  programs.umbriel.enable = true;

  # niri as a second session alongside Umbriel.
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    papirus-icon-theme
    pixora-icons
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.kio-fuse
    adwaita-icon-theme
    kdePackages.qt6ct
    brightnessctl
    playerctl
    libnotify
    grim
    slurp
    glib
    kdePackages.ffmpegthumbs
    kdePackages.ark
  ];

  # ------------------------------------------------------------ login ---
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "";

    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        path = "${pkgs.adwaita-icon-theme}/share/icons";
      };

      session.default = "Umbriel";
    };
  };

  # ---------------------------------------------------------- session ---
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.dconf.enable = true; # GTK app settings

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    GTK_USE_PORTAL = "1";
  };
}
