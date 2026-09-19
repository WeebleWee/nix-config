{ ... }:

{
  programs.umbriel.settings = {
    layout = {
      mode = "scrolling";
      gap = 4;
      extent_presets = [
        0.333
        0.5
        0.667
      ];

      scrolling = {
        default_extent_fraction = 0.5;
        center_underfull_strip = false;
      };
    };

    workspace = [
      {
        name = "Code";
        layout.mode = "master";
        layout.master.position = "left";
        layout.master.default_width_fraction = 0.5;
      }
    ];
  };
}
