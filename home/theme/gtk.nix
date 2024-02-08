{ global, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = global.pkgs.dracula-theme;
      # name = "Materia-dark";
      # package = global.pkgs.materia-theme;
    };
    iconTheme = {
      name = "Vimix-Black";
      package = global.pkgs.vimix-icon-theme;
    };
    cursorTheme = {
      package = global.pkgs.apple-cursor;
      name = "macOS-Monterey";
      size = 16;
    };
    gtk3 = {
      extraConfig = {
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };
}
