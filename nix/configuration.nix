{ config, pkgs, user, lib, full_name, host, ... }:
let rootpkgs = import ./rootPkgs.nix { inherit (pkgs) pkgs; };
in {
  imports = [
    ./hardware-configuration.nix
    ./module/hyprland.nix # Hyprland land module
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
  networking = {
    hostName = "${host}"; # Define hostname.
    networkmanager = { # Enable networking
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
        networkmanager-openconnect
      ];
    };
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 80 443 ];
  };
  time.timeZone = "Asia/Dhaka"; # Set your time zone.
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
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${full_name}";
    extraGroups = [ "networkmanager" "wheel" "mpd" "docker" "podman" ];
    shell = pkgs.fish; # Default shell
    packages = with pkgs; [
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
  users.users.minidlna = {
    extraGroups =
      [ "users" "samba" "wheel" "tolga" ]; # so minidlna can access the files.
  };
  environment = {
    systemPackages =
      rootpkgs.pkgs; # add your root pkgs inside PackagesRoot.nix files
    variables = { # Environment Variables
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "emacs";
      NODE_PATH = "$HOME/.npm_global";
      PIP_PREFIX = "$HOME/.local/bin";
    };
  };
  programs = {
    fish.enable = true;
    starship.enable = true;
    dconf.enable = true;
    mtr.enable = true;
    openvpn3.enable = true;
    kdeconnect.enable = true;
    gnome-disks.enable = true;
    file-roller.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  sound.enable = true; # Enable sound with pipewire.
  services = {
    create_ap.enable = true; # hotspot
    haveged.enable = true; # daemon hotspot
    gnome = {
      gnome-keyring.enable = true;
      sushi.enable = true; # quick previewer for nautilus
    };
    emacs = {
      enable = true;
      defaultEditor = true;
    };
    pipewire = { # Sound settings
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    minidlna = { # NOTE: dlna midea steming
      enable = true;
      openFirewall = true;
      settings = {
        inotify = "yes";
        friendly_name = "NixOS-DLNA";
        media_dir =
          [ "PV,$HOME/Videos" "PV,$HOME/Music" "PV,$HOME/Entertainment" ];
      };
    };
    # Enable the X11 windowing system. Configure keymap in X11
    xserver = {
      enable = true;
      layout = "us,bd";
      xkbVariant = ",probhat";
      # displayManager.lightdm.enable = false; # Disable LightDM
      #xkbOptions = "super:alt_space_toggle";
    };
    gvfs = { enable = true; }; # Mount MTP devices Trash enable;
    getty.autologinUser = "${user}"; # Enable automatic login for the user.
    openssh.enable = true; # Enable the OpenSSH daemon.
    tlp.enable = true; # TLP and auto-cpufreq for power management
    auto-cpufreq.enable = true;
    printing.enable = true; # Enable CUPS to print documents.
  };
  virtualisation = {
    spiceUSBRedirection.enable = true;
    podman = {
      enable = true;
      dockerCompat = true; # Create a `docker` alias for podman,
      defaultNetwork.settings.dns_enabled =
        true; # containers talk to each other.
    };
  };
  hardware = {
    pulseaudio.enable = false;
    opengl.enable = true;
    opengl.driSupport = true;
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock.text = ''
      auth include login
    '';
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
    # package = pkgs.nixVersions.unstable; # Enable nixFlakes on system
  };
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
}
