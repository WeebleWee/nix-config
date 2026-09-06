{ inputs, pkgs, config, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  
  programs.noctalia = {
    enable = true;
    package = null;
  };

  home.file.".config/noctalia/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/noctalia/config.toml";
}
