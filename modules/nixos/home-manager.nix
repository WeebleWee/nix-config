{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;

    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    backupFileExtension = "hm-bak";

    users.weeble = import ../../home;
  };
}
