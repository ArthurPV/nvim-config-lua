vim.cmd('packadd packer.nvim')

-- require all packages

return require('packer').startup(
	function()
		use 'ArthurPV/vim-moon-color'
		use 'kyazdani42/nvim-tree.lua'
		use 'kyazdani42/nvim-web-devicons'
	end
)
