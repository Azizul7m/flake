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
  # user = "anower"; #define username
  # Comes form flake.nix file;
  user = (import <nixos-config>).user;
in

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix = {
    # Nix Package Manager settings
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true; # Optimise syslinks
    };
    # Automatic garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable; # Enable nixFlakes on system
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


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "mpd" ];
    shell = pkgs.fish; # Default shell
    packages = with pkgs; [ ];
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };


  #TTF
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  #sound
  sound.enable = true;
  # hardware.pulseaudio.enable= true;


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
      };
    };
    # Sound
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber = {
        enable = true;
      };
    };
    #bluetooth
    blueman.enable = true;
    #plex.enable = true; # midea services daemon
    # openssh= {
    #   enable = true;
    # };
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
    udiskie # Auto Mounting
    light # Display Brightness
    alacritty
    wget
    fzf
    xterm
  ];

  fonts.fonts = with pkgs; [
    jetbrains-mono
    dejavu_fonts
    iosevka
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


  security.rtkit.enable = true;
  security.polkit.enable = true;



  # NixOS settings
  system = {
    # Allow auto update (not useful in flakes)
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
}
