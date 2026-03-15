{ pkgs, inputs, ... }:
{
  home = {
    packages = (
      with pkgs;
      [
        nautilus
        baobab # disk analyzer
        gnome-disk-utility # disk utility
        google-chrome # web browser
        pcmanfm # file manager

        #Office
        onlyoffice-desktopeditors # office suite
        zoom-us

        #Graphics
        sioyek
        figma-linux # figma client
        scribus
        gimp-with-plugins
        # gimp2Plugins.gmic
        # gimp2Plugins.fourier
        # gimp2Plugins.lightning
        # gimp2Plugins.resynthesizer

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
      ]
    );
  };
}
