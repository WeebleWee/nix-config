{ ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/weeble/nix";
    clean = {
      enable = true;
      dates = "saturday";
      extraArgs = "--keep 5 --keep-since 7d";
    };
  };

  nix.gc.automatic = false;
}
