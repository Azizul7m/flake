  -- LSP Support
return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      -- Setup neodev first (for Neovim Lua development)
      require("neodev").setup({
        library = {
          plugins = { "nvim-dap-ui" },
          types = true,
        },
      })

      -- Initialize mason and mason-lspconfig
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "bashls" },
        automatic_installation = true,
      })

    local handlers = require("plugins.lsp.handlers")
    local on_attach = handlers.on_attach
    local capabilities = handlers.capabilities

    -- Configure lua_ls separately to use the system-installed language server,
    -- which is required on NixOS.
     vim.lsp.config['luals'] = {
       cmd = { 'lua-language-server' },
       filetypes = { 'lua' },
     }
     vim.lsp.enable('luals')
    end,
  }
