{ ... }:

{
  programs.niri.settings.layout = {
    focus-ring = {
      enable = false;
      width = 0;
    };
    
    gaps = 4;
    background-color = "transparent";

    border = {
      enable = true;
      width = 1.5;
    };

    shadow = {
      enable = true;
      draw-behind-window = false;
      softness = 1;
      spread = 1;
      offset = {
        x = 2;
        y = 2;
      };
    };

    preset-column-widths = [
      { proportion = 0.333; }
      { proportion = 0.5; }
      { proportion = 0.667; }
    ];
  };
}
