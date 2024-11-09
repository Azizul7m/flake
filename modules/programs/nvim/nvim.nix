{ pkgs, ... }:
let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "<< EOF\n${builtins.readFile file}\nEOF\n";
in{
  home.packages = with pkgs; [ neovim-unwrapped ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      yankring
      neodev-nvim
      {
        plugin = nvim-cmp;
        config = "";
      }

      nvim-lspconfig
      gruvbox-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      lualine-nvim
      nvim-web-devicons

      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-javascript
        p.tree-sitter-typescript
      ]))
      ];
  };
}
