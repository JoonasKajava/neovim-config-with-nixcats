return {
	{
		"todo-comments.nvim",
		after = function()
			require("todo-comments").setup({})
		end,
		cmd = { "TodoTrouble" },
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>xt",
				"<cmd>Trouble todo toggle<cr>",
				desc = "Todo (Trouble)",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>xT",
				"<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
				desc = "Todo/Fix/Fixme (Trouble)",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>st",
				function()
					require("todo-comments.fzf").todo()
				end,
				desc = "Todo",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>sT",
				function()
					require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
		},
	},
}
