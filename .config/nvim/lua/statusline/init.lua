local api = vim.api
local fn = vim.fn
local trunc_width = 65

local modes = setmetatable({
    ['n']  = {'Normal', 'N'};
    ['no'] = {'N·Pending', 'N·P'} ;
    ['v']  = {'Visual', 'V' };
    ['V']  = {'V·Line', 'V·L' };
    [''] = {'V·Block', 'V·B'};
    ['s']  = {'Select', 'S'};
    ['S']  = {'S·Line', 'S·L'};
    [''] = {'S·Block', 'S·B'};
    ['i']  = {'Insert', 'I'};
    ['ic'] = {'Insert', 'I'};
    ['R']  = {'Replace', 'R'};
    ['Rv'] = {'V·Replace', 'V·R'};
    ['c']  = {'Command', 'C'};
    ['cv'] = {'Vim·Ex ', 'V·E'};
    ['ce'] = {'Ex ', 'E'};
    ['r']  = {'Prompt ', 'P'};
    ['rm'] = {'More ', 'M'};
    ['r?'] = {'Confirm ', 'C'};
    ['!']  = {'Shell ', 'S'};
    ['t']  = {'Terminal ', 'T'};
}, {
    __index = function()
        return {'Unknown', 'U'}
    end
})

local highlight_groups = {
    mode     = '%#Mode#',
    git      = '%#Git#',
    line_col = '%#LineCol#',
    filetype = '%#Filetype#',
    netrw    = '%#Netrw#',
    inactice = '%#Inactive#',
}


local function trun_req(width)
    return trunc_width >= width
end

-- mode
local function get_mode()
    local mode = api.nvim_get_mode().mode
    if trun_req(api.nvim_win_get_width(0)) then
        return modes[mode][2]
    end
    return modes[mode][1]
end

-- file info
local function get_file_info()
    local file_name, file_ext = fn.expand('%:t'), fn.expand('%:e')
    local icon = require('nvim-web-devicons').get_icon(file_name, file_ext, {default = true})
    if trun_req(api.nvim_win_get_width(0)) then
        return string.format("%s %s", icon, file_name)
    end
    return string.format("%s %s", icon, fn.expand('%f'))
end

-- git branch
local function get_git_branch()
    local handle = io.popen("git branch --show-current 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    result = string.gsub(result, "%s+", "") -- trim trailing whitespace
    if string.len(result) > 0 then
        return string.format(" %s", result)
    end
    return ""
end

-- line and column no.
local function get_line_col()
    return "%l:%c"
end

-- set statusline
function Statusline(mode)
    if mode == 'active' then
        return table.concat {
            highlight_groups.mode,
            " ",
            get_mode(),
            "  ",

            highlight_groups.filetype,
            get_file_info(),
            " %=",

            highlight_groups.git,
            get_git_branch(),

            highlight_groups.line_col,
            "  ",
            get_line_col(),
            " "
        }

    elseif mode == 'netrw' then
        return table.concat {
            highlight_groups.git,
            " פּ netrw"
        }

    else
        return highlight_groups.git
    end
end

api.nvim_exec([[
augroup Statusline
au!
au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
au Filetype netrw setlocal statusline=%!v:lua.Statusline('netrw')
augroup END
]], false)
