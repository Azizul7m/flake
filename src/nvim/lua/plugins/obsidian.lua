return {
  "epwalsh/obsidian.nvim",
  version = "*", 
  lazy = true,
  ft = "markdown",
  -- event = {
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function ()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "$HOME/.notes/obs_notes/personal",
        },
        {
          name = "work",
          path = "$HOME/.notes/obs_notes/works",
        },
      },
    })
  end
}
