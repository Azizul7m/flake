return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local opts = { silent = true }
        vim.keymap.set('n', '<leader> ', builtin.find_files, opts)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
        vim.keymap.set("n", "<leader>bi", builtin.buffers, opts)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim', 
    config= function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown { }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}
