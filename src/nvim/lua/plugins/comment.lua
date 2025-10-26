return { {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = {
    pre_hook = function(ctx)
      -- Use Treesitter for JSX/TSX/HTML awareness
      local U = require("Comment.utils")
      local ts_utils = require("ts_context_commentstring.utils")
      local ts_internal = require("ts_context_commentstring.internal")

      if vim.bo.filetype == "typescriptreact"
          or vim.bo.filetype == "javascriptreact"
          or vim.bo.filetype == "html"
          or vim.bo.filetype == "svelte" then
        local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"
        return ts_internal.calculate_commentstring({
          key = type,
          location = ts_utils.get_cursor_location(),
        })
      end
    end,
  },
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
},
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    opts = {
      enable_autocmd = false,
    },
  },
}
