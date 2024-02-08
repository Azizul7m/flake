return {
    {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
      require("neorg").setup {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              TODO = "~/.notes/md/TODOs",
              HOME = "~/notes/md/home",
            }
          }
        }
      }
    end,
  },
}
