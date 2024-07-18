{ config, pkgs, inputs, var, ... }:
{

  imports = [
     inputs.stylix.nixosModules.stylix
    ./hardware-configuration.nix
    ./environment.nix
    ./virtualisation.nix
    ./programs.nix
    ./users.nix
    ../modules/services/postgress.nix
    ../theme/stylix.nix
  ];
  # Bootloader.
 boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
 };
 boot = {
   supportedFilesystems = [ "ntfs" ];
   kernelParams = [ "quiet" "splash" ];
   consoleLogLevel = 0;
   initrd = {
      systemd.enable= true;
      verbose = false;
    };
    binfmt.registrations.appimage = {
        wrapInterpreterInShell = false;
        interpreter = "${pkgs.appimage-run}/bin/appimage-run";
        recognitionType = "magic";
        offset = 0;
        mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
        magicOrExtension = ''\x7fELF....AI\x02'';
    };
 };
 sound.enable = true;
 networking = {
   hostName = "${var.host}"; # Define your hostname.
   networkmanager.enable = true;
   firewall = {
       enable = true;
       allowedTCPPorts = [ 20 21 22 80 443 7878 5173 ];
       allowedUDPPortRanges = [
           { from = 3000; to = 3007; }
           { from = 51000; to = 51999; }
           { from = 4000; to = 4007; }
       ];
   };
 };
  time.timeZone = "Asia/Dhaka"; # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "bn_BD";
    LC_MEASUREMENT = "bn_BD";
    LC_MONETARY = "bn_BD";
    LC_PAPER = "bn_BD";
    LC_TIME = "en_US.UTF-8";
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
    package = pkgs.nixVersions.latest;
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

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };


  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "24.05"; # Did you read the comment?
}
