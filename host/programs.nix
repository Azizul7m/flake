{ config, var, ... }:
with var.pkgs; {
  environment = {
    systemPackages = [
      xterm
      git
      gh
      vim
      nushell
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
      wayvnc
      wlprop
      wlr-randr # Screen Settings
      wlroots_0_18

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
    kdeconnect.enable = true;
    gnome-disks.enable = true;
    hyprland.portalPackage = xdg-desktop-portal-hyprland;
    command-not-found.enable = true;
    xwayland.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
