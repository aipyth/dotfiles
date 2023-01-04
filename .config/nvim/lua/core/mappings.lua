-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
    ["<C-e>"] = { "<End>", "壟 end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "  move left" },
    ["<C-l>"] = { "<Right>", " move right" },
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },
    ['jk']    = { '<ESC>', 'esc fast enough via jk' }
  },

  n = {

    ["<ESC>"] = { "<cmd> noh <CR>", "  no highlight" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", " window left" },
    ["<C-l>"] = { "<C-w>l", " window right" },
    ["<C-j>"] = { "<C-w>j", " window down" },
    ["<C-k>"] = { "<C-w>k", " window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "﬚  save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "  copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },

    -- update nvchad
    ["<leader>uu"] = { "<cmd> :NvChadUpdate <CR>", "  update nvchad" },

    ["<leader>tt"] = { function() require("base46").toggle_theme() end, "   toggle theme", },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

    ['<C-Up>'] = { ":resize +2<CR>" },
    ['<C-Down>'] = { ":resize -2<CR>" },
    ['<C-Left>'] = { ':vertical resize -2<CR>' },
    ['<C-Right>'] = { ':vertical resize +2<CR>' },

    ['<C-=>'] = { function ()
      if vim.g.neovide then
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.15
      end
    end, 'increase scale' },
    ['<C-->'] = { function ()
      if vim.g.neovide then
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.15
      end
    end, 'decrease scale' },
  },

  t = {
    ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
    ['<ESC>'] = { termcodes '<C-\\><C-n>', 'escape terminal' },
    ['<C-h>'] = { termcodes '<C-\\><C-N><C-w>h', 'navigate left from terminal' },
    ['<C-j>'] = { termcodes '<C-\\><C-N><C-w>j', 'navigate down from terminal' },
    ['<C-k>'] = { termcodes '<C-\\><C-N><C-w>k', 'navigate up from terminal' },
    ['<C-l>'] = { termcodes '<C-\\><C-N><C-w>l', 'navigate right from terminal' },
  },

  v = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
    ['<leader>rf'] = {
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
      'refactor'
    },
  },
}

M.tabufline = {
  n = {
    -- new buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    -- ["<TAB>"] = {
    --   function()
    --     require("core.utils").tabuflineNext()
    --   end,
    --   "  goto next buffer",
    -- },
    --
    -- ["<S-Tab>"] = {
    --   function()
    --     require("core.utils").tabuflinePrev()
    --   end,
    --   "  goto prev buffer",
    -- },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("core.utils").close_buffer()
      end, "   close buffer", },

    -- pick buffers via numbers
    ["<Bslash>"] = { "<cmd> TbufPick <CR>", "  Pick buffer" },

    -- ['<S-h>'] = { "<cmd> TablineBufferPrevious <CR>", "  goto prev buffer" },
    -- ['<S-l>'] = { "<cmd> TablineBufferNext <CR>", "  goto next buffer" },

    -- ['<S-h>'] = { "<cmd> BufferLineCyclePrev <CR>", "  goto prev buffer" },
    -- ['<S-l>'] = { "<cmd> BufferLineCycleNext  <CR>", "  goto next buffer" },

    ['<S-h>'] = { "<cmd> bprevious <CR>", "  goto prev buffer" },
    ['<S-l>'] = { "<cmd> bnext   <CR>", "  goto next buffer" },

    -- ['<S-l>'] = {
    --   function()
    --     require("core.utils").tabuflineNext()
    --   end, "  goto next buffer", },
    -- ['<S-h>'] = {
    --   function()
    --     require("core.utils").tabuflinePrev()
    --   end, "  goto prev buffer", },
  },
}

M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end, "蘒  toggle comment", },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
      "蘒  toggle comment",
    },
  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gD"] = { function() vim.lsp.buf.declaration() end, "   lsp declaration", },
    ["gd"] = { function() vim.lsp.buf.definition() end, "   lsp definition", },
    ["K"] = { function() vim.lsp.buf.hover() end, "   lsp hover", },
    ["gi"] = { function() vim.lsp.buf.implementation() end, "   lsp implementation", },
    ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "   lsp signavimtex", },
    ["<leader>D"] = { function() vim.lsp.buf.type_definition() end, "   lsp definition type", },
    ["<leader>ra"] = { function() require("nvchad_ui.renamer").open() end, "   lsp rename", },
    ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, "   lsp code_action", },
    ["gr"] = { function() vim.lsp.buf.references() end, "   lsp references", },
    ["<leader>f"] = { function() vim.diagnostic.open_float() end, "   floating diagnostic", },
    ["[d"] = { function() vim.diagnostic.goto_prev() end, "   goto prev", },
    ["d]"] = { function() vim.diagnostic.goto_next() end, "   goto_next", },
    ["<leader>q"] = { function() vim.diagnostic.setloclist() end, "   diagnostic setloclist", },
    ["<leader>fm"] = { function() vim.lsp.buf.formatting() end, "   lsp formatting", },
    ["<leader>wa"] = { function() vim.lsp.buf.add_workspace_folder() end, "   add workspace folder", },
    ["<leader>wr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "   remove workspace folder", },
    ["<leader>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "   list workspace folders", },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<C-n>"] = { "<cmd> Telescope <CR>", "open telescope" },
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
  },
}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<A-i>"] = { function() require("nvterm.terminal").toggle "float" end,
      "   toggle floating term", },

    ["<A-h>"] = { function() require("nvterm.terminal").toggle "horizontal" end,
      "   toggle horizontal term", },

    ["<A-v>"] = { function() require("nvterm.terminal").toggle "vertical" end,
      "   toggle vertical term", },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = { function() require("nvterm.terminal").toggle "float" end,
      "   toggle floating term", },

    ["<A-h>"] = { function() require("nvterm.terminal").toggle "horizontal" end,
      "   toggle horizontal term", },

    ["<A-v>"] = { function() require("nvterm.terminal").toggle "vertical" end,
      "   toggle vertical term", },

    -- new

    ["<leader>h"] = { function() require("nvterm.terminal").new "horizontal" end,
      "   new horizontal term", },

    ["<leader>v"] = { function() require("nvterm.terminal").new "vertical" end,
      "   new vertical term", },
  },
}

M.theme = {
  n = {
    ['<leader>tr'] = { function() require('base46').toggle_transparency() end,
      'toggle transparency' }
  },
}

M.whichkey = {
  n = {
    ["<leader>wK"] = { function() vim.cmd "WhichKey" end,
      "   which-key all keymaps", },
    ["<leader>wk"] = { function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "   which-key query lookup", },
  },
}

M.blankline = {
  n = {
    ["<leader>bc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "  Jump to current_context",
    },
  },
}

M.vimtex = {
  n = {
    ['<leader>ll'] = { ':VimtexCompile<CR>', 'start vimtex compilation' },
    -- ['<C-f>'] = {
    --   function()
    --     vim.cmd [[: silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]]
    --   end
    -- },
    ['<leader>lk'] = { function() require('knap').toggle_autopreviewing() end, 'knap autopreview' },
  },
  i = {
    -- ['<C-f>'] = {
    --   function()
    --     vim.cmd [[<Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]]
    --   end
    -- },
  }
}

M.magma = {
  n = {
    ['<leader>ml'] = { ':MagmaEvaluateLine<CR>', 'Magma evaluate line' },
    ['<leader>mi'] = { ':MagmaInit', 'Magma init' },
  },
  v = {
    ['<leader>mv'] = { ':<C-u>MagmaEvaluateVisual<CR>', 'Magma evaluate visual' },
  }
}

vim.cmd [[autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>]]

return M
