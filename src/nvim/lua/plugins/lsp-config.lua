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
        ensure_installed = {"tsserver"}
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
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('i', '<M-k>', vim.lsp.buf.signature_help, {})
    end
  }
}
