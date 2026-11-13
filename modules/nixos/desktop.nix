{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
    inputs.umbriel.nixosModules.default
    inputs.rummage.nixosModules.default
  ];

  # ------------------------------------------------------- Noctalia v5 ---

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # ---------------------------------------------------------- Umbriel ---
  programs.umbriel.enable = true;

  # ---------------------------------------------------------- Relevant packages ---

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
    qt6Packages.qt6ct
    brightnessctl
    playerctl
    libnotify
    grim
    slurp
    glib
    gpu-screen-recorder
    bc
    hyprpicker
    desktop-file-utils
    inputs.rummage.packages.${pkgs.stdenv.hostPlatform.system}.rummage-with-media
  ];

  # ---------------------------------------------------------- Rummage ---
  programs.rummage.enable = true;

  programs.rummage.filePicker.enable = true;

  services.gvfs.enable = true; # trash, mtp, network mounts
  services.udisks2.enable = true; # removable media
  # ------------------------------------------------------------ login ---
  services.displayManager.noctalia-greeter = {
    enable = true;

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
