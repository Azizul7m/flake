{ config, pkgs, user, ... }: {
  imports = (import ../modules/programs);

  home = {
    stateVersion = "23.11";
    homeDirectory = "/home/${user}";
    username = user;
    packages = with pkgs; [
      # Video/Audio
      # plex-media-player # Media Player
      # vlc # Media Player
      # stremio           # Media Streamer
      # Apps
      gimp # Photo Editor
      inkscape
      #android-file-transfer
      figma-linux
      # remmina           # XRDP & VNC Client

      # File Management
      #pcmanfm # File Manager
      anydesk
      qbittorrent
      #darktable
      #krita
      blender
      #davinci-resolve
      libsForQt5.kdenlive
      mediainfo #for kdenlive
      glaxnimate #for kdenlive
      #pureref
      # General configuration
      #wacomtablet      # Wacom Tablet

      # Emacs Stuff
      graphviz # org-mode visualization
      scrot # screenshot
      emacsPackages.sqlite3
      libvterm #Emacs Vterm
      editorconfig-core-c #Editor config
      wl-clipboard #for emacs org-mode

      # Xorg configuration
      # xclip # Console Clipboard
      # xorg.xev # Input Viewer
      #xorg.xkill       # Kill Applications
      # xorg.xrandr # Screen Settings

      # Xorg home-manager
      #flameshot        # Screenshot
      #picom # Compositer
      #sxhkd            # Shortcuts

      # Wayland configuration
      #autotiling # Tiling Script
      #grim # Image Grabber
      #slurp # Region Selector
      #swappy # Screenshot Editor
      #wev # Input Viewer
      #wl-clipboard # Console Clipboard
      #swayimg
      #wofi
      #bemenu

      # Wayland home-manager
      #mpvpaper # Video Wallpaper
      #pamixer # Pulse Audio Mixer
      #swaybg # Background
      #swaylock # Screen Locker

      # Desktop
      #ansible          # Automation
      discord # Chat
      tdesktop # Telegram
      whatsapp-for-linux
      #dropbox
      #skypeforlinux
      # gmtp # Mount MTP (GoPro)
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
      # simple-scan # Scanning
      #onlyoffice-bin # Office Tools
      # Flatpak
      # obs-studio # Recording/Live Streaming

      # Development
      mongodb-compass
      starship
      #jetbrains.datagrip
    ];
  };
}
