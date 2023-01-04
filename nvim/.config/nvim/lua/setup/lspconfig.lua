-- LSP config
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
local on_attach = function(_, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  -- TODO for format_on_save, see inspiration here: https://youtu.be/ajmK0ZNcM4Q?t=2314
  -- TODO better LSP rename using quickfix: https://www.reddit.com/r/neovim/comments/tjzmnt/better_lsp_rename/
  -- FIXME vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, {async=true,buffer=0})
  -- FIXME gd doesn't work properly for lua requires
end
local has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
require('lspconfig').tsserver.setup{
  capabilities = has_cmp and cmp_lsp.default_capabilities() or nil,
  on_attach = on_attach,
}
require('lspconfig').tailwindcss.setup{
  capabilities = has_cmp and cmp_lsp.default_capabilities() or nil,
  on_attach = on_attach,
}
require('lspconfig').svelte.setup{
  capabilities = has_cmp and cmp_lsp.default_capabilities() or nil,
  on_attach = on_attach,
}
require('lspconfig').astro.setup{
  capabilities = has_cmp and cmp_lsp.default_capabilities() or nil,
  on_attach = on_attach,
}
require('lspconfig').sumneko_lua.setup{
  capabilities = has_cmp and cmp_lsp.default_capabilities() or nil,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

