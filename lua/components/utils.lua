local M = {}

M.highLevelFormat = function()
	for _, client in pairs(vim.lsp.buf_get_clients()) do
		if client.name == "sumneko_lua" then return end
		if client.name == "tsserver" then return end
		print(string.format("Formating for attached client: %s", client.name))
		vim.lsp.buf.formating_sync(nil, 1000)
	end
end

return M
