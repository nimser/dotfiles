" Load general configurations
" Note: keep settings.vim loaded first. The leader key needs to be defined
" before any mapping is defined or these won't be loaded at vim start.
" Also be aware that including mappings before plugins might mean they get
" overwitten
"source ~/.config/nvim/general/settings.vim
"source ~/.config/nvim/general/mappings.vim

" TODO:
" #### Things to grok and improvements
" - [ ] move most of vim config to lua
"   - Guide to using lua for neovim com https://github.com/nanotee/nvim-lua-guide
"   - Lua refbook: https://www.lua.org/manual/5.1/ (also available as plugin milisims/nvim-luaref)
"   - good example of a full lua config here: https://github.com/Drllap/development_setup/
"   - also in tj's repo: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/
" - [ ] sticky function header with line number like the Primeagen's video: https://youtu.be/8BGr_umDTco?t=198
" - [ ] embed vim-treesitter and make sure it works as expected on ts/tsx, js/jsx, svelte, rust files
" - [ ] take advantage of the Language Server Protocol for go-to-def, whole project analysis etc...
"        - see [FIXME/TODO]s in main lua config
"        - fix code actions not working with tsserver (e.g. while removing an
"        import it should put it back with vim.lsp.buf.code_actions())
"        - take a look at https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb for inspiration
" - [ ] move vim config to lua. Some guidance here https://github.com/AlphaKeks/how2nvim/tree/01-Introduction
" - [ ] Use terminal within VIM
" - [ ] Let go of Plug, use native Vim 8 plugin management
" - [ ] have a list of vim cheatsheet (current vim-memo.md) readable in a foating panel for quick read-only access
" - [ ] review buffers navigation e.g. :bnext :bprev etc... and setup mappings (incl. telescope mappings)
" - [ ] find colorschemes after fixing term colors: https://github.com/neovim/neovim/issues/793
" - [ ] mappings for :bnext, :bprev
" - [ ] repace DEPREC plugins by performant alternatives
" #### potential plugins (progressively switching over to a lua stack)
" - [ ] nvim-tree/nvim-tree.lua or nvim-neo-tree/neo-tree.nvim to replace Nerdtree
" - [ ] nvim-lualine/lualine.nvim to replace vim-airline
" - [ ] nvim-lua/plenary.nvim for usefull lua functions
" - [ ]	nvim-telescope/telescope.nvim to replace fzf
" - [ ] ThePrimeagen/harpoon for a list of files to easily jump back and forth to


lua require('mappings')
lua require('plugins')
lua require('options')
" Load plugin-specific configurations
"FIXME source ~/.config/nvim/plugins_config/quickscope.vim
"FIXME source ~/.config/nvim/plugins_config/emmet.vim



" key shortcuts FIXME
nnoremap <F5> :lua package.loaded = nil<cr>:source ~/.config/nvim/init.vim<cr>

nnoremap <leader>ei3 :tabe ~/.config/i3/config<cr>
nnoremap <leader>evm :tabe ~/Sync/[M]\ Sys-admin/vim-memo.md<cr>
nnoremap <leader>ewi :tabe ~/Sync/Freelance/workflow-improvement.md<cr>
nnoremap <leader>ek :tabe ~/qmk_firmware/keyboards/centromere/keymaps/nimser/keymap.c<cr>




" Files where Closetags should be used @alvan/vim-closetag
let g:closetag_xhtml_filenames = '*.html,*.svelte,*.jsx,*.tsx'
let g:closetag_xhtml_filetypes = 'html,svelte,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

let g:tagalong_filetypes = ['html','svelte','jsx']

"" Goyo.vim Limelight integration
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

" Vim airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch']
" Emmets
let g:html_indent_inctags = 'body,head,html,tbody,p,li,dt,dd'

" --------------------------------
"    FILE TYPES SETTINGS & OVERRIDES
" --------------------------------
"example:
"au BufRead,BufNewFile *.vue set ft=html
