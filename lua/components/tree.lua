local treeSitter = require('nvim-treesitter.configs')

treeSitter.setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
	inceremental_selection = {
		enable = true,

		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grn",
		},
	},
	indent = {
		enable = false,
	}
}
