{
  description = "VioletFlake: A Purple Pixelated Wayland Desktop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    rummage.url = "github:barrulus/rummage";

    umbriel.url = "github:noctalia-dev/umbriel/cachix";

    cressida = {
      url = "github:Ly-sec/Cressida";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations.VioletFlake = nixpkgs.lib.nixosSystem {
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
