return {
"akinsho/toggleterm.nvim", 
  version = "*",
  config = function()
    require("toggleterm").setup()
    vim.keymap.set('n', "<leader>ot", ":ToggleTerm<CR>", {}) 
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end
}
