{ config, pkgs, lib, ... }:

let
  runnerDir = "${config.home.homeDirectory}/.local/share/gitea-runner";

  jobPath = lib.makeBinPath (with pkgs; [
    bash
    coreutils
    findutils
    gnugrep
    gnused
    gnutar
    gzip
    git
    curl
    wget
    openssh
    rsync
    nodejs_22
    bun
  ]);
in
{
  home.packages = [ pkgs.gitea-actions-runner ];

  systemd.user.services.gitea-runner = {
    Unit = {
      Description = "Gitea Actions runner (user)";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      WorkingDirectory = runnerDir;
      ExecStart = "${pkgs.gitea-actions-runner}/bin/act_runner daemon";
      Restart = "always";
      RestartSec = 10;
      Environment = [ "PATH=${jobPath}" ];
    };

    Install.WantedBy = [ "default.target" ];
  };
}
