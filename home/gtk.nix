{ config, pkgs, ... }: {
  gtk = with pkgs; {
    enable = true;
    gtk4.theme = config.gtk.theme;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice"; # or "Bibata-Modern-Ice" for white/light
      size = 15;
      # name = "Vimix Cursors";
      # package = vimix-cursors;
      # size = 16;
    };
    font = {
      package = roboto;
      name = "Roboto";
      size = 10;
    };
  };
}
