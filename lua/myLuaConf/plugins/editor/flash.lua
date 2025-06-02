return {
	{
		"flash-nvim",
		after = function()
			require("flash").setup()
		end,
		keys = {
			{
				"s",
				'<cmd>lua require("flash").jump()<cr>',
				desc = "Flash",
				mode = { "n", "o", "x" },
				noremap = true,
				silent = true,
			},
			{
				"S",
				'<cmd>lua require("flash").treesitter()<cr>',
				desc = "Flash Treesitter",
				mode = { "n", "o", "x" },
				noremap = true,
				silent = true,
			},
			{
				"r",
				'<cmd>lua require("flash").remote()<cr>',
				desc = "Remote Flash",
				mode = "o",
				noremap = true,
				silent = true,
			},
			{
				"R",
				'<cmd>lua require("flash").treesitter_search()<cr>',
				desc = "Treesitter Search",
				mode = { "o", "x" },
				noremap = true,
				silent = true,
			},
			{
				"<c-s>",
				'<cmd>lua require("flash").toggle()<cr>',
				desc = "Toggle Flash Search",
				mode = "c",
				noremap = true,
				silent = true,
			},
		},
		lazy = true,
	},
}
