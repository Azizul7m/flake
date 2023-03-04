{config, pkgs, ...}:

{
  targets.genericLinux.enable = true;
  home.stateVersion= "22.11";
  home.homeDirectory= "/home/anower";
  home.username= "anower";

  #Themes
  gtk.enable= true;
  gtk.theme.package= pkgs.vimix-gtk-themes;
  gtk.theme.name= "vimix-dark-doder";
  fonts.fontconfig.enable=true;

  home.packages= with pkgs; [ 
    pkgs.git
    pkgs.bash
    pkgs.btop
    pkgs.fish
    pkgs.neovim
    pkgs.emacs
    pkgs.starship
    pkgs.ripgrep
    pkgs.fd
    pkgs.dmenu
    pkgs.arandr
    pkgs.gnumake
    pkgs.font-awesome
    pkgs.font-awesome
    pkgs.nitrogen
    pkgs.picom

    noto-fonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    jetbrains-mono
    iosevka
  ];

  programs ={
    fish.enable=true;
    rofi.enable=true;
  };
}

