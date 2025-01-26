{ inputs, pkgs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };
}
