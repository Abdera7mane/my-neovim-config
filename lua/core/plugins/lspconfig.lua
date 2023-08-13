local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local diagnostic_icons = {
  {
    name = "DiagnosticSignError",
    text = ''
  },
  {
    name = "DiagnosticSignWarn",
    text = ''
  },
  {
    name = "DiagnosticSignHint",
    text = ''
  },
  {
    name = "DiagnosticSignInfo",
    text = ''
  }
}

for _, sign in ipairs(diagnostic_icons) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "?.lua")

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = runtime_path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'awesome', 'client', 'tag', 'screen'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = true
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.gdscript.setup{
  capabilities = capabilities,
  cmd = {"godot_headless", "-e"}
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

lspconfig.clangd.setup {
  capabilities = capabilities,
  filetypes = { "c", "cpp", "cc" },
  single_file_support = false,
  flags = {
    debounce_text_changes = 500,
  },
}

lspconfig.dartls.setup {
  capabilities = capabilities,
  closingLabels = true,
  flutterOutline = true,
  onlyAnalyzeProjectsWithOpenFiles = true,
  outline = true,
  suggestFromUnimportedLibraries = false
}

require("clangd_extensions").setup {
  inlay_hints = {
      inline = true,
      only_current_line = true,
  }
}

