return {
	{
		"mini.icons",
		after = function()
			require("mini.icons").setup({
				file = {
					[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
					["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
				},
				filetype = { dotenv = { glyph = "", hl = "MiniIconsYellow" } },
			})
		end,
		before = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.preload["nvim-web-devicons"]
			end
		end,
		enabled = true,
		lazy = true,
	},
}
