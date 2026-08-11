{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ twemoji-color-font ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      roboto
      noto-fonts
      noto-fonts-color-emoji
      lohit-fonts.bengali
      twemoji-color-font
      mononoki
      iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      corefonts
      fontmiscmisc
      fontadobe75dpi
      fontadobe100dpi
    ];

    fontconfig = {
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <!-- Default sans-serif -->
          <match target="pattern">
            <test name="family"><string>sans-serif</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Lohit Bengali</string>       <!-- 👈 Use Lohit for Bangla -->
              <string>Noto Sans CJK SC</string>
              <string>Noto Sans</string>
              <string>Twemoji</string>
            </edit>
          </match>

          <!-- Default serif -->
          <match target="pattern">
            <test name="family"><string>serif</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Lohit Bengali</string>
              <string>Noto Serif CJK SC</string>
              <string>Noto Serif</string>
              <string>Twemoji</string>
            </edit>
          </match>

            <!-- Bangla language fallback -->
          <match target="pattern">
            <test name="lang"><string>bn</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Lohit Bengali</string>
            </edit>
          </match>

          <!-- Monospace fallback for icons/nerd fonts -->
          <match target="pattern">
            <test name="family"><string>monospace</string></test>
            <edit name="family" mode="prepend" binding="strong">
              <string>JetBrainsMono Nerd Font</string>
              <string>Iosevka Nerd Font</string>
            </edit>
          </match>

        </fontconfig>
      '';
    };
  };
}
