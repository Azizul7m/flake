{ pkgs, inputs, ... }: {
  home = {
    packages = (with pkgs; [
      nautilus
      baobab # disk analizer
      gnome-disk-utility # disk utility
      google-chrome # web browser
      pcmanfm # file manager

      #Office
      onlyoffice-desktopeditors # office suite

      #Graphics
      figma-linux # figma client
      #inkscape
      sxiv
      #      scribus
      # blender
      #lightworks

      # Social
      #zulip

      #Utils
      dropbox
      qbittorrent
      appimage-run # AppImage
      bleachbit # system
      # boxbuddy # Distrobox container manage
      #rustdesk

      # Media
      vlc
      sxiv
      scrcpy # android screen mirror

      # TUI
      # yewtube # youtube

      #Utils
      playerctl
      cliphist # clipboard manager
      screenkey # show keys pressed on screen
      #zenity # Diolog
    ]);
  };
}
