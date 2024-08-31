{ pkgs, ... }: {
  home.packages = with pkgs; [ neovim-unwrapped ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    withNodejs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [ vim-nix yankring nvchad nvchad-ui ];
  };
}
