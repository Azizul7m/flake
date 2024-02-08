{config, global, ...}: {
  programs = {
    waybar = {
      enable = true;
      # systemd.enable = true;
    };
  };

  home.file= {
    "config.waybar" = {
        source = ../../../src/waybar;
        target = "${config.home.homeDirectory}/.config/waybar";
    };
    "config.swaync" = {
      source = ../../../src/swaync ;
      target = "${config.home.homeDirectory}/.config/swaync";
    };
    "config.wofi" = {
      source = ../../../src/wofi;
      target = "${config.home.homeDirectory}/.config/wofi";
    };
    "config.hypr" = {
      source = ../../../src/hypr;
      target = "${config.home.homeDirectory}/.config/hypr";
    };
  };
}
