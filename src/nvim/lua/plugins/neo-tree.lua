
  return{ "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim", },
      config = function()
          vim.keymap.set('n', '<leader>op', ':Neotree filesystem toggle right<CR>')
          vim.keymap.set('n', '<leader>fr', ':Neotree filesystem reveal left<CR>')
      end

  }

