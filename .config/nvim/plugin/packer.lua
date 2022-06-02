require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Speed
    use 'lewis6991/impatient.nvim'

    -- LSP, Autocomplete and Snippets
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- File tree
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

    -- UI
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Tag management
    use 'ludovicchabant/vim-gutentags'

    -- Utility
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
end)
