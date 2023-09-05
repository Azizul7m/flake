# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, user, full_name, host, ... }:
let
exec = "exec Hyprland";
in

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "${host}"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;



  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "bn_BD";
    LANG = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
  };



  # Enable the X11 windowing system. Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us,bd";
    xkbVariant = "probhat";
    xkbOptions = "grp:win_tab_toggle"; # Example option for layout switching
  };



  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pam.services.swaylock.text = ''
    auth include login
  '';

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };


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
      #  XDG_CURRENT_DESKTOP = "sway";
      #QT_QPA_PLATFORMTHEME = "gtk2";
      #QT_QPA_PLATFORM = "wayland";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; #electron apps to use wayland
      WLR_NO_HARDWARE_CURSORS = "1";
      #MOZ_ENABLE_WAYLAND = "1";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${full_name}";
    extraGroups = [ "networkmanager" "wheel" "mpd" "docker" "podman" ];
    shell = pkgs.fish; # Default shell
    packages = with pkgs; [

      xkb-switch
      emacs29
      mpv
      alacritty
      kitty
      firefox
      google-chrome
      vscode
      toot #Mastodon CLI interface
      gnome.nautilus
      gnome.file-roller # Archive Manager
      gnome.sushi #for nautilus quick file viewer
      gnome.eog #image viewer
      gnome-online-accounts
      podman-desktop
      appimage-run
      zathura
      maestral-gui #dropbox
      thunderbird

      # Dev
      direnv
      devbox
      cargo
      rustc
      rustfmt
      clippy
      rust-analyzer

      python3
      clang
      cmake
      gcc
      glib
      gnumake
      libtool
      pkg-config
      openssl
      libclang
      zlib
      llvm
      protobuf
      hidapi
      sqlite
      podman-compose
      distrobox
      toolbox

      rnix-lsp # Nix language server protocol
      nixfmt
      shfmt # shell formater
      shellcheck # shell checker

      nodejs
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    ranger
    neovim
    wget
    w3m
    btop
    nitch
    tldr
    htop
    grc
    stow
    neofetch
    ripgrep
    fd
    fzf
    jq
    frp
    bat
    exa
    ispell
    killall
    usbutils
    unzip
    pciutils
    udiskie # Auto Mounting
    libsecret # passwd manager
    coreutils #basic GNU utilities
    imagemagick
    cliphist #clipboard manager
    gparted
    gnome.gnome-disk-utility
    pcmanfm


    #wayland
    wlogout
    wlr-randr # Screen Settings
    swayidle
    swaylock
    wlprop
    eww
    swww # wallpaper
    libnotify #for dunst
    dunst #notification
    grim
    wofi
    rofi-wayland
    bemenu
  ];


  programs = {
    dconf.enable = true;
    fish.enable = true;
    starship.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    #hyprland window manager
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar = {
      enable = true;
    };
  };

  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    emacs.enable = true;
  };


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


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      iosevka
      jetbrains-mono
      fantasque-sans-mono
      font-awesome # Icons
#      corefonts # MS
      (nerdfonts.override {
        # Nerdfont Icons override
        fonts = [ "FiraCode" ];
      })
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "JetBrains " ];
        sansSerif = [ "JetBrains " ];
        monospace = [ "JetBrains Mono" ];
      };
    };
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

  system.stateVersion = "23.11";
}
