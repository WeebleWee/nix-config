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
  
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.supportedFilesystems = [ "ntfs" ];

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

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;

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

  # Set once at install time and then leave alone forever.
  system.stateVersion = "26.05";
}
