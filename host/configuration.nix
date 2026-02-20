{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.dms.nixosModules.dank-material-shell
    inputs.catppuccin.nixosModules.catppuccin
    inputs.agenix.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
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
  # Boot loader settings
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
  #NOTE: system settings
  boot = {
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
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

  #NOTE: security settings
  security = {
    rtkit.enable = true;
    polkit.enable = true; # PolicyKit for privilege management
    sudo.wheelNeedsPassword = false;
    pam.services.swaylock.text = ''
      auth include login
    '';
  };
  # PipeWire is enabled in services.nix; keep legacy PulseAudio disabled.
  services.pulseaudio.enable = false;
  #NOTE: other settings
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  system.stateVersion = "24.05"; # Did you read the comment?
}
