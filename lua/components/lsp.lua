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

-- Vim language server
lsp.vimls.setup(
	{
		on_attach = custom_attach
	}
)

-- Bash language server
lsp.bashls.setup(
	{
		on_attach = custom_attach
	}
)

-- Json language server
lsp.jsonls.setup(
	{
		on_attach = custom_attach
	}
)

-- HTML language server
lsp.html.setup(
	{
		on_attach = custom_attach
	}
)

-- Rust language server
lsp.rust_analyzer.setup(
	{
		on_attach = custom_attach
	}
)

-- Typescript (Javascript) language server
lsp.tsserver.setup(
	{
		on_attach = custom_attach
	}
)

-- Clojure language server
lsp.clojure_lsp.setup(
	{
		on_attach = custom_attach
	}
)

-- Elixir language server
lsp.elixirls.setup(
	{
		on_attach = custom_attach
	}
)

-- Python
lsp.jedi_language_server.setup(
	{
		on_attach = custom_attach
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
