---@diagnostic disable: missing-fields
return {
	{
		"tailwind-tools.nvim",
		after = function()
			require("lspconfig").tailwindcss.setup({
				filetypes = { "rust" },
			})

			require("tailwind-tools").setup({
				server = {
					override = true,
					settings = {
						experimental = { classRegex = { 'class: "(.*)"' } },
						includeLanguages = { rust = "html" },
					},
				},
			})
		end,
		enabled = true,
		event = "LspAttach",
	},
}
