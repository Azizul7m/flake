{ pkgs, ... }: {
  programs = {
    rofi = {
      enable = true;
      location = "center";
      # font = "FiraCode Nerd Font Mono 11";
      plugins = with pkgs; [ rofi-emoji rofi-calc ];
    };
  };
}
