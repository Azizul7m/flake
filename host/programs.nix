{ config, var, ... }: {

  environment = {
    systemPackages = with var.pkgs; [
      xterm
      git
      neovim
      wget
      joshuto
      ix
      fd
      ripgrep
      fzf
      bat
      tree
      hunspell

      libtool
      gcc
      killall
      cmake
      openssl
      pkg-config
      zlib
      libsodium
      gnupg
      clang
      llvm
      binutils
      libusb
      clang-tools
      gnumake
      usbutils

      networkmanagerapplet
      unzip
      cliphist # clipboard manager
      pciutils
      udisks2 # Auto Mounting
      coreutils # basic GNU utilities
      pulsemixer # sound
      xdg-utils # Environment integration
      fontconfig # root font config
    ];
  };
  programs = {
    dconf.enable = true;
    mtr.enable = true;
    nm-applet.enable = true;
    fish.enable = true;
    kdeconnect.enable = true;
    gnome-disks.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
