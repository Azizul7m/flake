{ pkgs, ... }: {
  pkgs = with pkgs; [
    git
    gitui
    vim
    ranger
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
    figlet # assci arts
    ispell
    aspell
    aspellDicts.en
    killall
    usbutils
    unzip
    khal # calander
    vdirsyncer # online cal address sync
    mpv

    openvpn
    update-resolv-conf

    pciutils
    udisks2 # Auto Mounting
    libsecret # passwd manager
    coreutils # basic GNU utilities
    cliphist # clipboard manager
    pcmanfm
    pulsemixer # sound
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
    swaybg # wallpaper
    waypaper # wallpaper
    glfw-wayland
    eww
    slurp
    wofi
    rofi-wayland
    bemenu
  ];
}
