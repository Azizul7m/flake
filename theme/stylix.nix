{config, pkgs, ...}:

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ./bike.jpg;
    polarity= "dark";
    cursor = {
        package= pkgs.bibata-cursors;
        name= "Bibata-Modern-Ice";
    };

    fonts = {
        serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
        };

        sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
        };

        monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
        };

        emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
        };

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 8;
          terminal= 8;
        };
    };
    targets = {
        gnome.enable = true;
        gtk.enable = true;
    };
  };
}
