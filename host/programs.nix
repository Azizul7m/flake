{ config, var, ... }: {

  environment = {
    systemPackages = with var.pkgs; [
      xterm
      git
      gh
      neovim
      wget
      joshuto
      nitch
      ix
      fd
      ripgrep
      fzf
      bat
      tree
      ncdu
      hunspell
      typioca

      libusb
      usbutils
      flatpak-builder  
      killall

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
