{ ... }:

{
  programs.niri.settings.layout = {
    gaps = 4;
    background-color = "transparent";

    preset-column-widths = [
      { proportion = 0.333; }
      { proportion = 0.5; }
      { proportion = 0.667; }
    ];
  };
}
