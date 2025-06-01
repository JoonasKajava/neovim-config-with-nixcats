return {
	{
		"gitsigns.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("gitsigns").setup({
				["signs"] = {
					["add"] = { ["text"] = "▎" },
					["change"] = { ["text"] = "▎" },
					["changedelete"] = { ["text"] = "▎" },
					["delete"] = { ["text"] = "" },
					["topdelete"] = { ["text"] = "" },
					["untracked"] = { ["text"] = "▎" },
				},
				["signs_staged"] = {
					["add"] = { ["text"] = "▎" },
					["change"] = { ["text"] = "▎" },
					["changedelete"] = { ["text"] = "▎" },
					["delete"] = { ["text"] = "" },
					["topdelete"] = { ["text"] = "" },
				},
			})
		end,
	},
}
