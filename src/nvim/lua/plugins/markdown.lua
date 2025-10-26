return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },

  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = { context = 10 },
  },
}
