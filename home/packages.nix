{ pkgs, ... }: {
  home = {
    packages = (with pkgs; [
      nautilus
      baobab # disk analyzer
      gnome-disk-utility # disk utility
      google-chrome # web browser
      pcmanfm # file manager

      #Office
      onlyoffice-desktopeditors # office suite
      zoom-us

      #Graphics
      figma-linux # figma client
      gimp
      sxiv

      # Social
      #zulip

      #Utils
      dropbox
      qbittorrent
      appimage-run # AppImage
      bleachbit # System
      # boxbuddy # Distrobox container manage
      #rustdesk

      # Media
      vlc
      sxiv
      scrcpy # android screen mirror

      # TUI
      # yewtube # YouTube

      #Utils
      playerctl
      cliphist # clipboard manager
      screenkey # Show keys pressed on screen
      #zenity # Dialog
    ]);
  };
}
