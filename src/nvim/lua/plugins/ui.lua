return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          theme = "catppuccin",
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        }
      })
    end
  },
  -- theme
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"
      indent_blankline = {
        enabled = true,
        scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = true,
      }
      illuminate = {
        enabled = true,
        lsp = false
      }
    end
  },
  -- indent
  { 
    "lukas-reineke/indent-blankline.nvim", 
    main = "ibl", 
    opts = {} ,
    config = function ()
      require("ibl").setup({
        whitespace = {
            highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = { enabled = false },
      })
    end
  },
  -- TODO: Need to fix same word highlights; 
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate ").setup({})
    end,
    event = "User FileOpened",
  }
}
