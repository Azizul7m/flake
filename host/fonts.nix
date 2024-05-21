{ config, pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-emoji
      lohit-fonts.bengali
      iosevka
      jetbrains-mono
      fantasque-sans-mono
      font-awesome # Icons
      corefonts # MS
      (nerdfonts.override {
        # Nerdfont Icons override
        fonts = [ "FiraCode" ];
      })
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.rgba = "rgb";
      defaultFonts = {
        serif = [ "Iosevka" ];
        sansSerif = [ "Iosevka" ];
        monospace = [ "Iosevka" ];
      };
      localConf = ''
        <match target="pattern">
          <test name="family"><string>sans-serif</string></test>
          <edit name="family" mode="prepend" binding="strong">
            <string>Lohit Bengali</string>
          </edit>
        </match>
        <match target="pattern">
          <test name="family"><string>serif</string></test>
          <edit name="family" mode="prepend" binding="strong">
            <string>Roboto</string>
          </edit>
        </match>
        <match target="pattern">
          <test name="family"><string>monospace</string></test>
          <edit name="family" mode="prepend" binding="strong">
            <string>Ubuntu</string>
          </edit>
        </match>
      '';
    };
  };
}
