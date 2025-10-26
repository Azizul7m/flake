return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  opts = {
    ensure_installed = {},
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    parser_install_dir = vim.fn.stdpath("data") .. "/treesitter_parsers",
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}
