{ pkgs, inputs, ... }: {
  home = {
    packages = (with pkgs; [
      nautilus
      baobab # disk analizer
      google-chrome
      #firefox
      brave
      pcmanfm

      #Office
      sioyek
      onlyoffice-bin_latest

      #Graphics
      figma-linux
      #inkscape
      sxiv
      #scribus
      #blender
      #lightworks

      # Social
      #zulip

      #Utils
      dropbox
      qbittorrent
      appimage-run
      bleachbit
      # boxbuddy # Distrobox container manage
      #rustdesk

      # Media
      vlc
      sxiv
      scrcpy

      # TUI
      # yewtube # youtube


      #Utils
      playerctl
      cliphist # clipboard manager
      screenkey
      #zenity # Diolog
    ]);
  };
}
