-- Chadrc overrides this file

local M = {}

M.options = {
  
}

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "ayu-dark", "one_light" },
  theme = "ayu-dark", -- default theme
  transparency = false,
}

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
