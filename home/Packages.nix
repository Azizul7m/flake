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
    celluloid # player

    #Graphics
    inkscape
    #figma-linux
    blender

    #internet
    google-chrome
    brave
    #thunderbird
    remmina
    anydesk
    qbittorrent
    dropbox

    #Social
    discord # Chat
    tdesktop # Telegram
    whatsapp-for-linux
    weechat

    #Office
    sioyek # pdf viewver
    foliate
    onlyoffice-bin

    # circuit simulator
    qucs-s
    ngspice

    #TUI
    yewtube # youtube
    himalaya # tui email client
    zellij # tmux alaternative

    # Development
    vscode
    roswell # elisp package manager
    nodejs

    direnv
    devbox
    exercism

    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer # lsp

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
    emacsPackages.grip-mode
    texlive.combined.scheme-full # latex compailer
    pandoc
  ];
}
