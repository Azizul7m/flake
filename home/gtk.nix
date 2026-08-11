{ config, pkgs, ... }: {
  gtk = with pkgs; {
    enable = true;
    gtk4.theme = config.gtk.theme;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Vimix Cursors";
      package = vimix-cursors;
      size = 16;
    };
    font = {
      package = roboto;
      name = "Roboto";
      size = 10;
    };
  };
}
