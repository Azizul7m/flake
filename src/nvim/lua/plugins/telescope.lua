
return {
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
}
