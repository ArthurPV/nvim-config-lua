local lsp = require('lspconfig')
local completion = require('completion')

local chain_complete_list = {
	default = {
		{complete_items = {"lsp", "snippet"}},
		{complete_items = {"path"}, triggered_only = {"/"}},
		{complete_items = {"buffers"}}
	},
	string = {
		{complete_items = {"path"}, triggered_only = {"/"}}
	},
	comment = {
		{complete_items = {"path"}, triggered_only = {"/"}},
		{complete_items = {"snippets"}},
		{complete_items = {"buffers"}}
	}
}

local custom_attach = function(client)
	print("'" .. client.name .. "' language server attached")
	completion.on_attach(
		{
			matching_strategy_list = {"exact", "fuzzy"},
			chain_complete_list = chain_complete_list
		}
	)
end

-- C++ language server
lsp.clangd.setup(
	{
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			custom_attach(client)
		end
	}
)

local cppLang = require('components.lang.cpp')

lsp.efm.setup {
	on_attach = custom_attach,
	init_options = {documentFormatting = true},
	settings = {
		rootMarkers = {".git/"},
		languages = {
			cpp = {cppLang}
		}
	}
}
