{ config, pkgs, var, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./modules/hyprland.nix
    ./fonts.nix
    ./environment.nix
    ./services.nix
    ./virtualisation.nix
    ./programs.nix
    ./users.nix
  ];
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    # kernelParams = [ "quiet" "splash" ];
     consoleLogLevel = 0;
     initrd.verbose = false;
     binfmt = {
        registrations.appimage ={
        wrapInterpreterInShell = false;
        interpreter = "${pkgs.appimage-run}/bin/appimage-run";
        recognitionType = "magic";
        offset = 0;
        mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
        magicOrExtension = ''\x7fELF....AI\x02'';
      };
    };
  };
  sound.enable = true;
  networking = {
    hostName = "${var.host}"; # Define your hostname.
    networkmanager.enable = true;
    firewall = {
        enable = true;
        allowedTCPPorts = [ 22 80 443 7878 ];
        allowedUDPPortRanges = [
            { from = 3000; to = 3007; }
            { from = 4000; to = 4007; }
            { from = 8000; to = 8009; }
        ];
    };
  };
    # i18n.inputMethod = {
    #     enabled = "fcitx5";
    #     fcitx5.addons = with pkgs; [
    #     fcitx5-gtk
    #     fcitx5-configtool
    #     fcitx5-with-addons
    #     fcitx5-m17n
    #     fcitx5-openbangla-keyboard
    #     ];
    # };
  time.timeZone = "Asia/Dhaka"; # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bn_BD";
    LC_IDENTIFICATION = "bn_BD";
    LC_MEASUREMENT = "bn_BD";
    LC_MONETARY = "bn_BD";
    LC_PAPER = "bn_BD";
    LC_TIME = "bn_BD";
  };
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "auto-allocate-uids"
        # "configurable-impure-env"
      ];
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = { # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
  };

  security = {
    rtkit.enable = true;
    # polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.services.swaylock.text = ''
      auth include login
    '';
  };
  hardware.pulseaudio.enable = false;

  xdg.portal.enable = true;
  # xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "24.05"; # Did you read the comment?
}
