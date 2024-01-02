return{
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
        ensure_installed = {"lua_ls", "tsserver", "rust-analyzer"}
    })
    end
  },
  -- NOTE: Now neovim talk to lsp server 
  {
    "williamboman/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('i', '<M-k>', vim.lsp.buf.signature_help, {})
    end
  }
}
