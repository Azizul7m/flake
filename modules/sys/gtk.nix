{ config, pkgs, ... }: {
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
  fonts = {
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      localConf = ''
        <match target="pattern">
            <test qual="any" name="family">
                <string>serif</string>
            </test>
            <edit name="family" mode="assign" binding="strong">
                <string>Hind Siliguri</string>
                <string>Noto Sans</string>
            </edit>
        </match>
      '';
    };
  };
}
