{ pkgs, ... }:

{
  programs.umbriel.settings.general.autostart = [
    "noctalia"
    "sleep 4; ${pkgs.vesktop}/bin/vesktop"
    "sleep 4; sh -c '${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.wl-clipboard}/bin/wl-copy --primary'"
    "sleep 4; ${pkgs.newsflash}/bin/io.gitlab.news_flash.NewsFlash"
  ];
}
