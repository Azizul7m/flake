{ pkgs, ... }: {
  xdg = {
    enable = true;
    userDirs.enable = true;
    mime.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" = [ "sioyek.desktop" "zen.desktop" "firefox.desktop" ];
      "image/png" = [ "sxiv.desktop" ];
      # Set the default browser for web content
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "inode/directory" = "nautilus.desktop";
    };
  };
}
