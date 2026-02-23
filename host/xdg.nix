{ pkgs, ... }: {
  xdg = {
    enable = true;
    sounds.enable = true;
    force = true;
    portal = {
      enable = true;
      extraPortals = [ "xdg-desktop-portal-gtk" ];
    };
    wlr.enable = true;
    menu.enable = true;
    icon.enable = true;
    autoStart.enable = true;
    mime = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "sioyek.desktop" "firefox.desktop" ];
        "image/png" = [ "sxiv.desktop" "gimp.desktop" ];
      };
    };
  };
}
