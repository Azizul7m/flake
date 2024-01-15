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
  
  {
    "epwalsh/obsidian.nvim",
    version = "*", 
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/.notes/md/personal",
        },
        {
          name = "work",
          path = "~/.notes/md/work",
        },
      },
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    coofig = function ()
      require("obsidian").setup()
    end
  }
}
