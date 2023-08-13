local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.focus_terminal = true
dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/alacritty';
  args = {'-e'};
}


dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}


dap.configurations.c = dap.configurations.cpp

vim.fn.sign_define('DapBreakpoint', {text='', texthl='Breakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='󰈙', texthl='LogPoint', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='StepPoint', linehl='', numhl=''})

