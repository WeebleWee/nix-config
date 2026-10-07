{ ... }:

{
 programs.umbriel.settings.output = {
  "HDMI-A-1" = {
    mode = "1920x1080@120";
    scale = 1.0;
    vrr = "disabled";
    workspaces = [
      "Discord"
      "Code"
    ];
    position = [
      0
      0
    ];
  };

  "DP-3" = {
    mode = "1920x1080@240";
    scale = 1.0;
    vrr = "fullscreen";
    hdr = "auto";
    sdr_white = 203;
     workspaces = [
      "Web"
      "Gaming"
    ];
    position = [
      1920
      0
    ];
  };
 };
}
