return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- for example:
      detection_methods = { "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    }
    require("telescope").load_extension "projects"
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}