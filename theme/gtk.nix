{ pkgs, ... }: {
  enable = true;
  theme = {
    # name = "Dracula";
    # package = pkgs.dracula-theme;
    name = "Materia-dark";
    package = pkgs.materia-theme;
  };
  iconTheme = {
    name = "Vimix-Black";
    package = pkgs.vimix-icon-theme;
  };
  gtk3.extraConfig = {
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintslight";
    gtk-xft-rgba = "rgb";
    gtk-application-prefer-dark-theme = true;
  };
  gtk2.extraConfig = ''
    gtk-xft-antialias=1
    gtk-xft-hinting=1
    gtk-xft-hintstyle="hintslight"
    gtk-xft-rgba="rgb"
  '';
}
