local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("river-nvim.lsp.mason")
require("river-nvim.lsp.handlers").setup()
require("river-nvim.lsp.null-ls")
