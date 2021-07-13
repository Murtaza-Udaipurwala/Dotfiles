vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init {
    git = { clone_timeout = 300 },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

return packer.startup(function(use)

    use {'wbthomason/packer.nvim', opt = true}

    -- colors
    use {
        '~/projects/nvim-plugins/darkplus.nvim',
        config = [[require('colors')]],
    }

    use {
        '~/projects/nvim-plugins/poorline.nvim',
        config = [[require('plugins.poorline')]],
    }

    use {
        'norcalli/nvim-colorizer.lua',
        ft = {'html', 'css'},
        config = [[require('plugins.colorizer')]],
    }

    use 'kyazdani42/nvim-web-devicons'


    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[require('plugins.treesitter')]],
    }

    -- utils
    use {
        'mattn/emmet-vim',
        ft = {'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
        opt = true,
    }

    use {
        'windwp/nvim-autopairs',
        config = [[require('plugins.autopairs')]],
        event = "InsertEnter",
    }

    use {
        'terrortylor/nvim-comment',
        config = [[require('plugins.comment')]],
        event = "BufRead",
    }

    use {
        'tpope/vim-surround',
        event = "InsertLeave",
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = [[require('plugins.indent')]],
        ft = {'python'},
        event = "BufWinEnter",
    }


    -- lsp
    use {
        'neovim/nvim-lspconfig',
        config = [[require('lsp')]],
        requires = {
            {'ray-x/lsp_signature.nvim'}
        },
    }

    use {
        'hrsh7th/nvim-compe',
        config = [[require('lsp.compe')]],
        event = "InsertEnter",
    }


    -- snippets
    use {
        'hrsh7th/vim-vsnip',
        after = "nvim-compe"
    }


    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = [[require('plugins.telescope')]],
        requires = {
            {'nvim-lua/popup.nvim', after = "telescope.nvim"},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'}
        },
    }
end)
