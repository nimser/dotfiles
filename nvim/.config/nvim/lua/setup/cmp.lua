local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  print("can't require cmp")
  return
end
-- Nvim CMP config

local has_luasnip, luasnip = pcall(require, 'luasnip')
local has_lspkind, lspkind = pcall(require, 'lspkind')
cmp.setup({
  snippet = {
    expand = function(args)
      if has_luasnip then luasnip.lsp_expand(args.body) end
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'luasnip', option = { use_show_condition = false, show_autosnippets = true } },
    },
    {
      { name = 'buffer' },
    }
  ),
  formatting = {
    format = has_lspkind and lspkind.cmp_format(
      {
        mode = "symbol_text",
        wirth_text = false,
        maxwidth = 40,
        ellipsis_char = '……'
      }) or nil
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- FIXME What's this for exactly?
  }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

