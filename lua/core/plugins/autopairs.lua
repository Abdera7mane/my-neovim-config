
local autopairs = require('nvim-autopairs')

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = {'string', 'source'}
  },
  disable_filetype = {'TelescopePrompt'},
  fast_warp = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    manual_position = true,
    highlight = 'Search',
    highlight_grey='Comment'
  }
}

local basic = require('nvim-autopairs.rules.basic')

local utils = require('nvim-autopairs.utils')
local original_is_close_bracket = utils.is_close_bracket
function utils.is_close_bracket(char)
  return original_is_close_bracket(char) or char == '>'
end

local bracket = basic.bracket_creator(autopairs.config)

autopairs.add_rules({
  bracket("<", ">")
})


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
