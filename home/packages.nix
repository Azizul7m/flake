{ pkgs, inputs, ... }: {
  home = {
    packages = (with pkgs; [
      nautilus
      baobab # disk analizer
      google-chrome
      firefox
      brave
      pcmanfm

      #Office
      sioyek
      foliate
      onlyoffice-bin_latest

      #Graphics
      figma-linux
      inkscape
      sxiv
      scribus
      # blender
      lightworks

      # Social
      zulip

      #Utils
      dropbox
      qbittorrent
      appimage-run
      bleachbit
      # boxbuddy # Distrobox container manage
      rustdesk

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

      #Utils
      playerctl
      cliphist # clipboard manager
      screenkey
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
