return {
  --#======================================
  --# GitHub Copilot
  --#======================================
  {
  "zbirenbaum/copilot.lua",
  requires = {
   "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
  require("copilot").setup({
     suggestion = { enabled = true },
     panel = { enabled = false },
  })
   end,
  },
  --#======================================
  --# Integration with nvim-cmp
  --#======================================
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}
