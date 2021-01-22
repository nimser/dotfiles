" -----> Normal mappings <------
"open the file under cursor in a new tab
noremap gf <c-w>gf
nnoremap <leader>w :update<cr>
nnoremap <leader>t :tabe<cr>
nnoremap <leader>q :q<cr>
" next / prev tab
nnoremap gb gT
nnoremap gw gt
" visual mapping for :norm to help comment/uncomment, see https://stackoverflow.com/a/23063140/378253
vnoremap <C-n> :norm 
"" -----> Command mappings <------
cnoreabbrev W w
