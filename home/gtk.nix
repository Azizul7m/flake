{ config, pkgs, ... }: {
  gtk = with pkgs; {
    enable = true;
    gtk4.theme = config.gtk.theme;
    cursorTheme = {
      name = "Vimix Cursors";
      package = vimix-cursors;
      size = 16;
    };
    iconTheme = {
      name = "Vimix-dark";
      package = vimix-icon-theme;
    };
    font = {
      package = roboto;
      name = "Roboto";
      size = 10;
    };
  };
}
