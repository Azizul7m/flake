{ config, pkgs, user, ... }:
{
  imports =
    (import ../modules/programs) ++
    (import ../modules/services);

  home = {
    stateVersion = "22.11";
    homeDirectory = "/home/${user}";
    username = user;
    packages = with pkgs; [
      # General home-manager
      alacritty # Terminal Emulator
      kitty
      dunst # Notifications
      libnotify # Dependency for Dunst
      # Terminal
      btop # Resource Manager
      nitch # Minimal fetch
      ranger # File Manager
      tldr # Helper
      neovim
      starship
      exa
      stow
      htop
      neofetch
      grc
      # Video/Audio
      feh # Image Viewer
      mpv # Media Player
      pavucontrol # Audio Control
      # plex-media-player # Media Player
      vlc # Media Player
      # stremio           # Media Streamer
      nitrogen

      # Apps
      appimage-run # Runs AppImages on NixOS
      firefox # Browser
      google-chrome # Browser
      gimp # Photo Editor
      zathura
      figma-linux
      wezterm
      # remmina           # XRDP & VNC Client

      # File Management
      gnome.file-roller # Archive Manager
      pcmanfm # File Manager
      rsync # Syncer - $ rsync -r dir1/ dir2/
      anydesk
      qbittorrent
      darktable
      krita
      # General configuration
      #wacomtablet      # Wacom Tablet

      # Xorg configuration
      xclip # Console Clipboard
      xorg.xev # Input Viewer
      #xorg.xkill       # Kill Applications
      xorg.xrandr # Screen Settings

      # Xorg home-manager
      #flameshot        # Screenshot
      picom # Compositer
      #sxhkd            # Shortcuts

      # Wayland configuration
      autotiling # Tiling Script
      grim # Image Grabber
      slurp # Region Selector
      swappy # Screenshot Editor
      wev # Input Viewer
      wl-clipboard # Console Clipboard
      swayimg
      wofi
      bemenu

      # Wayland home-manager
      mpvpaper # Video Wallpaper
      pamixer # Pulse Audio Mixer
      swaybg # Background
      swaylock-fancy   # Screen Locker

      # Desktop
      #ansible          # Automation
      discord # Chat
      tdesktop # Telegram
      dropbox
      gmtp # Mount MTP (GoPro)
      #handbrake        # Encoder
      #heroic           # Game Launcher
      #hugo             # Static Website Builder
      #lutris           # Game Launcher
      #plex-media-player# Media Player
      #prismlauncher    # MC Launcher
      #steam            # Games
      #simple-scan      # Scanning
      #sshpass          # Ansible dependency


      # Laptop
      simple-scan # Scanning
      onlyoffice-bin # Office Tools
      # Flatpak
      #obs-studio       # Recording/Live Streaming

      # Development
      nodejs
      rustup
      python3
    ];
  };
  programs = {
    home-manager.enable = true;
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
      name = "Iosevka Medium";
      #name = "FiraCode Nerd Font Mono Medium";
    }; # Cursor is declared under home.pointerCursor
  };
  systemd.user.targets.tray = {
    # Tray.target can not be found when xsession is not enabled. This fixes the issue.
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;
}
