{ config, pkgs, user, ... }:
{
  home = {
    stateVersion = "22.11";
    homeDirectory = "/home/${user}";
    username = user;
    packages = with pkgs; [


      # General home-manager
      alacritty # Terminal Emulator
      #dunst            # Notifications
      #doom emacs       # Text Editor
      #libnotify        # Dependency for Dunst
      #neovim           # Text Editor
      #rofi             # Menu
      #rofi-power-menu  # Power Menu
      #udiskie          # Auto Mounting
      #vim              # Text Editor


      # Terminal
      #btop             # Resource Manager
      nitch # Minimal fetch
      #ranger # File Manager
      tldr # Helper
      #neovim
      #starship
      #ripgrep
      #fd
      #exa

      # Video/Audio
      # feh               # Image Viewer
      # mpv               # Media Player
      # pavucontrol       # Audio Control
      # plex-media-player # Media Player
      # vlc               # Media Player
      # stremio           # Media Streamer



      # Apps
      # appimage-run      # Runs AppImages on NixOS
      firefox # Browser
      # google-chrome     # Browser
      # remmina           # XRDP & VNC Client

      # File Management
      #gnome.file-roller # Archive Manager
      pcmanfm # File Manager
      #rsync # Syncer - $ rsync -r dir1/ dir2/
      #unzip # Zip Files
      #unrar # Rar Files
      #zip # Zip

      # General configuration
      #git              # Repositories
      #killall          # Stop Applications
      #nano             # Text Editor
      #pciutils         # Computer Utility Info
      #pipewire         # Sound
      #usbutils         # USB Utility Info
      #wacomtablet      # Wacom Tablet
      #wget             # Downloader
      #zsh              # Shell


      # Xorg configuration
      #xclip            # Console Clipboard
      #xorg.xev         # Input Viewer
      #xorg.xkill       # Kill Applications
      #xorg.xrandr      # Screen Settings
      #xterm            # Terminal

      # Xorg home-manager
      #flameshot        # Screenshot
      #picom            # Compositer
      #sxhkd            # Shortcuts

      # Wayland configuration
      autotiling # Tiling Script
      #grim             # Image Grabber
      slurp # Region Selector
      swappy # Screenshot Editor
      swayidle # Idle Management Daemon
      wev # Input Viewer
      wl-clipboard # Console Clipboard
      wlr-randr # Screen Settings
      xwayland # X for Wayland

      # Wayland home-manager
      #mpvpaper         # Video Wallpaper
      pamixer # Pulse Audio Mixer
      swaybg # Background
      #swaylock-fancy   # Screen Locker
      waybar # Bar

      # Desktop
      #ansible          # Automation
      blueman # Bluetooth
      #deluge           # Torrents
      #discord          # Chat
      #ffmpeg           # Video Support (dslr)
      #gmtp             # Mount MTP (GoPro)
      #gphoto2          # Digital Photography
      #handbrake        # Encoder
      #heroic           # Game Launcher
      #hugo             # Static Website Builder
      #lutris           # Game Launcher
      #mkvtoolnix       # Matroska Tool
      #plex-media-player# Media Player
      #prismlauncher    # MC Launcher
      #steam            # Games
      #simple-scan      # Scanning
      #sshpass          # Ansible dependency

      # Laptop
      #cbatticon        # Battery Notifications
      #libreoffice      # Office Tools
      #simple-scan      # Scanning

      # Flatpak
      #obs-studio       # Recording/Live Streaming

    ];
  };
  programs = {
    home-manager.enable = true;
    fish.enable = true;
    rofi.enable = true;
  };
  #Themes
  gtk = {
    enable = true;
    theme = {
      name = "vimix-dark-doder";
      package = pkgs.vimix-gtk-themes;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrains Mono Medium";
      #name = "FiraCode Nerd Font Mono Medium";
    }; # Cursor is declared under home.pointerCursor
  };
  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;
}
