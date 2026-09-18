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

  play.procon2.enable = true;

  environment.systemPackages = [
    pkgs.eden
    pkgs.mgba
    pkgs.mangohud
    pkgs.bubblewrap
    pkgs.fuse-overlayfs
    pkgs.wineWow64Packages.waylandFull
    pkgs.winetricks
    pkgs.protonup-qt
   ];
}
