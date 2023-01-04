local present, cmp = pcall(require, "cmp")

if not present then
  return
end

require("base46").load_highlight "cmp"

vim.opt.completeopt = "menuone,noselect"

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local options = {
  window = {
    completion = {
      border = border "CmpBorder",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
      -- vim.fn["UltiSnips#Anon"](args.body)
      -- require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      local icons = require("nvchad_ui.icons").lspkind
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- cmp_ultisnips_mappings.compose { "expand", "jump_forwards", "select_next_item" }(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif require("luasnip").expand_or_jumpable() then vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        -- cmp_ultisnips_mappings.compose { "expand", "jump_forwards", "select_next_item" }(fallback)
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      -- cmp_ultisnips_mappings.compose { "jump_backwards", "select_prev_item" }(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif require("luasnip").jumpable(-1) then
        -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
      --   cmp_ultisnips_mappings.compose { "jump_backwards", "select_prev_item" }(fallback)
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "ultisnips" },
    -- { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('tex', {
  sources = cmp.config.sources({
    { name = "ultisnips" },
    { name = "nvim_lsp" },
    { name = "path" },
  }, {
    { name = 'buffer' },
  }),

  mapping = {
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
  },
})

cmp.setup(options)
