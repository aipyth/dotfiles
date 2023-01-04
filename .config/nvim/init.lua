vim.defer_fn(function()
  -- pcall(require, "impatient")
  require('impatient').enable_profile()
end, 0)
require "core"
require "core.options"

vim.defer_fn(function()
  require("core.utils").load_mappings()
end, 0)

-- -- setup packer + plugins
require("core.packer").bootstrap()
require "plugins"

