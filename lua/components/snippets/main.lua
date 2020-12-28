local snippets = require('snippets')

-- languagge
local cpp_snippets = require('components.snippets.cpp')

snippets.snippets = {
	_global = {
		todo = "TODO(Components)",
		uname = function()
			return vim.loop.os_uname.sysname
		end,
		date = os.date
	},
	cpp = cpp_snippets
}
