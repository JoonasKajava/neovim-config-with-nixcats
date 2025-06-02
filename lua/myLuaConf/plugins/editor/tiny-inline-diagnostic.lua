return {
	{
		"tiny-inline-diagnostic.nvim",
		after = function()
			require("tiny-inline-diagnostic").setup({ preset = "powerline" })
		end,
		event = { "LspAttach" },
		lazy = true,
		priority = 99999,
	},
}
