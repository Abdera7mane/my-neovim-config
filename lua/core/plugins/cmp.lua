local cmp = require('cmp')
local luasnip = require("luasnip")
local lspkind = require('lspkind')

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})
luasnip.snippets = require('luasnip_snippets').load_snippets()
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()

lspkind.init({
    mode = 'symbol_text',
    preset = 'codicons',

    symbol_map = {
      Text = "󰉿",
      Method = "󰰐",
      Function = "󰊕",
      Constructor = "󰒓",
      Field = "󰯻",
      Variable = "󰰫",
      Class = "󰙅",
      Interface = "",
      Module = "",
      Property = "󰰙",
      Unit = "",
      Value = "󰎠",
      Keyword = "󰌆",
      Snippet = "󰅱",
      Color = "",
      File = "",
      Reference = "󰈇",
      Folder = "",
      Enum = "󰯸",
      EnumMember = "󰯸",
      Constant = "󰯲",
      Struct = "󰠱",
      Event = "󰠠",
      Operator = "󰆕",
      TypeParameter = ""
    },
})

cmp.setup({
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  },
  {
    { name = 'buffer' },
  }),

  formatting = {
    fields = {'kind', 'abbr', 'menu'},
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',

      before = function (_, vim_item)
        return vim_item
      end
    })
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
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

