{ config, pkgs, lib, ... }:
{
  programs = {
    fish.interactiveShellInit = ''
      eval "$(${pkgs.direnv}/bin/direnv hook fish)"
    '';
  };

  services.lorri.enable = true;
}
