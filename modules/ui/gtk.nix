{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      # name = "Dracula";
      # package = var.pkgs.dracula-theme ;
      name = "Lavanda-Dark";
      package = pkgs.lavanda-gtk-theme;
      # name = "Adwaita";
      # package = var.pkgs.gnome-themes-extra;
    };
    # cursorTheme = {
    #   name = "Vanilla-DMZ";
    #   package = var.pkgs.vanilla-dmz;
    #   size = 16;
    # };
    iconTheme = {
      name = "Vimix-Black";
      package = pkgs.vimix-icon-theme;
    };
  };
}
