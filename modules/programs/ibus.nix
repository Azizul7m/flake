{ pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-configtool
        fcitx5-with-addons
        fcitx5-m17n
        fcitx5-openbangla-keyboard
      ];
    };
  };
  environment = {
    variables = {
      XMODIFIERS = "@im=fcitx";
      INPUT_METHOD = "fcitx";
      SDL_IM_MODULE = "fcitx";
      QT_IM_MODULES = "wayland;fcitx;ibus";
      # QT_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "fcitx";
      IMSETTINGS_MODULE = "fcitx";
    };
  };
}
