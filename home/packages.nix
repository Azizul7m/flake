{ pkgs, inputs, ... }: {
  home = {
    packages = (with pkgs; [
      nautilus
      baobab # disk analizer
      google-chrome
      firefox
      brave
      dropbox
      pcmanfm

      #Office
      sioyek
      foliate
      onlyoffice-bin_latest

      #Graphics
      figma-linux
      inkscape
      gimp
      sxiv
      scribus
      blender

      # Social
      telegram-desktop

      #Utils
      qbittorrent
      appimage-run
      bleachbit
      boxbuddy # Distrobox container manage
      remmina # Remotely ssh client
      # Media
      vlc
      sxiv
      zed-editor

      # TUI
      lazygit
      yewtube # youtube
      htop
      neofetch
      btop
      superfile
      #Utils
      playerctl
      wineWowPackages.waylandFull
      winetricks
      zenity # Diolog
      ghostscript
      cliphist # clipboard manager
      cointop
      coinlive

      # Dev
      gdbgui
      ags # GJS library
      gnome-builder
      mongodb-compass

      insomnia
      #jetbrains.datagrip
    ]);
  };
}
