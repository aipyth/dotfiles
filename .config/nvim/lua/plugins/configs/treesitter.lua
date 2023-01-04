local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "syntax"
require("base46").load_highlight "treesitter"

local options = {
  ensure_installed = {
    "lua",
  },
  ignore_install = { "latex" },
  -- auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { "latex" },
  },
}

treesitter.setup(options)
