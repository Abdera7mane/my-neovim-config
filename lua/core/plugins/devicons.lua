local devicons = require('nvim-web-devicons')

local icons = devicons.get_icons()

devicons.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 },

 color_icons = true,
 default = true,
 strict = true,

 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  },
  SConstruct = {
    icon = "",
    color = "#ffffff",
    name = "SConstruct"
  },
  SCsub = {
    icon = "",
    color = "#ffffff",
    name = "SCsub"
  }
 },

 override_by_extension = {
 },
}
