vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use {'wbthomason/packer.nvim', opt = true}

    -- colors
    use '~/projects/darkplus.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- utils
    use {'mattn/emmet-vim', ft = {'html', 'javascript', 'javascriptreact', 'css'}}
    use 'windwp/nvim-autopairs'
    use 'terrortylor/nvim-comment'
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    -- use 'dart-lang/dart-vim-plugin'

    -- snippets
    use 'hrsh7th/vim-vsnip'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
    }
end)
