{ pkgs, ... }: {
  pkgs = with pkgs; [
    kitty
    podman-desktop
    appimage-run
    maestral-gui # dropbox
    gnome.nautilus
    gnome.file-roller # Archive Manager
    gnome.sushi # for nautilus quick file viewer
    gnome.eog # image viewer
    yewtube # youtube
    kooha # screenrecord

    #Graphics
    gimp
    inkscape
    figma-linux
    blender
    olive-editor

    #internet
    google-chrome
    thunderbird
    anydesk
    qbittorrent

    #Social
    irssi
    discord # Chat
    tdesktop # Telegram
    whatsapp-for-linux

    #Office
    zathura
    onlyoffice-bin

    # Development
    nodejs
    direnv
    devbox
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
    python3
    gnumake
    libtool
    pkg-config
    openssl
    libclang
    llvm
    protobuf
    hidapi
    sqlite
    podman-compose
    postman # API
    distrobox
    toolbox
    mongodb-compass
    starship
    dockfmt # docker format
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
