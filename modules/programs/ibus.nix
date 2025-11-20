{ pkgs, pkgsStable, ... }: {
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      enableGtk3 = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = [ pkgs.fcitx5-openbangla-keyboard ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    fcitx5
    fcitx5-gtk
    catppuccin-fcitx5
    fcitx5-openbangla-keyboard
  ];
}
