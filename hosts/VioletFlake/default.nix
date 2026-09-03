{ config, pkgs, ... }:

{

  imports = [./hardware-configuration.nix];

  # ---------------------------------------------------------------- boot ---
# UEFI
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
    configurationLimit = 10;
  };
  # Not in nixpkgs; sourced straight from pkgs/*.nix. Overlaying rather than
  # calling callPackage at each use site so home/gtk.nix and the greeter's
  # cursor block (both need retrosmart-cursor) and any Qt-side consumer of
  # pixora-icons can all just reach them as pkgs.retrosmart-cursor /
  # pkgs.pixora-icons.
  nixpkgs.overlays = [
    (final: prev: {
      retrosmart-cursor = final.callPackage ../../pkgs/retrosmart-cursor.nix { };
      pixora-icons = final.callPackage ../../pkgs/pixora-icons.nix { };
    })
  ];

  # ----------------------------------------------------------------- nix ---
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Noctalia's prebuilt binaries. Without this you compile the shell locally.
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  # Obsidian and a few others are unfree. Keep this narrow rather than
  # setting allowUnfree = true globally.
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "obsidian"
    ];

  # -------------------------------------------------------------- system ---
  networking.hostName = "VioletFlake";

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  # --------------------------------------------------------------- audio ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # ---------------------------------------------------------------- user ---
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    unzip
    p7zip
    file
    tree
    htop
    usbutils
    pciutils
  ];

  programs.nix-ld.enable = true;

  # Set once at install time and then leave alone forever.
  system.stateVersion = "26.05";
}
