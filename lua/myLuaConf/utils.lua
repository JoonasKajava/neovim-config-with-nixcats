---@class Utils
---@field format function
-- Set of universal utility functions for my Neovim configuration.
local M = {}

---@param opts? {buf?:number}
--- Formats using Conform
function M.format(opts)
	opts = opts or {}
	local buf = opts.buf or vim.api.nvim_get_current_buf()
	require("conform").format({
		bufnr = buf,
		lsp_format = "fallback",
	})
end

return M
