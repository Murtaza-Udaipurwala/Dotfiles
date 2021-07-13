local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        selection_caret = ' ',
        prompt_prefix = '  ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        -- path_display = { "shorten" },

        vimgrep_arguments = {
            "rg",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },

        file_ignore_patterns = {
            "__pycache__",
            "node_modules",
            ".mkv",
            ".png",
            ".jpg",
            ".jpeg",
            ".webp",
            ".pdf",
            ".epub",
            ".mp3",
            ".mp4",
            ".m4a",
            ".opus",
            ".flac"
        },

        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close,
                ["<C-x>"] = false,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

local map = vim.api.nvim_set_keymap
map('n', '<C-p>', ':lua require("telescope.builtin").find_files()<CR>', {noremap = true, silent = true})
map('n', '<C-g>', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("grep for > ")})<CR>', {noremap = true, silent = true})
map('n', '<leader>b', ':lua require("telescope.builtin").buffers()<CR>', {noremap = true, silent = true})
map('n', '<leader>gw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>', {noremap = true, silent = true})
map('n', '<leader>gn', ':lua require("plugins.telescope").search_dotfiles()<CR>', {noremap = true, silent = true})

return M
