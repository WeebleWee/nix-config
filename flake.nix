{
  description = "VioletFlake: Umbriel + Noctalia v5";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # No `follows` here: overriding inputs changes the derivation hash and
    # you lose the noctalia.cachix.org binary cache.
    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel.url = "git+https://github.com/noctalia-dev/umbriel";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations.VioletFlake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/VioletFlake
          ./modules/nixos/desktop.nix
          ./modules/nixos/xdg.nix
          ./modules/nixos/fonts.nix
          ./modules/nixos/gaming.nix
          ./modules/nixos/networking-firewall.nix
          ./modules/nixos/users.nix
          ./modules/nixos/mullvad.nix
          ./modules/nixos/maintenance.nix
          ./modules/nixos/apps.nix
          ./modules/nixos/home-manager.nix
        ];
      };
    };
}
