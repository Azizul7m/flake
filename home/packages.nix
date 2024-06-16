{ pkgs, inputs, ... }: {
  home = {
    packages = (with pkgs; [
      gnome.nautilus
      baobab # disk analizer
      google-chrome
      firefox
      brave
      dropbox
      pcmanfm

      #Office
      sioyek
      foliate

      #Graphics
      figma-linux
      sxiv
      scribus

      # Social
      telegram-desktop

      #Utils
      qbittorrent
      appimage-run
      bleachbit
      boxbuddy # Distrobox container manage

      # Media
      vlc
      sxiv

      # TUI
      lazygit
      yewtube # youtube
      htop
      neofetch
      #Utils
      cliphist # clipboard manager
      cointop 
      coinlive

      # Dev
      ags # GJS library
      gnome-builder
      mongodb-compass

      #postman # API
      #jetbrains.datagrip
    ]);
  };
}
