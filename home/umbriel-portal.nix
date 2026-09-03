{ osConfig, ... }:

{
  xdg.configFile."xdg-desktop-portal-umbriel/config.toml".text = ''
    [screencast]
    chooser_cmd = "${osConfig.programs.umbriel.portalPackage}/libexec/umbriel-share-picker"
    max_fps = 0

    [screenshot]
    cmd = ""
    color_pick_cmd = ""
  '';
}
