{ config, pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      iosevka
      jetbrains-mono
      fantasque-sans-mono
      font-awesome # Icons
      noto-fonts-emoji
      corefonts # MS
      (nerdfonts.override {
        # Nerdfont Icons override
        fonts = [ "FiraCode" ];
      })
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Iosevka" ];
        sansSerif = [ "Iosevka" ];
        monospace = [ "Iosevka" ];
      };
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
