{ config, pkgs, inputs, ... }:

{
  #--------------- gtk and pc stuff---
  services.gvfs.enable = true; # trash, mtp, network mounts
  services.udisks2.enable = true; # removable media

  # --- OBS virtual camera -------------------------------------
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Virtual Camera" exclusive_caps=1
  '';

  # --------------------- Packages
  environment.systemPackages =
    (with pkgs; [
      git
      unzip
      usbutils
      pciutils
      gcc
      gnumake
      go
    ]);
}
