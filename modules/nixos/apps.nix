{ config, pkgs, inputs, ... }:

{
  #--------------- gtk and pc stuff---
  services.gvfs.enable = true; # trash, mtp, network mounts
  services.udisks2.enable = true; # removable media
  # services.tumbler dropped: it's a Thunar-era leftover. libfm-qt (pcmanfm-qt's
  # backend) implements the GNOME thumbnailer spec itself, invoking
  # .thumbnailer executables directly - confirmed via its thumbnailer.cpp,
  # no tumbler/D-Bus reference anywhere in it.

  # --- OBS virtual camera -------------------------------------
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Virtual Camera" exclusive_caps=1
  '';

  # --------------------- Packages
  environment.systemPackages =
    (with pkgs; [
      gcc
      gnumake
      go
      python3
      wineWow64Packages.stable # swap for .waylandFull if you want native Wayland wine
      winetricks
    ]);
}
