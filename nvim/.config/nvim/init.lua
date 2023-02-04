-- Load general configurations
-- Note: keep mappings loaded first. The leader key needs to be defined
-- before any mapping is defined or these won't be loaded at vim start.
-- Also be aware that including mappings before plugins may mean they get
-- overwitten

require('mappings')
require('plugins')
require('options')
-- DEBUG: set true to fill logs in ~/.local/state/nvim/lsp.log
local debug = true
if debug then
  vim.lsp.set_log_level("DEBUG")
  print("Warning: lsp debug is ON")
else
  vim.lsp.set_log_level("ERROR")
end

-- TODO:
-- #### BUGs
-- -[ ] autocomplete starts only if we type the term from the start. feks, placing the cursor on an existing class="font-ita_" won't suggest font-italic
-- -[ ] Typescript types diagnosis not permformed in astro files
-- #### Things to grok and improvements
-- - [ ] make config mostly reloadable without retart
--   - restructure module so that everything is under a user namespace, just
--   like in this repo: https://github.com/creativenull/nvim-config/blob/87fd4cd0ddd4767ebd520f6c2d496a2def33fb91/init.lua
--   - also see above repo for reload function in core/reload
-- - [ ] sticky function header with line number like the Primeagen's video: https://youtu.be/8BGr_umDTco?t=198
-- - [ ] embed vim-treesitter and make sure it works as expected on ts/tsx, js/jsx, svelte, rust files
-- - [ ] take advantage of the Language Server Protocol for go-to-def, whole project analysis etc...
--        - see [FIXME/TODO]s in main config
--        - fix code actions not working with tsserver (e.g. while removing an
--        import it should put it back with vim.lsp.buf.code_actions())
--        - fix jumping (gd) to lua requires not always working
--        - take a look at https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb for inspiration
-- - [ ] Use terminal within VIM
-- - [ ] have a list of vim cheatsheet (current vim-memo.md) readable in a foating panel for quick read-only access
-- - [ ] review buffers navigation e.g. :bnext :bprev etc... and setup mappings (incl. telescope mappings)
-- - [ ] fix term colors: https://github.com/neovim/neovim/issues/793
-- - [ ] repace DEPREC plugins by performant alternatives
-- #### plugins to review/try out
-- - [ ] ThePrimeagen/harpoon for a list of files to easily jump back and forth to
