return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[     _     ________ ______   _ _    _____ __  __  ]],
			[[    / \   |__  /_ _|__  / | | | |  |___  |  \/  | ]],
			[[   / _ \    / / | |  / /| | | | |     / /| |\/| | ]],
			[[  / ___ \  / /_ | | / /_| |_| | |___ / / | |  | | ]],
			[[ /_/   \_\/____|___/____|\___/|_____/_/  |_|  |_| ]],
			[[                                                  ]],
			[[                Happy codding 🛠️                  ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":enew<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("o", "  Notes", ":Oil --float --preview ~/.notes <CR>"),
			dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
			dashboard.button("c", "  Neovim config", ":e $HOME/.config/nvim/init.lua<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
