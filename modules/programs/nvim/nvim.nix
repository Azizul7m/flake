{ inputs, pkgs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    luaLoader.enable = true;
    colorschemes.gruvbox.enable = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    plugins = import ./plugins/default.nix;
    globalOpts = import ./opts.nix;
    keymaps = import ./keys.nix;
  };
}


