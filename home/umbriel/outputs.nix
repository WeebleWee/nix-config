{ ... }:

{
 programs.umbriel.settings.output = {
  "DVI-D-1" = {
    mode = "1920x1080@60";
    scale = 1.0;
    workspaces = [
      "Discord"
      "Code"
    ];
    position = [
      0
      0
    ];
  };

  "HDMI-A-1" = {
    mode = "1920x1080@60";
    scale = 1.0;
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
