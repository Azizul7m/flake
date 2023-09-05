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
      olive-editor
      #davinci-resolve
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


      # Xorg home-manager
      #flameshot        # Screenshot
      #picom # Compositer
      #sxhkd            # Shortcuts

      # Wayland home-manager
      #mpvpaper # Video Wallpaper
      #pamixer # Pulse Audio Mixer
      #swaybg # Background
      #swaylock # Screen Locker

      # Desktop
      #ansible          # Automation
      irssi
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
