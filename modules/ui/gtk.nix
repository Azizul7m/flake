{ pkgs, ... }: {
  gtk = with pkgs; {
    enable = true;
    theme = {
      name = "Vimix-dark-doder";
      package = vimix-gtk-themes;
    };
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
