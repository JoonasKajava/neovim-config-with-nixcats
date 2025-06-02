return {
	{
		"neogen",
		after = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		keys = {
			{
				"<leader>cn",
				function()
					require("neogen").generate()
				end,
				desc = "Generate Annotations",
				mode = "n",
				noremap = true,
				unique = true,
			},
		},
		lazy = true,
	},
}
