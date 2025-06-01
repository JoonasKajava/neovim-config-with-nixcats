return {
	{
		"lualine.nvim",
		["after"] = function()
			require("lualine").setup((function()
				return {
					options = {
						theme = "auto",
						globalstatus = false,
						disabled_filetypes = {
							statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
							winbar = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "oil" },
						},
					},
					winbar = {
						lualine_a = {},
						lualine_b = { { "filename", path = 1 } },
						lualine_c = { { "navic", navic_opts = { icons = Icons.kinds } } },
						lualine_x = {},
						lualine_y = {},
						lualine_z = {},
					},
					sections = {
						lualine_a = { "mode" },
						lualine_b = { "branch" },
						lualine_c = {
							{
								"diagnostics",
								symbols = {
									error = Icons.diagnostics.Error,
									warn = Icons.diagnostics.Warn,
									info = Icons.diagnostics.Info,
									hint = Icons.diagnostics.Hint,
								},
							},
							{ "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
							{ "lsp_status" },
						},
						lualine_x = {
							Snacks.profiler.status(),
              -- stylua: ignore
              {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = function() return { fg = Snacks.util.color("Statement") } end,
              },
              -- stylua: ignore
              {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = function() return { fg = Snacks.util.color("Constant") } end,
              },
              -- stylua: ignore
              {
                function() return Icons.misc.debug .. " " .. require("dap").status() end,
                cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                color = function() return { fg = Snacks.util.color("Debug") } end,
              },
              -- stylua: ignore
              {
                "diff",
                symbols = {
                  added = Icons.git.added,
                  modified = Icons.git.modified,
                  removed = Icons.git.removed,
                },
                source = function()
                  local gitsigns = vim.b.gitsigns_status_dict
                  if gitsigns then
                    return {
                      added = gitsigns.added,
                      modified = gitsigns.changed,
                      removed = gitsigns.removed,
                    }
                  end
                end,
              },
						},
						lualine_y = {
							{ "progress", separator = " ", padding = { left = 1, right = 0 } },
							{ "location", padding = { left = 0, right = 1 } },
						},
						lualine_z = {
							function()
								return Icons.misc.clock .. os.date("%R")
							end,
						},
					},
					extensions = { "fzf" },
				}
			end)())
		end,
		["enabled"] = true,
		["event"] = { "BufEnter" },
		["lazy"] = true,
	},
}
