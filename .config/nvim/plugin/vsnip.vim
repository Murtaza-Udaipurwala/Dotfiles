let g:vsnip_snippet_dir = '$HOME/.config/nvim/snippets'

" Jump forward or backward
imap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
smap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'

" Jump backward
imap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
smap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'

" Expand
imap <expr> <C-l> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-l>'
smap <expr> <C-l> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-l>'
