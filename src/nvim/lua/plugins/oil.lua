return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  ---
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

  opts = {
    -- Optional settings that override the default ones
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = false,
    },
    keymaps = {
      ["q"] = "actions.close",
      ["<CR>"] = "actions.select",
      ["<TAB>"] = "actions.select",
      ["l"] = "actions.select",
      ["h"] = "actions.parent",
      ["<M-s>"] = "actions.select_vsplit",
      ["<M-h>"] = "actions.select_split",
      ["<M-t>"] = "actions.select_tab",
      ["<M-p>"] = "actions.preview",
      ["<M-c>"] = "actions.close",
      ["<M-r>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      [";"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["<C-h>"] = "actions.toggle_hidden",
    },
    float = {
      padding = 2,
      max_width = 0.8,
      max_height = 0.7,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
}
