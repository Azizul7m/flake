{pkgs, ...}: {
  services = {
    hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            splash_offset = 2.0;
            preload =
                [ "~/.wallpapers/glaxy.png ~/.wallpapers/bike.jpg" ];
            wallpaper = [
                "DP-3,~/.wallpapers/glaxy.png"
                "DP-1,~/.wallpapers/bike.jpg"
            ];
        };
    };
  };
}