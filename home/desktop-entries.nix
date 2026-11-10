{ ... }:

{
  xdg.desktopEntries = {
    fusionfall = {
      name = "Fusion Fall";
      comment = "OpenFusion Launcher";
      exec = "steam-run /home/weeble/Games/FusionFall/OpenFusionLauncher.AppImage";
      settings.Path = "/home/weeble/Games/FusionFall";
      icon = "alienarena";
      terminal = false;
      type = "Application";
      categories = [ "Game" ];
      startupNotify = false;
    };

    scrivener = {
      name = "Scrivener 3";
      exec = "env WINEPREFIX=/home/weeble/.wine-scriv wine /home/weeble/.wine-scriv/drive_c/Scrivener3/Scrivener.exe";
      settings.Path = "/home/weeble/.wine-scriv/drive_c/Scrivener3";
      terminal = false;
      type = "Application";
      categories = [ "Office" ];
      icon = "accessories-notes";
      startupNotify = false;
    };
  };
}
