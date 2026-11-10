{ pkgs, inputs, ... }:

{
  #--------------- gtk and pc stuff---
  services.gvfs.enable = true; # trash, mtp, network mounts
  services.udisks2.enable = true; # removable media

  # --- OBS virtual camera -------------------------------------
  # boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  # boot.kernelModules = [ "v4l2loopback" ];
  # boot.extraModprobeConfig = ''
  # options v4l2loopback devices=1 video_nr=1 card_label="OBS Virtual Camera" exclusive_caps=1
  # '';

  services.printing.enable = true;

  services.printing.drivers = [
    pkgs.hplip
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs =
        pkgs: with pkgs; [
          libgpg-error
          libgcrypt
          krb5
          fribidi
        ];
    };
  };

  # --------------------- Packages
  environment.systemPackages = (
    with pkgs;
    [
      git
      unzip
      usbutils
      pciutils
      gcc
      gnumake
      go
      python3
      file
      glib
      localsend
      inputs.yapfast.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
  );
}
