{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Weeble";
        email = "weeble69@protonmail.com"; # change me
      };

      init.defaultBranch = "main";
      pull.rebase = true;

      safe.directory = "/home/weeble/nix";
    };
  };
}
