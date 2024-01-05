return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
       "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
      }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      "hrsh7th/cmp-cmdline"
    },
    config = function ()
      local cmp = require'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
         completion = cmp.config.window.bordered(),
         documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<S-tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<tab>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion

          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 }, -- LSP
          { name = "luasnip" , priority = 900}, -- snippets
          { name = "buffer" , priority = 800}, -- text within the current buffer
          { name = "path" , priority = 600}, -- file system paths
        }),
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    end
  }
}
