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

      libusb
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
    kdeconnect.enable = true;
    gnome-disks.enable = true;
    command-not-found.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  services = {
    pipewire = { # Sound settings
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    dbus.enable = true; # inter-process communication (IPC)
    libinput.enable = true; # LibInput
    getty.autologinUser = "anower";
    devmon.enable = true; # monitoring drive "Heavy"
    gvfs.enable = true; # trash  "Heavy"
    udisks2.enable = true; # auto mount drive  "Heavy"
    #flatpak.enable = true;
  };
}
