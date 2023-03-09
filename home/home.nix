{ config, pkgs, user, ... }:

{
  targets.genericLinux.enable = true;
  home.stateVersion = "22.11";
  home.homeDirectory = "/home/${user}";
  home.username = "${user}";

  #Themes
  gtk.enable = true;
  gtk.theme.package = pkgs.vimix-gtk-themes;
  gtk.theme.name = "vimix-dark-doder";
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    pkgs.git
    pkgs.btop
    pkgs.fish
    pkgs.neovim
    pkgs.starship
    pkgs.ripgrep
    pkgs.fd
    pkgs.dmenu
    pkgs.arandr
    pkgs.font-awesome
    pkgs.nitrogen
    pkgs.picom
  ];

  programs = {
    fish.enable = true;
    rofi.enable = true;
  };
}
