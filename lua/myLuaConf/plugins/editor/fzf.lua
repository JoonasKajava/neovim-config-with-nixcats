return {
	{
		"fzf-lua",
		for_cat = "fzf",
		after = function()
			require("fzf-lua").setup({
				"default",
				files = {
					actions = {
						["alt-h"] = { require("fzf-lua").actions.toggle_hidden },
						["alt-i"] = { require("fzf-lua").actions.toggle_ignore },
					},
					cwd_prompt = false,
				},
				grep = {
					actions = {
						["alt-h"] = { require("fzf-lua").actions.toggle_hidden },
						["alt-i"] = { require("fzf-lua").actions.toggle_ignore },
					},
				},
				lsp = {
					code_actions = {
						preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style=omit --file-style=omit",
						previewer = "codeaction_native",
						prompt = ">",
					},
				},
				winopts = { border = "rounded" },
			})
		end,
		cmd = { "FzfLua" },
	},
}
