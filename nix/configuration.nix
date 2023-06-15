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
  imports = [
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
      options = "--delete-older-than 3d";
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
  };
  # Set your time zone.
  time.timeZone = "Asia/Dhaka";
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
    extraGroups = [ 
      "networkmanager" "wheel" "video" "audio" "lp" "mpd" 
      "docker" 
      "libvirtd" 
      "qemu-libvirtd"
    ];
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
    # plex.enable = true; # media server
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
      QT_QPA_PLATFORMTHEME = "gtk2";
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
    cliphist

    rnix-lsp # Nix language server protocol
    atool
    xdg-utils
    killall
    socat
    zip
    unzip
    rar
    rsync # Syncer - $ rsync -r dir1/ dir2/
    frp
    sops
    devbox
    docker-compose
    fd
    jq
    bat
    cmake
    gcc
    ripgrep
    bash
    zsh
    direnv
    ispell

    #vm
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    virt-manager

    #wayland
    wlogout
    waybar
    wlr-randr # Screen Settings
    swayidle
    waylock
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
      fantasque-sans-mono
      font-awesome # Icons
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
    platformTheme = "gtk2";
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
    spiceUSBRedirection.enable = true;
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };
  services.spice-vdagentd.enable = true;

  # NixOS settings
  system = {
    # Allow auto update (not useful in flakes)
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "23.05";
  };
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
  };
}
