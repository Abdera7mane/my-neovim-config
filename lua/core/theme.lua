vim.g.github_theme_debug = true
vim.opt.colorcolumn = {80, 100}

require('github-theme').setup({
  options = {
    transparent = true,
    dark_sidebar = true,
    dark_float = true,
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = {},
      },
    },
  },
  groups = {
    github_dark_high_contrast = {
      GitSignsAdd = {
        fg = "#56d364"
      },

      GitSignsChange = {
        fg = "#ffac41"
      },

      GitSignsDelete = {
        fg = "#e94560"
      },

      VertSplit = {
        fg = "#1b2430"
      },

      ColorColumn = {
        bg = "#1b2430"
      },

      Delimiter = {
        fg = "#b2beb5"
      },

      TelescopePromptCounter = {
        fg = "#eeeeee"
      },

      IndentBlanklineContextChar = {
        fg = "#61afef" -- doesn't work ???
      },
    }
  }
})

vim.cmd("colorscheme github_dark_high_contrast")

vim.cmd [[highlight IndentBlanklineContextChar guifg=#61afef gui=nocombine]]
vim.cmd [[highlight Breakpoint guifg=#e94560 gui=nocombine]]
vim.cmd [[highlight LogPoint guifg=#f7c843 gui=nocombine]]
vim.cmd [[highlight StepPoint guifg=#4AE168 gui=nocombine]]

