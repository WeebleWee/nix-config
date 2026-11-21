{  pkgs, ... }:

{

  imports = [./hardware-configuration.nix];

  # ---------------------------------------------------------------- boot ---
# UEFI
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    theme = ../../assets/hyperfluent;
    useOSProber = true;
    configurationLimit = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.supportedFilesystems = [ "ntfs" ];

  # ----------------------------------------------------------------- nix ---
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://umbriel.cachix.org"
      "https://rummage-fm.cachix.org"
      ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
      "rummage-fm.cachix.org-1:fhPhaCttVfPBS/i//+Z+6Ch0xdxj9g94eZdQ5m6mlwA="
    ];

  };

  nixpkgs.hostPlatform = "x86_64-linux";

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      curl
      icu
      libxml2
    ];
  };

  services.xserver.videoDrivers = ["amdgpu"];

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

  services.udev.packages = [ pkgs.game-devices-udev-rules ];

  # Set once at install time and then leave alone forever.
  system.stateVersion = "26.05";
}
