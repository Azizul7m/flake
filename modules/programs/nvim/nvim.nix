{ inputs, pkgs, ... }: {
  imports = [ inputs.nixvim.homeModules.nixvim ];
  programs.nixvim = {
    enable = true;
    luaLoader.enable = true;
    extraConfigLua = builtins.readFile ./native_config.lua;
    colorschemes.catppuccin = { enable = true; };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    plugins = import ./plugins/default.nix;
    globalOpts = import ./opts.nix;
    keymaps = import ./keys.nix;
  };
}

