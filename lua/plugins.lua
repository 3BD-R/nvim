return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- cmp
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	use 'onsails/lspkind-nvim'

	-- lsp
	use 'neovim/nvim-lspconfig'

	-- dart
	use 'dart-lang/dart-vim-plugin'

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'p00f/nvim-ts-rainbow'

	-- use 'williamboman/nvim-lsp-installer'
	use 'williamboman/mason.nvim'

end)
