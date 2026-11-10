{ ... }:
let
  browser = "zen-beta.desktop";
  editor  = "codium.desktop";
  viewer  = "org.gnome.Loupe.desktop";
in
{
  xdg.mimeApps = {
    enable = true;

    associations.added = {
      "application/x-trash"        = editor;
      "application/x-zerosize"     = editor;
      "application/json"           = editor;
      "image/gif"                  = viewer;
      "image/png"                  = viewer;
      "text/plain"                 = editor;
      "text/x-csrc"                = editor;
      "text/x-log"                 = editor;
      "x-scheme-handler/chrome"    = browser;
      "x-scheme-handler/http"      = browser;
      "x-scheme-handler/https"     = browser;
    };

    defaultApplications = {
      "application/x-extension-htm"    = browser;
      "application/x-extension-html"   = browser;
      "application/x-extension-shtml"  = browser;
      "application/x-extension-xht"    = browser;
      "application/x-extension-xhtml"  = browser;
      "application/xhtml+xml"          = browser;
      "text/html"                      = browser;

      "application/x-zerosize"         = editor;
      "text/plain"                     = editor;
      "text/x-csrc"                    = editor;
      "text/x-log"                     = editor;

      "image/gif"                      = viewer;
      "image/png"                      = viewer;

      "x-scheme-handler/chrome"        = browser;
      "x-scheme-handler/http"          = browser;
      "x-scheme-handler/https"         = browser;
      "x-scheme-handler/discord"       = "vesktop.desktop";
      "x-scheme-handler/freetube"      = "freetube.desktop";
      "x-scheme-handler/ofl"           = "openfusionlauncher-handler.desktop";
      "x-scheme-handler/tuta"          = "tutanota-desktop.desktop";
      "x-scheme-handler/mailto"        = "tutanota-desktop.desktop";
    };
  };
}
