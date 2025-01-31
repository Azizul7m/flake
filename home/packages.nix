{ pkgs, inputs, ... }: {
  home = {
    packages = (with pkgs; [
      nautilus
      nautilus-open-in-blackbox
      nautilus-open-any-terminal
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
      sxiv
      krita
      scribus
      # blender

      # Social
      zulip
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
      cliphist # clipboard manager
      screenkey
      wineWowPackages.waylandFull
      winetricks
      #zenity # Diolog

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
