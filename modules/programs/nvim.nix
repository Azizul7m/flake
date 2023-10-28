{ pkgs, lib, config, ... }: {
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      withNodeJs = true;
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        plenary-nvim
        gruvbox-material
        mini-nvim
        cmp-nvim-lsp
        cmp_luasnip
        cmp-buffer
        friendly-snippets
        comment-nvim
        nvim-web-devicons
        vim-nix

        {
          plugin = onedarkpro-nvim;
          config = "colorscheme onedark ";
        }
        {
          plugin = lualine-nvim;
          config = ''
            lua << END
                require('lualine').setup()
            END
          '';
        }
        {
          plugin = nvim-tree-lua;
          config = ''
            lua << EOF
              require("nvim-tree").setup()
            EOF
          '';
        }
        { plugin = mason-nvim; }
        {
          plugin = mason-lspconfig-nvim;
          config = ''
            lua << EOF
              require("mason-lspconfig").setup()
              require("mason").setup()
            EOF'';
        }
        {
          plugin = nvim-cmp;
          config = ''
            lua << EOF
              require'cmp'.setup{
                sources = {
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
                  { name = 'buffer' },
                }
              }
            EOF
          '';
        }

        {
          plugin = telescope-nvim;
          config = "";
        }
        {
          plugin = telescope-fzf-native-nvim;
          config = "";
        }

      ];
      extraConfig = lib.fileContents ../../src/nvim/init.lua;
    };
  };
}
