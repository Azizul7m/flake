{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  # Keep hardware-specific settings in hardware-configuration.nix and put
  # reusable system settings in the smaller files imported below.
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ./environment.nix
    ./virtualisation.nix
    ./programs.nix
    ./system_packages.nix
    ./users.nix
    ./networking.nix
    ./services.nix
    ./fonts.nix
    ./nix_conf.nix
    ./type_inputs.nix
    ../modules/programs/dms.nix
  ];
  # Boot loader settings. Changing the timeout only affects the boot menu;
  # do not remove EFI support unless this machine no longer boots with UEFI.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
  # Machine-level kernel and boot settings.
  boot = {
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    supportedFilesystems = [ "ntfs" ];
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd = {
      systemd.enable = true;
      verbose = true;
    };

    # Let AppImage files run through appimage-run when launched as binaries.
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

  # Basic desktop security and authentication settings.
  security = {
    rtkit.enable = true;
    polkit.enable = true; # PolicyKit for privilege management
    sudo.wheelNeedsPassword = false;
  };
  # PipeWire is enabled in services.nix; keep legacy PulseAudio disabled.
  services.pulseaudio.enable = false;
  #NOTE: other settings
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };

  # Some selected applications are unfree. Remove this only after removing
  # every unfree package from the package lists.
  nixpkgs.config.allowUnfree = true;
  # Keep this at the original installation version. It is not the current
  # NixOS release and should only change when following the stateVersion guide.
  system.stateVersion = "24.05";
}
