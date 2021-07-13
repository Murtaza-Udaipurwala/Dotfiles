function ToggleStatusline()
    local laststatus = vim.o.laststatus
    if laststatus == 0 then
        laststatus = 2
    else
        laststatus = 0
    end
    vim.o.laststatus = laststatus
end
