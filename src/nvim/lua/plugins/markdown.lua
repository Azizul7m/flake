return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", 
    lazy = true,
    ft = "markdown",
    event = {
      "BufReadPre ~/.notes/md/**.md",
      "BufNewFile ~/.notes/md/**.md",
    },
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
      vim.opt_local.conceallevel = 2
    end
  },
  {
    'aspeddro/cmp-pandoc.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jbyuki/nabla.nvim', -- optional
      'aspeddro/pandoc.nvim',
    },
    config = function ()
      require'cmp_pandoc'.setup()
      require'pandoc'.setup({
        enable_nabla = true,
      })
    end
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup({
          auto_load = true,         -- whether to automatically load preview when
          close_on_bdelete = true,  -- close preview window on buffer delete
          syntax = true,            -- enable syntax highlighting, affects performance
          theme = 'dark',           -- 'dark' or 'light'
          update_on_change = true,
          app = { 'brave', '--new-window' },
          filetype = { 'markdown' },-- list of filetypes to recognize as markdown
          -- relevant if update_on_change is true
          throttle_at = 200000,     -- start throttling when file exceeds this
          throttle_time = 'auto', 
        })
        -- refer to `configuration to change defaults`
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    'arminveres/md-pdf.nvim',
    branch = 'main', -- you can assume that main is somewhat stable until releases will be made
    lazy = true,
    keys = { { "<leader>om", function() require("md-pdf").convert_md_to_pdf() end, desc = "Markdown preview", }, },
    config = function()
      require('md-pdf').setup({
        preview_cmd = function() return 'sioyek' end
      })
    end,
  },
} 
