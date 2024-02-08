{ global, ... }: {
  home = {
    packages = with global.pkgs; [
      gnome.nautilus
      google-chrome
      firefox
      brave
      vlc

      #Office
      sioyek

      #Graphics
      figma-linux
      inkscape

      # Social
      telegram-desktop


      #Utils
      qbittorrent
      rustdesk
      rustdesk-server

      # TUI
      lazygit
      yewtube # youtube
      htop
      neofetch

      #Dev
      nodejs

      # python310Packages.pip
      # pipenv

      # Dev
      distrobox
      mongodb-compass

      dockfmt # docker format
      podman-compose

      #postman # API
      #jetbrains.datagrip
    ];
  };

}
