return {
	{
		"blink-cmp",
		event = "InsertEnter",
		after = function()
			require("blink.cmp").setup({
				appearance = { kind_icons = Icons.kinds, nerd_font_variant = "mono" },
				cmdline = { enabled = false, keymap = { preset = "none" }, sources = {} },
				completion = {
					accept = { auto_brackets = { enabled = true } },
					documentation = { auto_show = true, auto_show_delay_ms = 100 },
					ghost_text = { enabled = vim.g.ai_cmp },
					menu = {
						auto_show = true,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "source_name" },
							},
							treesitter = { "lsp" },
						},
					},
				},
				fuzzy = { implementation = "prefer_rust", prebuilt_binaries = { download = false } },
				keymap = {
					["<C-Space>"] = { "show", "fallback" },
					["<C-d>"] = { "scroll_documentation_up", "fallback" },
					["<C-e>"] = { "hide", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
					["<C-y>"] = { "select_and_accept" },
					["<CR>"] = { "accept", "fallback" },
					["<Down>"] = {
						"select_next",
						"snippet_forward",
						function(cmp)
							local line, col = unpack(vim.api.nvim_win_get_cursor(0))
							local has_words_before = col ~= 0
								and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
									== nil

							if has_words_before then
								return cmp.show()
							end
						end,
						"fallback",
					},
					["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
					preset = "enter",
				},
				signature = { enabled = true },
				snippets = { preset = "luasnip" },
				sources = {
					default = {
						"lazydev",
						"lsp",
						"path",
						"snippets",
						"buffer",
						"copilot",
						"crates",
						"copilot",
						"ripgrep",
					},
					providers = {
						copilot = { async = true, module = "blink-copilot", name = "copilot" },
						crates = { module = "blink.compat.source", name = "crates" },
						ripgrep = { module = "blink-ripgrep", name = "ripgrep" },
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100, -- show at a higher priority than lsp
						},
					},
				},
			})
		end,
	},
	{
		"copilot-lua",
		after = function()
			require("copilot").setup({
				panel = {
					enabled = false,
					keymap = {
						accept = false,
						jump_next = false,
						jump_prev = false,
						open = false,
						refresh = false,
					},
					layout = { position = "bottom", ratio = 0.400000 },
				},
				suggestion = {
					enabled = false,
					keymap = {
						accept = false,
						accept_line = false,
						accept_word = false,
						dismiss = false,
						next = false,
						prev = false,
					},
				},
			})
		end,
		cmd = { "Copilot", "CopilotAuth", "CopilotDetach", "CopilotPanel", "CopilotStop" },
		event = { { event = "User", pattern = "LazyFile" } },
		keys = {},
	},
	{
		"luasnip",
		after = function()
			require("luasnip").setup({
				delete_check_events = "TextChanged",
				enable_autosnippets = false,
				history = true,
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		lazy = true,
	},
}
