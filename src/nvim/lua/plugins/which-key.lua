return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
  },
  config = function(_, opts)
    local wk = require("which-key")

    wk.setup(opts)
    wk.add({
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      { "<leader>wm", desc = "Toggle maximize window" },
      { "<leader>wQ", desc = "Quit all" },
    })
  end,
}
