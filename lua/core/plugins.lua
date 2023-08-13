local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      {
        "mg979/nvim-web-devicons",
        branch = "keep_overrides"
      },
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  }

  use 'projekt0n/github-nvim-theme'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use 'mfussenegger/nvim-dap'

  use 'nvim-lualine/lualine.nvim'

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim', 'rafamadriz/friendly-snippets',
      'molleweide/LuaSnip-snippets.nvim', 'p00f/clangd_extensions.nvim'
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end
  }

  use 'andweeb/presence.nvim'

  use 'lukas-reineke/indent-blankline.nvim'


  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function() require("nvim-surround").setup({}) end
  }

  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function() require('treesj').setup({}) end
  }

  use {
    "folke/trouble.nvim",
    config = function() require("trouble").setup {} end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('core.plugins.config')

