return {
	{ "rust-lang/rust.vim" }, -- Provides filetype detection and other basic rust support
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	{
		"nwiizo/cargo.nvim",
		build = "cargo build --release",
		config = function()
			require("cargo").setup({
				float_window = true,
				window_width = 0.8,
				window_height = 0.8,
				border = "rounded",
				auto_close = true,
				close_timeout = 5000,
			})
		end,
		ft = { "rust" },
		cmd = {
			"CargoBench",
			"CargoBuild",
			"CargoClean",
			"CargoDoc",
			"CargoNew",
			"CargoRun",
			"CargoRunTerm",
			"CargoTest",
			"CargoUpdate",
			"CargoCheck",
			"CargoClippy",
			"CargoAdd",
			"CargoRemove",
			"CargoFmt",
			"CargoFix",
		},
	},
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
