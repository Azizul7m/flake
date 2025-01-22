{ config, pkgs, ... }: {
  stylix = {
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ../../src/colors/bike.jpg;
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.iosevka;
        name = "Iosevka";
      };
      sansSerif = {
        package = pkgs.lohit-fonts.bengali;
        name = "Lohit Bengali";
      };
      monospace = {
        package = pkgs.iosevka;
        name = "Iosevka";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 8;
      };
    };
    targets = { gtk.enable = true; };
  };
}
