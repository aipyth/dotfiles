-- local colorscheme = "pablo"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end
vim.cmd [[
try

  " augroup MyColors
  "   autocmd!
  "     " autocmd ColorScheme * highlight Conceal cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=NONE guifg=#000000
  "   autocmd ColorScheme * highlight link Conceal Normal
  " augroup END

  colorscheme spacedark

  " autocmd ColorScheme highlight highlight link Conceal Search
  " autocmd ColorScheme * highlight link Conceal Normal
  hi! clear Conceal
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
