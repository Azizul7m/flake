{ config, global, ... }: {

  environment = {
    systemPackages = with global.pkgs; [
      xterm
      git
      less
      neovim
      wget
      joshuto
      ix
      fd
      ripgrep
      fzf
      bat
      hunspell
      rnix-lsp
      nixfmt
      libtool
      gcc
      cmake
      clang-tools
      gnumake
      networkmanagerapplet
      usbutils
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
