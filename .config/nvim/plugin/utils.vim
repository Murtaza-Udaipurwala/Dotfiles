function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd FileType cpp nnoremap <buffer> <leader>r :sp<CR> :term g++ % -o %:r && ./%:r<CR> :startinsert<CR>
