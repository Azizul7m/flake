{ pkgs, ... }: {
  pkgs = with pkgs; [
    git
    gitui
    vim
    ranger
    joshuto # ranger like file manager
    lf
    pistol # fileviewer for renger and lf
    neovim
    wget
    w3m
    ix # pastbin
    btop
    nitch
    tldr # Helper
    htop
    grc
    neofetch
    ripgrep
    fd
    fzf
    jq
    frp
    bat
    eza
    yad
    figlet # assci arts
    hunspell
    wordnet # large lexical database of English
    hunspellDicts.en_US
    aspell
    wkhtmltopdf

    polkit
    killall
    usbutils
    unzip
    vdirsyncer # online cal address sync
    mpv

    openvpn
    update-resolv-conf
    openssl

    pciutils
    udisks2 # Auto Mounting
    libsecret # passwd manager
    coreutils # basic GNU utilities
    cliphist # clipboard manager
    pcmanfm
    pulsemixer # sound
    networkmanagerapplet
    home-manager
    #wayland
    wlogout
    wlr-randr # Screen Settings
    swaylock
    swaynotificationcenter # notifications
    libnotify
    wlprop
    wayland
    wayland-scanner
    wayland-utils
    egl-wayland
    wf-recorder
    wayland-protocols
    waypaper # wallpaper selector
    swaybg # wallpaper
    glfw-wayland
    eww
    slurp
    wofi
    rofi-wayland
    bemenu

  ];
}
