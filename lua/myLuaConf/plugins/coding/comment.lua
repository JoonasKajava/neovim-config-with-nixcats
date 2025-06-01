return {
	{
		"comment-nvim",
		["after"] = function()
			require("Comment").setup({ ["mappings"] = { ["basic"] = true, ["extra"] = false } })
		end,
		["keys"] = {
			{
				"gc",
				"<Plug>(comment_toggle_linewise)",
				["desc"] = "Toggle line comment",
				["mode"] = "n",
				["noremap"] = true,
				["silent"] = true,
			},
			{
				"gb",
				"<Plug>(comment_toggle_blockwise)",
				["desc"] = "Toggle block comment",
				["mode"] = "n",
				["noremap"] = true,
				["silent"] = true,
			},
			{
				"gcc",
				function()
					return vim.api.nvim_get_vvar("count") == 0 and "<Plug>(comment_toggle_linewise_current)"
						or "<Plug>(comment_toggle_linewise_count)"
				end,
				["desc"] = "Toggle current line comment",
				["expr"] = true,
				["mode"] = "n",
				["noremap"] = true,
				["silent"] = true,
			},
			{
				"gbc",
				function()
					return vim.api.nvim_get_vvar("count") == 0 and "<Plug>(comment_toggle_blockwise_current)"
						or "<Plug>(comment_toggle_blockwise_count)"
				end,
				["desc"] = "Toggle current block comment",
				["expr"] = true,
				["mode"] = { "n" },
				["noremap"] = true,
				["silent"] = true,
			},
			{
				"gc",
				"<Plug>(comment_toggle_linewise_visual)",
				["desc"] = "Toggle selected comment",
				["mode"] = "x",
				["noremap"] = true,
				["silent"] = true,
			},
			{
				"gb",
				"<Plug>(comment_toggle_blockwise_visual)",
				["desc"] = "Toggle selected block",
				["mode"] = "x",
				["noremap"] = true,
				["silent"] = true,
			},
		},
	},
}
