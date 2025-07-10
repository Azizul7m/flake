{ pkgs, ... }: {
  xdg = {
    enable = true;
    userDirs.enable = true;
    mime.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" =
        [ "sioyek.desktop" "evince.desktop" "firefox.desktop" ];
      "image/png" = [ "sxiv.desktop" ];
    };
  };
}
