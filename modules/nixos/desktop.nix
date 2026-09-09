{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
    inputs.umbriel.nixosModules.default
    inputs.niri.nixosModules.niri
  ];

  # ------------------------------------------------------- Noctalia v5 ---

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # ---------------------------------------------------------- Umbriel ---
  programs.umbriel.enable = true;

  # ---------------------------------------------------------- Niri ---
  niri-flake.cache.enable = true;

  programs.niri.enable = true;

  programs.niri.package = pkgs.niri;

  # Noctalia provides polkit
  systemd.user.services.niri-flake-polkit.enable = false;

  # ---------------------------------------------------------- Relevant packages ---

  environment.systemPackages = with pkgs; [
    wl-clipboard
    papirus-icon-theme
    adwaita-icon-theme
    qt6Packages.qt6ct
    brightnessctl
    playerctl
    libnotify
    grim
    slurp
    glib
    xarchiver
    xwayland-satellite
    gpu-screen-recorder
    bc
    hyprpicker
  ];

  # ------------------------------------------------------------ login ---
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "";

    settings = {
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
