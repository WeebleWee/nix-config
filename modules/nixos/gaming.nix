{ inputs, pkgs, ... }:

{

  imports = [ inputs.play-nix.nixosModules.play ];

  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  play.switch2Controllers = {
    enable = true;
    user = "weeble";
  };

  environment.systemPackages = [
    pkgs.mangohud
    pkgs.fuse-overlayfs
    pkgs.wineWow64Packages.waylandFull
    pkgs.winetricks
    pkgs.protonup-qt
    pkgs.vulkan-tools
   ];
}
