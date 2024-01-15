return{
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.nixfmt,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.completion.spell,
      },
    })
    vim.keymap.set("n", '<leader>gf', vim.lsp.buf.format, {})
    lazy = true
  end
}
