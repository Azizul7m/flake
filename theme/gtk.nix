{ var, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = var.pkgs.dracula-theme;
      # name = "Materia-dark";
      # package = var.pkgs.materia-theme;
    };
    iconTheme = {
      name = "Vimix-Black";
      package = var.pkgs.vimix-icon-theme;
    };
  };
}
