# and in the NixOS manual (accessible by running ‘nixos-help’).
#
# --> Equavlent of { programs.dconf.enable = true; }
# -->
# programs = {
#   dconf = {
#     enable = true;
#   }
# }

{ config, lib, pkgs, modudlesPath, ... }:

let
  user = "anower"; #define username
in

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; #Enable flakes
      auto-optimise-store = true; #Optimise Store
    };
    gc = {
      automatic = true;
      dates = "weekly"; #Old packages cleanup
      options = "--delete-older-than 7d";
    };
  };

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
    useOSProber = true;
    configurationLimit = 2;
  };

  #Enable networking
  networking = {
    networkmanager.enable = true;
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    #firewall.allowedTCPPorts = [ ... ]; # Open ports in the firewall.
    #firewall.allowedUDPPorts = [ ... ];
    #firewall.enable = false;  # Or disable the firewall altogether.
  };

  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bn_BD";
    LC_IDENTIFICATION = "bn_BD";
    LC_MEASUREMENT = "bn_BD";
    LC_MONETARY = "bn_BD";
    LC_NAME = "bn_BD";
    LC_NUMERIC = "bn_BD";
    LC_PAPER = "bn_BD";
    LC_TELEPHONE = "bn_BD";
    LC_TIME = "bn_BD";
  };

  # Configure keymap in X11
  # Services xserver, displayManager, windowManager, OpenSSH
  # List services that you want to enable:
  services = {
    xserver = {
      enable = true; #X server
      layout = "us"; #Keybaord layout
      xkbVariant = "";
      libinput.enable = true; #Touchpad enable
      exportConfiguration = true;
      displayManager = {
        sddm.enable = true; #SDDM
      };
      windowManager = {
        awesome.enable = true; #AwesomeWm
        dwm.enable = true; #Dwm
      };
    };
    pipewire = {
      enable = true; #Audio PipeWire
      audio = {
        enable = true;
      };
      wireplumber = {
        enable = true;
      };
    };
    plex.enable = true; # midea services daemon
    # openssh= {
    #   enable = true;
    # };
  };


  #TTF
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  #sound
  sound.enable = true;
  # hardware.pulseaudio.enable= true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "password";
    description = "vm";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "mpd" ];
    packages = with pkgs; [ ];
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "vim";
      VISUAL = "nvim";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    killall
    usbutils
    pciutils
    alacritty
    wget
    pkgs.fzf
    pkgs.xterm
    pkgs.home-manager
    pkgs.xorg.xrandr
    pkgs.plex
    firefox
  ];

  fonts.fonts = with pkgs; [
    jetbrains-mono
    dejavu_fonts
    iosevka
    noto-fonts
    font-awesome
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];


  # dconf
  programs.dconf.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  #qt
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };


  # sway enable
  programs.sway.enable = true;

  #xdg
  xdg = {
    portal = {
      wlr.enable = true;
    };
  };

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
