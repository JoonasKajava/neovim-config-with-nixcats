return {
	{
		"bufferline.nvim",
		event = "BufEnter",
		after = function()
			require("bufferline").setup({
				options = {
					always_show_bufferline = false,
					close_command = function(n)
						Snacks.bufdelete(n)
					end,
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(_, _, diag)
						local icons = Icons.diagnostics
						local ret = (diag.error and icons.Error .. diag.error .. " " or "")
							.. (diag.warning and icons.Warn .. diag.warning or "")
						return vim.trim(ret)
					end,
					get_element_icon = function(opts)
						return Icons.ft[opts.filetype]
					end,
					offsets = {
						{
							filetype = "neo-tree",
							highlight = "Directory",
							text = "Neo-tree",
							text_align = "left",
						},
						{ filetype = "snacks_layout_box" },
					},
					right_mouse_command = function(n)
						Snacks.bufdelete(n)
					end,
				},
			})
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
		enabled = true,
		keys = {
			{
				"<leader>bp",
				"<Cmd>BufferLineTogglePin<CR>",
				desc = "Toggle Pin",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"<leader>bP",
				"<Cmd>BufferLineGroupClose ungrouped<CR>",
				desc = "Delete Non-Pinned Buffers",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"<leader>br",
				"<Cmd>BufferLineCloseRight<CR>",
				desc = "Delete Buffers to the Right",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"<leader>bl",
				"<Cmd>BufferLineCloseLeft<CR>",
				desc = "Delete Buffers to the Left",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"<S-h>",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Prev Buffer",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"<S-l>",
				"<cmd>BufferLineCycleNext<cr>",
				desc = "Next Buffer",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"[b",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Prev Buffer",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"]b",
				"<cmd>BufferLineCycleNext<cr>",
				desc = "Next Buffer",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"[B",
				"<cmd>BufferLineMovePrev<cr>",
				desc = "Move buffer prev",
				mode = "n",
				noremap = true,
				silent = true,
			},
			{
				"]B",
				"<cmd>BufferLineMoveNext<cr>",
				desc = "Move buffer next",
				mode = "n",
				noremap = true,
				silent = true,
			},
		},
	},
}
