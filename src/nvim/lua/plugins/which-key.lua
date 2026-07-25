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
      { "<leader>wq", desc = "Quit all" },
      { "<leader>a", group = "AI" },
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code / LSP" },
      { "<leader>d", group = "Debugging" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>m", group = "Multicursor" },
      { "<leader>o", group = "Obsidian / Docker" },
      { "<leader>oo", group = "Obsidian" },
      { "<leader>q", group = "Sessions" },
      { "<leader>r", group = "REST / Kulala" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Tools" },
      { "<leader>td", group = "Database" },
      { "<leader>dp", group = "Python debugging" },
      { "<leader>tr", group = "REST requests" },
      { "<leader>u", group = "UI" },
      { "<leader>z", group = "Zen mode" },
      { "<leader>da", desc = "Direnv allow" },
      { "<leader>dd", desc = "Direnv deny" },
      { "<leader>dr", desc = "Direnv reload" },
      { "<leader>de", desc = "Edit .envrc" },
    })
  end,
}
