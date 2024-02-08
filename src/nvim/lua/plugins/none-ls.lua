return{
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua, -- lua 
        null_ls.builtins.diagnostics.eslint, -- js diagnostics
        null_ls.builtins.formatting.eslint , --js
        null_ls.builtins.formatting.stylelint, --css
        null_ls.builtins.formatting.rustfmt, -- rust formats
        null_ls.builtins.formatting.nixfmt, -- nix
        null_ls.builtins.formatting.shfmt, -- shell
        null_ls.builtins.completion.spell, -- spell
      },
    })
    vim.keymap.set("n", '<leader>gf', vim.lsp.buf.format, {})
    lazy = true
  end
}
