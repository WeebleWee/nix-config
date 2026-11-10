{ inputs, pkgs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
    ./terminal.nix
    ./desktop-entries.nix
    ./git.nix
    ./gitea-runner.nix
    ./ssh.nix
    ./theming.nix
    ./mimelist.nix
    ./monitoring.nix
    ./mpv.nix
    ./obs.nix
    ./noctalia
    ./umbriel
    ./umbriel-portal.nix
  ];

  home.username = "weeble";
  home.homeDirectory = "/home/weeble";

  # Set once, then never change it. Unrelated to system.stateVersion.
  home.stateVersion = "26.11";

  # -------------------------------------------------------- variables ---
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    SUDO_PROMPT = "This needs root priveleges. What's the magic word uwu? ";
    HISTORY_IGNORE = "(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.packages = with pkgs; [
    obsidian
    inputs.helium.packages.${pkgs.system}.default
    freetube
    rsync
    bun
    neovim
    ripgrep
    fd
    lazygit
    tree-sitter
    nodejs_22
    luajit
    tor-browser
    filezilla
    qbittorrent
    fastfetch
    vesktop
    vscodium
    newsflash
    ffmpeg
    exiftool
    nixfmt
    nixd
    kdePackages.kdenlive
    yt-dlp
    imagemagick
    tmux
    loupe
    plezy
    libreoffice
    desktop-file-utils
    inputs.cressida.packages.${pkgs.stdenv.hostPlatform.system}.default
    ente-auth
    tutanota-desktop
  ];

  programs.zen-browser.enable = true;

  programs.home-manager.enable = true;
}
