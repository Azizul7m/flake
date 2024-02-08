return {
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'    
    },
    config = function()
        require('lspsaga').setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
      vim.keymap.set('n', '<leader>gs', ':Gitsigns<CR>')
    end,
    event = "User FileOpened",
    cmd = "Gitsigns",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function ()
      local neogit = require('neogit')
      neogit.setup {}
    end
  },
}
