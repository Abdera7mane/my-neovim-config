local telescope = require('telescope.builtin')
local packer = require('packer')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local options = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<C-k>', ':resize +2<CR>', options)
keymap('n', '<C-j>', ':resize -2<CR>', options)
keymap('n', '<C-h>', ':vertical resize -2<CR>', options)
keymap('n', '<C-l>', ':vertical resize +2<CR>', options)


keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", options)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", options)
keymap('v', 'p', '"_dP', options)

keymap('n', '<Tab>', 'v>', options)
keymap('n', '<S-Tab>', 'v<', options)

keymap('v', '<Tab>', '>gv', options)
keymap('v', '<S-Tab>', '<gv', options)

keymap('n', '<leader>w', '<C-w>')

keymap('n', '<leader>nr', function() vim.opt.relativenumber = true end, options)
keymap('n', '<leader>na', function() vim.opt.relativenumber = false end, options)


-- File actions
keymap('n', '<leader>fs', ":w<CR>", { desc = "Save file", unpack(options) })
keymap('n', '<leader>ff', telescope.find_files, { desc = "Find file" })
keymap('n', '<leader>fg', telescope.live_grep, { desc = "Live grep" })
keymap('n', '<leader>fb', telescope.buffers, { desc = "Find buffer" })
keymap('n', '<leader>fh', telescope.help_tags, { desc = "Find help" })

-- Tabs
keymap('n', '<leader>tt', vim.cmd.tabnew, { desc = "New tab" })
keymap('n', '<leader>tn', vim.cmd.tabnext, { desc = "Next tab" })
keymap('n', '<leader>tp', vim.cmd.tabprevious, { desc = "Previous tab" })
keymap('n', '<leader>tf', vim.cmd.tabfirst, { desc = "First tab" })
keymap('n', '<leader>tl', vim.cmd.tablast, { desc = "Last tab" })
keymap('n', '<leader>tc', vim.cmd.tabclose, { desc = "Close tab" })

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {clear = true}),
  callback = function(env)
    vim.bo[env.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local lsp_options = {
      buffer = env.buf,
    }

    local dap = require('dap');

    keymap('n', '<leader>gD', vim.lsp.buf.declaration, { desc = "Go to declaration", unpack(lsp_options) })
    keymap('n', '<leader>gd', vim.lsp.buf.definition, { desc = "Go to definition", unpack(lsp_options) })
    keymap('n', '<leader>gi', vim.lsp.buf.implementation, { desc = "Go to implementation", unpack(lsp_options) })
    keymap('n', '<leader>gr', vim.lsp.buf.references, { desc = "Symbole references", unpack(lsp_options) })
    keymap('n', '<leader>sh', vim.lsp.buf.signature_help, { desc = "Signature help", unpack(lsp_options) })
    keymap('n', '<leader>sr', vim.lsp.buf.rename, { desc = "Rename symbole", unpack(lsp_options) })
    keymap('n', '<leader>sa', vim.lsp.buf.code_action, { desc = "Select a code action", unpack(lsp_options) })
    keymap('n', '<leader>h', vim.lsp.buf.hover, { desc = "Code hover", unpack(lsp_options) })
    keymap('n', '<leader>dd', vim.diagnostic.open_float, { desc = "Show diagnostic", unpack(lsp_options) })
    keymap('n', '<leader>b', dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    keymap('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    keymap('n', '<F5>', dap.continue, { desc = "Start/Resume debug session" })
    keymap('n', '<F10>', dap.step_over, { desc = "Step over" })
    keymap('n', '<F11>', dap.step_into, { desc = "Step into" })
    keymap('n', '<F12>', dap.step_out, { desc = "Step into" })
    keymap('n', '<leader>ro', dap.repl.open, { desc = "Open REPL" })
    keymap({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    keymap({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    keymap('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    keymap('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
  end
})


keymap('n', '<leader>ps', packer.status, { desc = "Packer Status" })

keymap('n', '<leader>tg', ':Neotree toggle<CR>', { desc = "Toggle file tree", unpack(options) })
