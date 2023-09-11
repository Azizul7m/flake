{ config, pkgs, user, ... }:
let
  homePkgs = import ./Packages.nix { inherit (pkgs) pkgs; };
  gtkConf = import ../theme/gtk.nix { inherit (pkgs) pkgs; };
in {
  imports = (import ../modules/programs) ++ (import ../modules/services);
  home = {
    stateVersion = "23.11";
    homeDirectory = "/home/${user}";
    username = user;
    packages = homePkgs.pkgs;
  };
  gtk = gtkConf;
  #enable home-manager
  programs = { home-manager.enable = true; };
  systemd.user.targets.tray =
    { # Tray.target can not be found when xsession is not enabled. This fixes the issue.
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
}
