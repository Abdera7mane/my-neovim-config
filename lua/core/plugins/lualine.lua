local file_format = {
  'fileformat',
  symbols = {
    unix = "󰌽 unix",
    dos = " dos",
    mac =" mac"
  }
}

local diff = {
  'diff',
  colored = true,
  symbols = {added = ' ', modified = ' ', removed = ' '},
}

local diagnostics = {
  'diagnostics',
  colored = true,
  symbols = {error = ' ', warn = ' ', info = ''}
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'github_dark_default',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', diff},
    lualine_c = {'filename', 'filesize', diagnostics},
    lualine_x = {'encoding', file_format, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

vim.opt.laststatus = 3
