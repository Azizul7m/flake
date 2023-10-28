{ config, pkgs, user, lib, full_name, host, ... }:
let
  exec = "exec Hyprland";
  rootpkgs = import ./rootPkgs.nix { inherit (pkgs) pkgs; };
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../theme/fonts.nix # font-confg
  ];
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    supportedFilesystems = [ "ntfs" ];
    kernelParams = [ "quiet" "splash" ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
  # Define your hostname.
  networking.hostName = "${host}";
  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-openconnect
      ];
    };
  };
  # Set your time zone.
  time.timeZone = "Asia/Dhaka";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "bn_BD";
    LANG = "en_US.UTF-8";
    LANGUAGE = "en";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pam.services.swaylock.text = ''
    auth include login
  '';

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${full_name}";
    extraGroups = [ "networkmanager" "wheel" "mpd" "docker" "podman" ];
    shell = pkgs.fish; # Default shell
    packages = with pkgs; [
      emacs29
      mpv
      alacritty
      firefox
      rnix-lsp # Nix language server protocol
      nixfmt
      shfmt # shell formater
      shellcheck # shell checker
      clang
      cmake
      gcc
    ];
  };
  # add your root pkgs inside PackagesRoot.nix files
  environment.systemPackages = rootpkgs.pkgs;
  # Environment Variables
  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        ${exec}
      fi
    ''; # Will automatically open Hyprland when logged into tty1
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "emacs";
      NODE_PATH = "$HOME/.npm_global";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      PIP_PREFIX = "/home/${user}/.local/bin";
    };
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GDK_BACKEND = "wayland";
      NIXOS_OZONE_WL = "1"; # electron apps to use wayland
      WLR_NO_HARDWARE_CURSORS = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  programs = {
    fish.enable = true;
    starship.enable = true;
    dconf.enable = true;
    mtr.enable = true;
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar = { enable = true; };
  };

  services = {
    # Mount MTP devices Trash enable;
    gvfs = { enable = true; };
    # Enable automatic login for the user.
    getty.autologinUser = "${user}";
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    emacs.enable = true;
    tlp.enable = true; # TLP and auto-cpufreq for power management
    #logind.lidSwitch = "ignore";           # Laptop does not go to sleep when lid is closed
    auto-cpufreq.enable = true;

    # Sound settings
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # Enable the X11 windowing system. Configure keymap in X11
    xserver = {
      enable = true;
      layout = "us,bd";
      xkbVariant = ",probhat";
      displayManager.lightdm.enable = false; # Disable LightDM
      #xkbOptions = "super:alt_space_toggle";
    };
    # Enable CUPS to print documents.
    printing.enable = true;
  };
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
    sleep.extraConfig = ''
      AllowSuspend=yes
      AllowHibernation=yes
      AllowSuspendThenHibernate=yes
      AllowHybridSleep=yes ''; # Required for clamshell mode (see script bindl lid switch and script in home.nix)
  };
  security.polkit.enable = true;
  virtualisation = {
    spiceUSBRedirection.enable = true;
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
  };
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true; # Optimise syslinks
    };
    # Automatic garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable; # Enable nixFlakes on system
  };

  qt = {
    enable = true;
    style = "gtk2";
    platformTheme = "gtk2";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
