local lsp_config = {
  {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup() 
    end
  },
  -- NOTE: mason-lspconfig
  {
    "williamboman/mason-lspconfig",
    config = function()
        require("mason-lspconfig").setup({
        ensure_installed = {"tsserver", "eslint", "lua_ls"}
    })
    end
  },
  -- NOTE: Now neovim talk to lsp server 
  {
    "williamboman/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.tsserver.setup({
         capabilities = capabilities 
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>ai', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>aa', vim.lsp.buf.code_action, {})
      vim.keymap.set('i', '<M-k>', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<space>ad', vim.diagnostic.open_float)
    end
  } ,
  -- everything for for rust
  {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
    lazy = true,
  },
  {
    'saecki/crates.nvim',
    lazy = true,
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = {{ name = "crates" }}
      })
      crates.show()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    lazy = true,
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
}
return lsp_config
