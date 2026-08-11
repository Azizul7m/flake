{
  pkgs,
  lib,
  ...
}:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    package = pkgs.foot;
    settings = {
      cursor = {
        style = "beam";
      };
      colors-dark = {
        alpha = "0.9";
        alpha-mode = "matching";
      };
      url-bindings = {
        toggle-url-visible = "t";
      };
      main = {
        font = "Iosevka Nerd Font:size=9";
        font-bold = "Iosevka Nerd Font:weight=bold:size=9";
        font-italic = "Iosevka Nerd Font:style=italic:size=9";
        font-bold-italic = "Iosevka Nerd Font:weight=bold:style=italic:size=9";
        selection-target = "clipboard";
        workers = 4;
        login-shell = "yes";
      };
    };
  };
}
