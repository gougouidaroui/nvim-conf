vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
      'goolord/alpha-nvim',
      requires = {
          "RchrdAriza/nvim-web-devicons",
          'nvim-lua/plenary.nvim'
      },
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

          {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use ('nvim-lua/plenary.nvim') -- don't forget to add this one if you don't have it yet!
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use("laytan/cloak.nvim")
end)

