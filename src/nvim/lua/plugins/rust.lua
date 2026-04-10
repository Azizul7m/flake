return {
	{ "rust-lang/rust.vim" }, -- Provides filetype detection and other basic rust support
	{
		"mrcjkb/rustaceanvim",
		version = "^8", -- Recommended
		ft = { "rust" },
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				-- Plugin configuration
				tools = {},
				-- LSP configuration
				server = {
					on_attach = function(client, bufnr)
						-- you can also put keymaps in here
					end,
					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
								-- Optional: specify the target directory for analyzer artifacts
								-- target = "x86_64-unknown-linux-gnu",
							},
							-- Configure the 'checkOnSave' behavior
							check = {
								enable = true,
								command = "clippy", -- Use clippy instead of 'cargo check'
								-- Optional: add extra arguments to the command
								-- extraArgs = { "--no-deps" },
							},
						},
					},
				},
				-- DAP configuration
				dap = {},
			}
		end,
	},
}
