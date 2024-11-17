{ config, var, ... }: {
  environment = {
    systemPackages = with var.pkgs; [
      xterm
      git
      gh
      nushell
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
      gdb
      sshfs
      nmap

      libusb1
      usbutils
      killall

      home-manager
      networkmanagerapplet
      unzip
      pciutils
      udisks2 # Auto Mounting
      coreutils # basic GNU utilities
      pulsemixer # sound
      xdg-utils # Environment integration
      cups # A standards-based printing system for UNIX
      fontconfig # root font config
    ];
  };

  stylix.enable = true;
  programs = {
    dconf.enable = true;
    mtr.enable = true;
    nm-applet.enable = true;
    fish.enable = true;
    #kdeconnect.enable = true;
    gnome-disks.enable = true;
    command-not-found.enable = true;
    hyprland.portalPackage = var.pkgs.xdg-desktop-portal-hyprland;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
