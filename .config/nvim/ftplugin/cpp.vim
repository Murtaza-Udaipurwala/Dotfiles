nnoremap <leader>r :w <bar> !g++ -ulimit -Wall -Wno-unused-result % -o %:r && ./%:r < ./input.txt <CR>
