{ pkgs, ... }: {
  pkgs = with pkgs; [
    kitty
    vscode
    toot # Mastodon CLI interface
    podman-desktop
    appimage-run
    zathura
    maestral-gui # dropbox
    gnome.nautilus
    gnome.file-roller # Archive Manager
    gnome.sushi # for nautilus quick file viewer
    gnome.eog # image viewer

    gimp
    inkscape
    figma-linux
    anydesk
    qbittorrent
    blender
    olive-editor

    # Emacs Stuff
    graphviz # org-mode visualization
    scrot # screenshot
    emacsPackages.sqlite3
    libvterm # Emacs Vterm
    editorconfig-core-c # Editor config
    wl-clipboard # for emacs org-mode
    emacsPackages.djvu
    emacsPackages.emacsql
    #internet
    google-chrome
    thunderbird
    #Social
    irssi
    discord # Chat
    tdesktop # Telegram
    whatsapp-for-linux

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
    distrobox
    toolbox
    mongodb-compass
    starship
    #jetbrains.datagrip
  ];
}
