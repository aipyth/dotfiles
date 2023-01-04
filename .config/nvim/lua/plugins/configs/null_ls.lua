local present, null_ls = pcall(require, "null-ls")

if not present then
  print('null ls not present')
  return
end

local b = null_ls.builtins

local sources = {
  b.code_actions.refactoring,
}

local ls = require 'plugins.packages'
for _, v in pairs(ls.linter) do
  sources[#sources+1] = b[v.method][v.command]
end
for _, v in pairs(ls.formatter) do
  sources[#sources+1] = b[v.method][v.command]
end

null_ls.setup({
   debug = true,
   sources = sources,
})
