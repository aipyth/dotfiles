vim.cmd [[packadd packer.nvim]]

local plugins = {

  -- BASE

  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["wbthomason/packer.nvim"] = {},

  ["NvChad/extensions"] = { module = { "telescope", "nvchad" } },
  ["NvChad/base46"] = {
    config = function()
      local ok, base46 = pcall(require, "base46")

      if ok then
        base46.load_theme()
      end
    end,
  },
  ["NvChad/ui"] = {
    after = "base46",
    config = function()
      require("plugins.configs.nvchad_ui")
    end,
  },

  ["NvChad/nvim-colorizer.lua"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-colorizer.lua"
    end,
    config = function()
      require('colorizer').setup()
    end,
  },
  ["NvChad/nvterm"] = {
    module = "nvterm",
    config = function()
      require "plugins.configs.nvterm"
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    setup = function()
      require("core.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = require("core.lazy_load").treesitter_cmds,
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
    end,
  },

  ["kyazdani42/nvim-web-devicons"] = {
    after = 'ui',
    module = "nvim-web-devicons",
    config = function()
      require("plugins.configs.devicons")
    end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "indent-blankline.nvim"
    end,
    config = function()
      require("plugins.configs.blankline")
    end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    ft = "gitcommit",
    setup = function()
      require("core.lazy_load").gitsigns()
    end,
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvimtree"
    end,
  },

  ["goolord/alpha-nvim"] = {
    after = "base46",
    disable = false,
    config = function()
      require "plugins.configs.alpha"
    end,
  },

  ['nvim-lualine/lualine.nvim'] = {
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require 'plugins.configs.lualine'
    end,
  },

  -- ['kdheepak/tabline.nvim'] = {
  --   requires = {
  --     { 'hoob3rt/lualine.nvim', opt=true },
  --     {'kyazdani42/nvim-web-devicons', opt = true}
  --   },
  --   config = function()
  --     require'tabline'.setup {
  --       -- Defaults configuration options
  --       enable = false,
  --       options = {
  --       -- If lualine is installed tabline will use separators configured in lualine by default.
  --       -- These options can be used to override those settings.
  --         section_separators = {'', ''},
  --         component_separators = {'', ''},
  --         max_bufferline_percent = 90, -- set to nil by default, and it uses vim.o.columns * 2/3
  --         show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
  --         show_devicons = true, -- this shows devicons in buffer section
  --         show_bufnr = true, -- this appends [bufnr] to buffer section,
  --         show_filename_only = false, -- shows base filename only instead of relative path in filename
  --         modified_icon = "+ ", -- change the default modified icon
  --         modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
  --         show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
  --       }
  --     }
  --     vim.cmd[[
  --       set guioptions-=e " Use showtabline in gui vim
  --       set sessionoptions+=tabpages,globals " store tabpages and globals in session
  --     ]]
  --   end,
  -- },

  ["akinsho/bufferline.nvim"] = {
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require "plugins.configs.bufferline"
    end
  },

  ["tiagovla/scope.nvim"] = {
    config = function ()
      require('scope').setup()
    end
  },

  -- A simple statusline/winbar component that uses LSP
  -- to show your current code context.
  ["SmiteshP/nvim-navic"] = {},
  -- This is a VS Code like winbar that uses nvim-navic in
  -- order to get LSP context from your language server. 
  ["utilyre/barbecue.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("barbecue").setup()
    end,
  },


  --- CMP

  ["hrsh7th/nvim-cmp"] = {
    -- after = "friendly-snippets",
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  -- ["rafamadriz/friendly-snippets"] = {
  --   module = "cmp_nvim_lsp",
  --   event = "InsertEnter",
  -- },

  -- ["L3MON4D3/LuaSnip"] = {
  --   wants = "friendly-snippets",
  --   after = "nvim-cmp",
  --   config = function()
  --     require("plugins.configs.luasnip")
  --   end,
  -- },

  -- ["saadparwaiz1/cmp_luasnip"] = {
  --   after = "LuaSnip",
  -- },

  ["hrsh7th/cmp-nvim-lua"] = {
    after = "nvim-cmp",
    -- after = "cmp_luasnip",
  },

  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "cmp-nvim-lua",
  },

  ["hrsh7th/cmp-buffer"] = {
    after = "cmp-nvim-lsp",
  },

  ["hrsh7th/cmp-path"] = {
    after = "cmp-buffer",
  },

  ["petertriho/cmp-git"] = {
    after = "cmp-path",
  },

  ["quangnguyen30192/cmp-nvim-ultisnips"] = {
    config = function()
      require("cmp_nvim_ultisnips").setup{}
    end
  },


  ["lewis6991/impatient.nvim"] = {},

  ["folke/which-key.nvim"] = {
    module = "which-key",
    -- keys = "<leader>",
    config = function()
      require "plugins.configs.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },

  --- LSP STUFF

  ["williamboman/mason.nvim"] = {
    -- cmd = require("core.lazy_load").mason_cmds,
    -- after = 'nvim-lspconfig',
    config = function()
      require "plugins.configs.mason"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-lspconfig"
    end,
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  ['jose-elias-alvarez/null-ls.nvim'] = {
    after = "nvim-lspconfig",
    -- setup = function()
    --   require("core.lazy_load").on_file_open "null-ls"
    -- end,
    config = function()
      require "plugins.configs.null_ls"
    end,
  },

  --- DAP
  ['mfussenegger/nvim-dap'] = {
    -- opt = true,
    -- event = "BufReadPre",
    -- module = { "dap" },
    -- wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    requires = {
      -- "Pocco81/DAPInstall.nvim",
      -- "theHamsta/nvim-dap-virtual-text",
      -- "rcarriga/nvim-dap-ui",
      -- -- "mfussenegger/nvim-dap-python",
      -- "nvim-telescope/telescope-dap.nvim",
      -- { "leoluz/nvim-dap-go", module = "dap-go" },
      -- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
    config = function()
      require("plugins.configs.dap").setup()
    end,
  },
  ["theHamsta/nvim-dap-virtual-text"] = {},
  ["nvim-telescope/telescope-dap.nvim"] = {},

  ['rcarriga/nvim-dap-ui'] = {
    requires = {'mfussenegger/nvim-dap'}
  },
  ['mfussenegger/nvim-dap-python'] = {},
  ['leoluz/nvim-dap-go'] = {
    module = "dap-go",
    config = function ()
      require('dap-go').setup()
    end
  },
  ['Pocco81/dap-buddy.nvim'] = {},

  ------------------------------------------------
  --- OTHER PROGRAMMING STUFF (lsp may be also)
  ------------------------------------------------
  ['ThePrimeagen/refactoring.nvim'] = {
    config = function()
      require('refactoring').setup()
    end
  },
  ['folke/trouble.nvim'] = {
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup(require 'plugins.configs.trouble')
    end
  },
  -- ['folke/trouble.nvim'] = {
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require('trouble').setup(require 'plugins.configs.trouble')
  --   end
  -- },

  ['simrat39/symbols-outline.nvim'] = {
    config = function()
      require('symbols-outline').setup(require 'plugins.configs.symbols-outline')
    end
  },

  ['folke/todo-comments.nvim'] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup(require 'plugins.configs.todo-comments')
    end
  },

  ['sindrets/diffview.nvim'] = {
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      -- require 'custom.plugins.diffview'
    end,
  },
  -- ['ray-x/lsp_signature.nvim'] = {},

  -------------------------------------------
  --- MARKDOWN AND LATEX
  -------------------------------------------
  ['iamcco/markdown-preview.nvim'] = {
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  ['lervag/vimtex'] = {
    config = function()
      require 'plugins.configs.vimtex'
    end
  },

  ['SirVer/ultisnips'] = {
    config = function ()
      vim.g['tex_flavor'] = 'latex'
      vim.g["UltiSnipsExpandTrigger"] = "<Tab>"
      vim.g["UltiSnipsJumpForwardTrigger"] = "<Tab>"
      vim.g['UltiSnipsJumpBackwardTrigger'] = '<S-Tab>'
    end
  },
  ['frabjous/knap'] = {
    -- https://github.com/frabjous/knap
    config = function()
      require 'plugins.configs.knap'
    end
  },

  ['KeitaNakamura/tex-conceal.vim'] = {},

  ----------------------------------
  --- OTHER
  ----------------------------------
  ['folke/twilight.nvim'] = {
    config = function()
      require 'plugins.configs.twilight'
    end
  },

  ['folke/zen-mode.nvim'] = {
    config = function()
      require('plugins.configs.zen-mode')
    end
  },

  -- ['rstacruz/vim-closer'] = {},

  -- Auto close pairs (, [, {, ', "
  ["echasnovski/mini.pairs"] = {
    config = function ()
      require('mini.pairs').setup()
    end
  },

  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    keys = { "gc", "gb" },
    config = function()
      require("plugins.configs.comment")
    end,
  },
  ['wakatime/vim-wakatime'] = {},
  ['ferrine/md-img-paste.vim'] = {
    config = function()
      vim.g.mdip_imgdir = 'images'
      vim.g.mdip_imgname = 'image'
    end
  },

  ['mattkubej/jest.nvim'] = {},

  ['dccsillag/magma-nvim'] = {
    run = ':UpdateRemotePlugins'
  },

  -- ['baabelfish/nvim-nim'] = {},

}

require("core.packer").run(plugins)
