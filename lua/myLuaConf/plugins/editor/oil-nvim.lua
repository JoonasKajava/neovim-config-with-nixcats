return {
	{
		"oil.nvim",
		after = function()
			require("oil").setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
			})
		end,
		cmd = { "Oil" },
		enabled = true,
		keys = {
			{
				"<leader>e",
				":Oil<cr>",
				desc = "Open Oil file explorer",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
		},
		lazy = true,
	},
}
