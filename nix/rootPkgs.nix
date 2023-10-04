{ pkgs, ... }: {
  pkgs = with pkgs; [
    git
    vim
    ranger
    neovim
    wget
    w3m
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
    aspell
    killall
    usbutils
    unzip
    ffmpeg_6-full

    openvpn
    update-resolv-conf

    pciutils
    udisks2 # Auto Mounting
    libsecret # passwd manager
    coreutils # basic GNU utilities
    cliphist # clipboard manager
    libadwaita
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
