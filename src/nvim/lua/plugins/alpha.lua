return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[    ___    __                          __  _             ]],
			[[   /   |  / /_  ____ __________ _____/ /_(_)___  ____ _ ]],
			[[  / /| | / __ \/ __ `/ ___/ __ `/ __  / / / __ \/ __ `/ ]],
			[[ / ___ |/ / / / /_/ / /  / /_/ / /_/ / / / / / / /_/ /  ]],
			[[/_/  |_/_/ /_/\__,_/_/   \__,_/\__,_/_/_/_/ /_/\__, /   ]],
			[[                                             /____/    ]],
			[[                  Welcome, Azizul7M                     ]],
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
