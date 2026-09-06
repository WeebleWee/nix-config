{ ... }:

{
  programs.umbriel.settings.input = {
    middle_click_paste = true;

    focus = {
      follows_mouse = true;
      follows_mouse_max_scroll = 0.0;
    };

    keyboard.numlock_toggle = true;

    cursor = {
      theme = "retrosmart-xcursor-win-ish-violet-shadow";
      size = 32;
      hardware_cursor = true;
    };

  };
}
