return {
"akinsho/toggleterm.nvim", 
  version = "*",
  config = function()
    require("toggleterm").setup()
    vim.keymap.set('n', "<leader>otl", ":ToggleTerm size=60 direction=vertical<CR>", {})
    vim.keymap.set('n', "<leader>oth", ":ToggleTerm size=100 direction=horizontal<CR>", {})
    vim.keymap.set('n', "<leader>otj", ":ToggleTerm size=10 direction=horizontal<CR>", {})
    vim.keymap.set('n', "<c-`>", ":ToggleTermToggleAll<CR>", {})
    vim.keymap.set('n', "<leader>ott", ":ToggleTermToggleAll<CR>", {})
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  end
}
