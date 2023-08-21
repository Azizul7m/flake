{ config, pkgs, lib, user, ... }:

{
  lib.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  programs.waybar =
    {
      enable = true;
      systemd.enable = true;
      #settings = builtins.readFile ../../src/waybar/config;
      style = builtins.readFile ../../src/waybar/waybar.css;
    };
}
