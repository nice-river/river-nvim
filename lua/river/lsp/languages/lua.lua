local M = {}

local conf = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

function M.setup(opts)
	opts = vim.tbl_deep_extend("force", conf, opts)
	require("lspconfig").lua_ls.setup(opts)
end

return M
