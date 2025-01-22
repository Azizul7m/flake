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
      anydesk

      #Office
      sioyek
      foliate
      onlyoffice-bin_latest
      zoom-us

      #Graphics
      figma-linux
      inkscape
      gimp
      sxiv
      scribus
      # blender

      # Social
      telegram-desktop

      #Utils
      qbittorrent
      appimage-run
      bleachbit
      # boxbuddy # Distrobox container manage
      # Media
      vlc
      sxiv
      scrcpy

      # TUI
      lazygit
      yewtube # youtube
      htop
      neofetch
      btop
      superfile

      #Utils
      playerctl
      screenkey
      wineWowPackages.waylandFull
      winetricks
      #zenity # Diolog
      ghostscript
      cliphist # clipboard manager
      cointop
      coinlive

      # Dev
      gdbgui
      ags # GJS library
      gnome-builder
      # mongodb-compass

      insomnia
      #jetbrains.datagrip
    ]);
  };
}
