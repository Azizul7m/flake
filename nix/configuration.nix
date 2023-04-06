# and in the NixOS manual (accessible by running ‘nixos-help’).
#
# --> Equavlent of { programs.dconf.enable = true; }
# -->
# programs = {
#   dconf = {
#     enable = true;
#   }
# }

{ config, lib, pkgs, modudlesPath, inputs, user, ... }:

# let
#   user = "anower"; #define username
#   # Comes form flake.nix file;
#   # user = (import <nixos-config>).user;
# in

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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = [ "ntfs" ];
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
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "ANOWER HOSSAIN";
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


  # Configure keymap in X11
  # Services xserver, displayManager, windowManager, OpenSSH
  # List services that you want to enable:
  services = {
    #syncthing.enable = true;
    lorri.enable = true; # lorri is a nix-shell replacement for project development
    xserver = {
      enable = true; #X server
      layout = "us"; #Keybaord layout
      xkbVariant = "";
      libinput.enable = true; #Touchpad enable
      exportConfiguration = true;
      displayManager = {
        sddm.enable = true; #SDDM
        sddm.theme = "maldives";
        sddm.autoNumlock = true;
      };
      windowManager = {
        awesome =
          {
            enable = true; #AwesomeWm
            luaModules = with pkgs.luaPackages; [
              luarocks # is the package manager for Lua modules
              luadbi-mysql # Database abstraction layer
            ];
          };
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
    #plex.enable = true; # midea services daemon
    openssh = {
      enable = true;
    };
  };

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "vim";
      VISUAL = "emacs";
      XDG_CURRENT_DESKTOP = "sway";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    w3m
    killall
    usbutils
    pciutils
    udiskie # Auto Mounting
    light # Display Brightness
    wget
    fzf
    grc
    rnix-lsp # Nix language server protocol
    xterm
    atool
    ffmpeg
    ffmpegthumbnailer
    xdg-utils
    killall
    socat
    zip
    unzip
    rar
    rsync # Syncer - $ rsync -r dir1/ dir2/
    frp
    sops
    fd
    bat
    ripgrep
    bash
    zsh
    direnv
    ispell
    #wayland
    wlogout
    waybar
    wlr-randr # Screen Settings
    swayidle
    xwayland # X for Wayland
    wlprop
  ];

  fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      iosevka
      ubuntu_font_family
      jetbrains-mono
      font-awesome # Icons
      fantasque-sans-mono
      corefonts # MS
      (nerdfonts.override {
        # Nerdfont Icons override
        fonts = [
          "FiraCode"
        ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "UbuntuMono" ];
      };
    };
  };


  # dconf
  programs = {
    dconf.enable = true;
    fish.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  qt = {
    style = "gtk2";
    platformTheme = "qt5ct";
  };

  #xdg
  xdg = {
    portal = {
      wlr.enable = true;
    };
  };


  security.rtkit.enable = true;
  security.polkit.enable = true;


  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
  };

  # NixOS settings
  system = {
    # Allow auto update (not useful in flakes)
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.11";
  };
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
  };
}
