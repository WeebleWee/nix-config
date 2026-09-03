{ config, pkgs, ... }:

{
  programs.eilmeldung = {
    enable = true;
    settings = {
      article_scope = "all";
      default_sort_order = "<date";

      feed_list = [
        "query: \"This Week\" newer:\"-1 week\""
        "feeds"
        "* tags"
      ];

      mouse_support = true;
      notify_after_sync = true;

      notify_after_sync_cmd = "notify-send \"{summary}\" \"{body}\"";

      theme = {
        border_theme = {
          framing = "connected";
          focused = "rounded";
          unfocused = "rounded";
        };
      };

    };
  };

}
