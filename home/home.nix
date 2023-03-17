{ config, pkgs, user, ... }:
let
  user = user;
in
{
  home = {
    stateVersion = "22.11";
    homeDirectory = "/home/${user}";
    username = user;
    packages = with pkgs; [
      btop
      neovim
      starship
      ripgrep
      fd
      dmenu
      picom
    ];
  };
  programs = {
    home-manager.enable = true;
    fish.enable = true;
    rofi.enable = true;
  };
  #Themes
  gtk = {
    enable = true;
    theme = {
      name = "vimix-dark-doder";
      package = pkgs.vimix-gtk-themes;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrains Mono Medium";
      #name = "FiraCode Nerd Font Mono Medium";
    }; # Cursor is declared under home.pointerCursor
  };
  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;
}
