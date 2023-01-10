local telescope = require('telescope.builtin')
local packer = require('packer')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local options = {noremap = true, silent = true}
local keymap = vim.keymap.set

keymap('n', '<C-k>', ':resize +2<CR>', options)
keymap('n', '<C-j>', ':resize -2<CR>', options)
keymap('n', '<C-h>', ':vertical resize -2<CR>', options)
keymap('n', '<C-l>', ':vertical resize +2<CR>', options)


keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", options)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", options)
keymap('v', 'p', '"_dP', options)


keymap('n', '<leader>ff', telescope.find_files, {})
keymap('n', '<leader>fg', telescope.live_grep, {})
keymap('n', '<leader>fb', telescope.buffers, {})
keymap('n', '<leader>fh', telescope.help_tags, {})

keymap('n', '<leader>ps', packer.status)

keymap('n', '<leader>tg', ':NvimTreeToggle<CR>', options)

