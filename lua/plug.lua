vim.cmd('packadd packer.nvim')

-- require all packages

return require('packer').startup(
	function()
		use 'ArthurPV/vim-moon-color'
	end
)
