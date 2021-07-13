local function create_augroup(autocmds, name)
    local cmd = "augroup " .. name .. "\n" .. "autocmd!\n"
    for _, autocmd in ipairs(autocmds) do
        cmd = cmd .. "autocmd " .. autocmd .. "\n"
    end
    cmd = cmd .. "augroup END"
    vim.cmd(cmd)
end

create_augroup({'TextYankPost * silent! lua require"vim.highlight".on_yank({timeout = 80})'}, 'highlight_yank')
-- create_augroup({[[BufWritePre * :%s/\s\+$//e]]}, 'trim_trailing_whitespace')

-- run xrdb whenever Xresources is updated
vim.cmd('autocmd BufWritePost *Xresources !xrdb %')

-- automatically kill & restart sxhkd
vim.cmd('autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &')
