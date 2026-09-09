{ inputs, ... }:

{
  imports = [
    inputs.umbriel.homeModules.default
    ./auto.nix
    ./input.nix
    ./keybinds.nix
    ./layout.nix
    ./outputs.nix
    ./rules.nix
    ./settings.nix
  ];

  programs.umbriel.enable = true;

}
