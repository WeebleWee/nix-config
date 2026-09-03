{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
  };

  environment.systemPackages = [
    pkgs.eden
    pkgs.mgba
   ];
}
