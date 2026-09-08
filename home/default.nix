{ inputs, pkgs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
    ./terminal.nix
    ./git.nix
    ./gitea-runner.nix
    ./ssh.nix
    ./theming.nix
    ./monitoring.nix
    ./mpv.nix
    ./obs.nix
    ./noctalia
    ./umbriel
    ./niri
  ];

  home.username = "weeble";
  home.homeDirectory = "/home/weeble";

  # Set once, then never change it. Unrelated to system.stateVersion.
  home.stateVersion = "26.11";

  # -------------------------------------------------------- variables ---
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BAT_THEME = "base16";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    SUDO_PROMPT = "This needs root priveleges. What's the magic word uwu? ";
    HISTORY_IGNORE = "(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)";
    STEAM_EXTA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.packages = with pkgs; [
    obsidian
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
    lxqt.lximage-qt
    tor-browser
    mullvad-browser
    telegram-desktop
    filezilla
    qbittorrent
    libreoffice-stable
    jan
    fastfetch
    vesktop
    vscodium
    newsflash
    ffmpeg
    exiftool
    nixfmt-rfc-style
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.ffmpegthumbs
    protonup-ng
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  programs.home-manager.enable = true;
}
