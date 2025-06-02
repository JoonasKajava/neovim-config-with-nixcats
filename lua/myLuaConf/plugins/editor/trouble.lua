return {
	{
		"trouble",
		after = function()
			require("trouble").setup()
		end,
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble toggle diagnostics<CR>",
				desc = "Workspace diagnostics [trouble]",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>xX",
				"<cmd>Trouble toggle diagnostics filter.buf=0<CR>",
				desc = "Document diagnostics [trouble]",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>xQ",
				"<cmd>Trouble toggle quickfix<CR>",
				desc = "QuickFix [trouble]",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"<leader>xL",
				"<cmd>Trouble toggle loclist<CR>",
				desc = "LOCList [trouble]",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
				mode = "n",
				noremap = true,
				silent = true,
				unique = true,
			},
		},
	},
}
