{ pkgs, ... }:

{
  users.groups.weeble = { };

  users.users.weeble = {
    isNormalUser = true;
    description = "Weeble";
    group = "weeble";
    home = "/home/weeble";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
