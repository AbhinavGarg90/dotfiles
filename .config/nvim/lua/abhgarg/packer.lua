vim.cmd [[packadd packer.nvim]]
require('packer').init({
  git = {
    clone_timeout = 600,  -- 600 seconds = 10 minutes
  },
})
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', 
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
        require('rose-pine').setup({
                variant = 'main', -- main | moon | dawn
                disable_background = true,
                disable_float_background = true,
                })

        vim.cmd('colorscheme rose-pine')

        -- Force transparency (important)
        vim.cmd([[
                highlight Normal guibg=NONE ctermbg=NONE
                highlight NormalNC guibg=NONE ctermbg=NONE
                highlight EndOfBuffer guibg=NONE ctermbg=NONE
                highlight SignColumn guibg=NONE ctermbg=NONE
                highlight LineNr guibg=NONE ctermbg=NONE
                highlight CursorLineNr guibg=NONE ctermbg=NONE
                highlight NormalFloat guibg=NONE
                highlight FloatBorder guibg=NONE
        ]])
        end
    })

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
    use('m4xshen/autoclose.nvim')
    use('vim-airline/vim-airline')
    use('numToStr/Comment.nvim')
    use('nvim-treesitter/nvim-treesitter-context')
    use('chomosuke/term-edit.nvim')
    -- use('airblade/vim-gitgutter')
    use('lewis6991/gitsigns.nvim')
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            }
        end
    }
    use('https://codeberg.org/andyg/leap.nvim')
    use('ThePrimeagen/harpoon')
    use('github/copilot.vim')
    use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-mini/mini.nvim', opt = true },            -- if you use the mini.nvim suite
    -- requires = { 'nvim-mini/mini.icons', opt = true },        -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({})
    end,
})
end)

