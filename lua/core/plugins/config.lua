require('core.plugins.packer')
require('core.plugins.devicons')
require('core.plugins.nvim-tree')
require('core.plugins.gitsigns')
require('core.plugins.lualine')
require('core.plugins.cmp')
require('core.plugins.dap')
require('core.plugins.mason')
require('core.plugins.mason-lspconfig')
require('core.plugins.lspconfig')
require('core.plugins.treesitter')
require('core.plugins.autopairs')
require('core.plugins.telescope')
require('core.plugins.presence')
require('core.plugins.indent_blankline')

vim.filetype.add({
  extension = {
    gdnlib = "gdresource",
    gdns = "gdresource"
  },

  filename = {
    ["project.godot"] = "gdresource"
  }
})
