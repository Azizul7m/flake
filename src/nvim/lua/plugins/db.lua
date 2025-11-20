return {
  {
    "tpope/vim-dadbod",
    lazy = false,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
