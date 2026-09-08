{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true; 

  environment.systemPackages = [
    pkgs.eden
    pkgs.mgba
    pkgs.mangohud
   ];
}
