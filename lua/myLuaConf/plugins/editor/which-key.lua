---@diagnostic disable: missing-fields
return {
	{
		"which-key.nvim",
		event = "DeferredUIEnter",
		after = function()
			local wk = require("which-key")
			wk.setup({
				preset = "modern",
				defaults = {},
				spec = {
					{
						mode = { "n", "v" },
						{ "<leader><tab>", group = "tabs" },
						{ "<leader>c", group = "code" },
						{ "<leader>l", group = "lsp" },
						{ "<leader>d", group = "debug" },
						{ "<leader>dp", group = "profiler" },
						{ "<leader>f", group = "file/find" },
						{ "<leader>g", group = "git" },
						{ "<leader>gh", group = "hunks" },
						{ "<leader>q", group = "quit/session" },
						{ "<leader>s", group = "search" },
						{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
						{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
						{ "[", group = "prev" },
						{ "]", group = "next" },
						{ "g", group = "goto" },
						{ "gs", group = "surround" },
						{ "z", group = "fold" },
						{
							"<leader>b",
							group = "buffer",
							expand = function()
								return require("which-key.extras").expand.buf()
							end,
						},
						{
							"<leader>w",
							group = "windows",
							proxy = "<c-w>",
							expand = function()
								return require("which-key.extras").expand.win()
							end,
						},
						-- better descriptions
						{ "gx", desc = "Open with system app" },
					},
				},
			})

			wk.add({
				{ "<leader>g", desc = "+Gitsigns" },
				{ "<leader>lw", desc = "+Workspace" },
				{ "<leader>x", desc = "+Trouble" },
			})
		end,
	},
}
