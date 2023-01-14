local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

g.vim_version = vim.version().minor
g.nvchad_theme = config.ui.theme
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false

g.magma_image_provider = "ueberzug"

if g.neovide then
  -- opt.guifont = { "Iosevka NF", ":h8" }
  -- opt.guifont = { "Nimbus Mono NF", ":h8" }
  -- opt.guifont = { "JetBrainsMono NF", ":h8" }
  -- opt.guifont = { "Monoid Nerd Font", ":h8" }
  opt.guifont = { "MesloLGL Nerd Font", ":h8" }
  g.neovide_scale_factor = 1
  g.neovide_transparency = 1
  g.neovide_cursor_antialiasing = true
  g.neovide_scroll_animation_length = 0.3
  g.neovide_hide_mouse_when_typing = true
  g.neovide_cursor_trail_size = 0.7
  g.neovide_profiler = false
  -- railgun | torpedo | pixiedust | sonicboom | ripple | wireframe
  g.neovide_cursor_vfx_mode = "torpedo"
end

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
if g.vim_version < 8 then
  g.did_load_filetypes = 0
  g.do_filetype_lua = 1
end

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = true

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

vim.o.scrolloff = 8

vim.o.showtabline = 2

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]"
-- opt.whichwrap:append "<>[]hl"

g.mapleader = " "

-- vim.cmd [[setlocal spell]]
-- vim.cmd [[set spelllang=en,ru,uk]]

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

-- local default_providers = {
--   "node",
--   "perl",
--   -- "python3",
--   "ruby",
-- }
--
-- for _, provider in ipairs(default_providers) do
--   vim.g["loaded_" .. provider .. "_provider"] = 0
-- end

-- set shada path
-- vim.schedule(function()
--   vim.opt.shadafile = vim.fn.stdpath(g.vim_version > 7 and "state" or "data") .. "/shada/main.shada"
--   vim.cmd [[ silent! rsh ]]
-- end)
