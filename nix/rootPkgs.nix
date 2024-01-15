{ pkgs, ... }: {
  pkgs = with pkgs; [
    git
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

    polkit
    killall
    usbutils
    unzip
    vdirsyncer # online cal address sync

    openvpn
    update-resolv-conf
    openssl

    pciutils
    udisks2 # Auto Mounting
    libsecret # passwd manager
    coreutils # basic GNU utilities
    cliphist # clipboard manager
    pulsemixer # sound
    networkmanagerapplet
    home-manager
  ];
}
