{ config, user, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./environment.nix
    ./virtualisation.nix
    ./programs.nix
    ./users.nix
    ./networking.nix
    ./services.nix
    ./fonts.nix
    ./nix_conf.nix
    ./type_inputs.nix
  ];
  # Bootloader settings
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
  #NOTE: system settings
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

  #NOTE: secqurity settings
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.services.swaylock.text = ''
      auth include login
    '';
  };
  #NOTE: other settings
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "24.05"; # Did you read the comment?
}
