{ inputs, global, ... }:
let gtk = import ./theme/gtk.nix { inherit global; };
in {
  imports = [
    (import ./modules/programs/fish.nix { inherit global; })
    (import ./packages.nix { inherit global; })
    (import ./theme/gtk.nix { inherit global; })
    ./modules/programs/waybar.nix
    ./modules/programs/tmux.nix
    ./modules/programs/vscode.nix
    ./modules/programs/alacritty.nix
    ./modules/services/mpd.nix
    ./modules/programs/rofi.nix
  ];
  home = {
    stateVersion = "24.05";
    homeDirectory = "/home/${global.user}";
    username = "${global.user}";
  };
  programs = {
    home-manager.enable = true;
    emacs.enable = true;
  };
  systemd.user.targets.tray =
    { # Tray.target can not be found when xsession is not enabled. This fixes the issue.
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = [ "sxiv.desktop" ];
        "image/png" = [ "sxiv.desktop" ];
        "text/plain" = "nvim.desktop";
        "text/html" = "nvim.desktop";
        "text/csv" = "nvim.desktop";
        "application/pdf" = [ "sioyek.desktop" "google-chrome.desktop"  ];
        "x-scheme-handler/http" = [  "google-chrome.desktop" "brave.desktop" "firefox.desktop"];
        "x-scheme-handler/https" = [  "google-chrome.desktop" "brave.desktop" "firefox.desktop"];
        "x-scheme-handler/about" = [  "google-chrome.desktop" "brave.desktop" "firefox.desktop"];
        "x-scheme-handler/unknown" = [  "google-chrome.desktop" "brave.desktop" "firefox.desktop"];
        "audio/mp3" = "vlc.desktop";
        "video/mp4" = "vlc.desktop";
        "video/x-matroska" = "vlc.desktop";
        "inode/directory" = "nautilus.desktop";
      };
    };
  };
}
