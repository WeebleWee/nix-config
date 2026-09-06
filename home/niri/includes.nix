{ config, pkgs, lib, ... }:

let
  niriPkg = config.programs.niri.package;
  withIncludes = config.programs.niri.finalConfig + ''
    include optional=true "animations.kdl"
    include optional=true "noctalia.kdl"
  '';
in
{
  xdg.configFile.niri-config = lib.mkForce {
    target = "niri/config.kdl";
    force = true;
    source =
      pkgs.runCommand "config.kdl"
        {
          config = withIncludes;
          passAsFile = [ "config" ];
          buildInputs = [ niriPkg ];
        }
        ''
          niri validate -c $configPath
          cp $configPath $out
        '';
  };
}
