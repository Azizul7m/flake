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
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

        #Office
        onlyoffice-desktopeditors # office suite
        zoom-us

        #Graphics
        sioyek
        figma-linux # figma client
        scribus
        gimp-with-plugins

        # Social
        #zulip

        #Utils
        kitty
        dropbox
        qbittorrent
        appimage-run # AppImage
        bleachbit # System
        # boxbuddy # Distrobox container manage
        #rustdesk

        # Development
        antigravity

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
