local colorschemeName = nixCats("colorscheme")
if not require("nixCatsUtils").isNixCats then
	colorschemeName = "tokyonight-moon"
end

vim.cmd.colorscheme(colorschemeName)

local ok, notify = pcall(require, "notify")
if ok then
	notify.setup({
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { focusable = false })
		end,
	})
	vim.notify = notify
end

require("lze").load({
	{ import = "myLuaConf.plugins.coding.blink" },
	{ import = "myLuaConf.plugins.coding.comment" },
	{ import = "myLuaConf.plugins.coding.neogen" },
	{ import = "myLuaConf.plugins.completion" },
	{ import = "myLuaConf.plugins.editor.bufferline" },
	{ import = "myLuaConf.plugins.editor.flash" },
	{ import = "myLuaConf.plugins.editor.fzf" },
	{ import = "myLuaConf.plugins.editor.gitsigns" },
	{ import = "myLuaConf.plugins.editor.grug-far" },
	{ import = "myLuaConf.plugins.editor.lualine" },
	{ import = "myLuaConf.plugins.editor.mini-icons" },
	{ import = "myLuaConf.plugins.editor.oil-nvim" },
	{ import = "myLuaConf.plugins.editor.tiny-inline-diagnostic" },
	{ import = "myLuaConf.plugins.editor.todo-comments" },
	{ import = "myLuaConf.plugins.editor.trouble" },
	{ import = "myLuaConf.plugins.editor.vim-wakatime" },

	-- TODO: snacks undo

	{ import = "myLuaConf.plugins.treesitter" },
	{ import = "myLuaConf.plugins.util.startuptime" },
	{ import = "myLuaConf.plugins.editor.which-key" },
	{
		"markdown-preview.nvim",
		-- NOTE: for_cat is a custom handler that just sets enabled value for us,
		-- based on result of nixCats('cat.name') and allows us to set a different default if we wish
		-- it is defined in luaUtils template in lua/nixCatsUtils/lzUtils.lua
		-- you could replace this with enabled = nixCats('cat.name') == true
		-- if you didnt care to set a different default for when not using nix than the default you already set
		for_cat = "general.markdown",
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
		ft = "markdown",
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreview <CR>", mode = { "n" }, noremap = true, desc = "markdown preview" },
			{
				"<leader>ms",
				"<cmd>MarkdownPreviewStop <CR>",
				mode = { "n" },
				noremap = true,
				desc = "markdown preview stop",
			},
			{
				"<leader>mt",
				"<cmd>MarkdownPreviewToggle <CR>",
				mode = { "n" },
				noremap = true,
				desc = "markdown preview toggle",
			},
		},
		before = function(plugin)
			vim.g.mkdp_auto_close = 0
		end,
	},
})
