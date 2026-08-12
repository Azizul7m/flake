return {
	{
		"bngarren/checkmate.nvim",
		ft = { "markdown", "obsidian" },
		opts = {
			files = {
				vim.fn.expand("~/.notes/**/*.md"),
			},
		},
	},
{
  'wsdjeg/tasks.nvim',
  dependencies = {
    'wsdjeg/code-runner.nvim',
    'wsdjeg/toml.nvim',
  },
  config = function()
    require('tasks').setup()
  end,
}
}
