{ pkgs, ... }: {
  pkgs = with pkgs; [
    starship
    kitty
    appimage-run
    gnome.nautilus
    gnome.gnome-disk-utility
    gnome.file-roller # Archive Manager
    gnome.sushi # for nautilus quick file viewer
    gnome.eog # image viewer
    kooha # screenrecord
    spotify

    #Graphics
    gimp
    inkscape
    figma-linux
    blender
    freecad

    #internet
    google-chrome
    brave
    thunderbird
    anydesk
    qbittorrent
    dropbox-cli

    #Social
    discord # Chat
    tdesktop # Telegram
    whatsapp-for-linux
    skypeforlinux

    #Office
    zathura
    sioyek # pdf viewver
    onlyoffice-bin

    # circuit simulator
    qucs-s
    ngspice

    #TUI
    yewtube # youtube
    himalaya # tui email client
    navi
    zellij
    ffmpeg_6-full

    # Development
    roswell # elisp package manager
    nodejs

    direnv
    devbox

    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer # lsp

    texlab # Lsp latex

    python3Full
    python311Packages.pip
    pipenv

    gnumake
    libtool
    pkg-config
    openssl
    libclang
    llvm
    protobuf
    hidapi
    sqlite

    distrobox
    toolbox
    mongodb-compass

    dockfmt # docker format
    podman-compose
    #postman # API
    #jetbrains.datagrip

    # Emacs Stuff
    graphviz # org-mode visualization
    scrot # screenshot
    emacsPackages.sqlite3
    libvterm # Emacs Vterm
    editorconfig-core-c # Editor config
    wl-clipboard # for emacs org-mode
    emacsPackages.djvu
    emacsPackages.emacsql
    emacsPackages.telega
    emacsPackages.yasnippet-snippets
  ];
}
