{ ... }:

{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        ServerAliveInterval = 60;
      };

      "91.250.249.43" = {
        IdentityFile = "~/.ssh/weeblekey";
        AddKeysToAgent = "yes";
      };

      "192.168.4.25" = {
        SetEnv = { TERM = "xterm-256color"; };
      };

      "ssh.nyc1.nearlyfreespeech.net" = {
        IdentityFile = "~/.ssh/weebleism";
        SetEnv = { TERM = "xterm-256color"; };
      };

      "gitea.com" = {
        User = "git";
        IdentityFile = "~/.ssh/gitea";
        IdentitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
