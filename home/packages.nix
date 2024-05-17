{ var, ... }: {
  home = {
    packages = (with var.pkgs; [
    gnome.nautilus
    baobab # disk analizer
      google-chrome
      firefox
      dropbox

      #Office
      sioyek
      foliate

      #Graphics
      figma-linux
      sxiv

      # Social
      telegram-desktop

      #Utils
      qbittorrent
      rustdesk
      rustdesk-server
      appimage-run
      bleachbit
      sxiv

      # Media
      vlc

      # TUI
      lazygit
      yewtube # youtube
      htop
      neofetch




      # Dev
      mongodb-compass


      #postman # API
      #jetbrains.datagrip
    ]) ++ (with var.pkgs-stable; [ inkscape ]);
  };
}
