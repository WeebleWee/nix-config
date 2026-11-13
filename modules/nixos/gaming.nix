{ inputs, pkgs, ... }:

{

  #nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  programs.steam = {
    enable = true;
    #package = pkgs.millennium-steam;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = [
    pkgs.mangohud
    pkgs.fuse-overlayfs
    pkgs.wineWow64Packages.staging
    pkgs.winetricks
    pkgs.protonup-qt
    pkgs.vulkan-tools
   ];
}
