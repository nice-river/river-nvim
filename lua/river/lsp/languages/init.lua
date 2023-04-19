local servers = {
	"lua",
	"rust",
}

M = {}

for _, server in pairs(servers) do
	local status_ok, _ = pcall(require, "lspconfig")
	if status_ok then
		table.insert(M, require("river.lsp.languages." .. server))
	end
end

return M
