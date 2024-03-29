{ var, ... }: {
  home = {
    packages = (with var.pkgs; [
      gnome.nautilus
      google-chrome
      firefox
      brave
      dropbox

      #Office
      sioyek

      #Graphics
      figma-linux

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
      ghostscript


      #Dev
      direnv
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
    ]) ++ (with var.pkgs-unstable; [ inkscape ]);
  };
}
