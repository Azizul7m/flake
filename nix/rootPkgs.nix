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
    tldr
    htop
    grc
    neofetch
    ripgrep
    fd
    fzf
    jq
    frp
    bat
    exa
    aspell
    killall
    usbutils
    unzip
    pciutils
    udiskie # Auto Mounting
    libsecret # passwd manager
    coreutils # basic GNU utilities
    cliphist # clipboard manager
    gparted
    libadwaita
    pcmanfm
    pulsemixer # sound
    #wayland
    wlogout
    wlr-randr # Screen Settings
    swaylock
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
    libnotify # for dunst
    dunst # notification
    grim
    wofi
    rofi-wayland
    bemenu
  ];
}
