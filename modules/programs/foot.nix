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
    settings = lib.mkMerge [
      {
        main = {
          # Font configuration - Iosevka with icon and bengali support
          font = "Iosevka:size=9";
          font-bold = "Iosevka:weight=bold:size=9";
          font-italic = "Iosevka:style=italic:size=9";
          font-bold-italic = "Iosevka:weight=bold:style=italic:size=9";
          # Selection and interaction - matching kitty
          selection-target = "clipboard";
          workers = 4;
          login-shell = "yes";
        };
      }
    ];
  };
}
