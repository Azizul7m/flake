{ pkgs, ... }: {
  pkgs = with pkgs; [
    starship
    kitty
    gnome.nautilus
    xplorer

    #Graphics
     figma-linux
     blender

    # for Android
    scrcpy
    libsForQt5.kdeconnect-kde # kde connect
    android-tools # adb and other stuff
    linux-wifi-hotspot
    


    #internet
    google-chrome
    brave
    #thunderbird
    #remmina
    rustdesk
    # qbittorrent
    ventoy # boot usb flash drive

    #Social
    tdesktop # Telegram

    #Office
    sioyek # pdf viewver
    foliate

    # circuit simulator

    #TUI
    yewtube # youtube

    # Development
    roswell # elisp package manager
    nodejs
    lua
    lua-language-server

    rustup

    direnv
    devbox
    exercism


    texlab # Lsp latex

    python310Packages.pip
    python310Full
    pipenv

    gnumake
    libtool
    pkg-config
    openssl
    libclang
    sqlite

    distrobox
    mongodb-compass

    dockfmt # docker format
    podman-compose
    #postman # API
    #jetbrains.datagrip
  ];
}
