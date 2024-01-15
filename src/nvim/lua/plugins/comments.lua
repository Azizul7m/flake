return {
  { "numToStr/Comment.nvim",
  config = function()
   require('Comment').setup()
  end,
  keys = { 
    { "gc", mode = { "n", "v" } }, 
    { "gb", mode = { "n", "v" } } 
  },
  event = "User FileOpened",
},
  
{
  "folke/todo-comments.nvim",
  opts = { },
    config = function ()
      local todo = require("todo-comments")
      todo.setup({})
      vim.keymap.set('n', "<leader>nt", ":TodoTelescope<CR>", {})
    end
  }
}
