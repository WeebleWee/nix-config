{ ... }:

{
  programs.niri.settings = {
    prefer-no-csd = true;

    input = {
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };

      keyboard.numlock = true;
    };

    cursor = {
      theme = "retrosmart-xcursor-win-ish-violet-shadow";
      size = 32;
    };

    debug.honor-xdg-activation-with-invalid-serial = true;

    hotkey-overlay.skip-at-startup = true;
  };
}
