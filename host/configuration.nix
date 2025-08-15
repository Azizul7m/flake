{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./environment.nix
    ./virtualisation.nix
    ./programs.nix
    ./users.nix
    ./networking.nix
    ./services.nix
    ./fonts.nix
    ../modules/programs/ibus.nix
    ../modules/ui/stylix.nix
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
      systemd.enable = true;
      verbose = true;
    };
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
      magicOrExtension = "\\x7fELF....AI\\x02";
    };
  };
  time.timeZone = "Asia/Dhaka"; # Set your time zone.
  i18n = {
    inputMethod = { enable = true; };
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "bn_BD";
      LC_MEASUREMENT = "bn_BD";
      LC_MONETARY = "bn_BD";
      LC_PAPER = "bn_BD";
      LC_TIME = "en_US.UTF-8";
    };
  };
  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "auto-allocate-uids"
        "nix-command"
        # "configurable-impure-env"
      ];
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      automatic = true; # Automatic garbage collection
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.latest;
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.services.swaylock.text = ''
      auth include login
    '';
  };
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "24.05"; # Did you read the comment?
}
