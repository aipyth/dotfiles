local M = {}

local whichkey = require "which-key"

-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end

function M.setup()
  whichkey.register({
      name = "Debug",
      R = { function() require'dap'.run_to_cursor() end, "Run to Cursor" },
      E = { function() require'dapui'.eval(vim.fn.input '[Expression] > ') end,
        "Evaluate Input" },
      C = { function() require'dap'.set_breakpoint(vim.fn.input '[Condition] > ') end,
        "Conditional Breakpoint" },
      U = { function() require'dapui'.toggle() end, "Toggle UI" },
      b = { function() require'dap'.step_back() end, "Step Back" },
      c = { function() require'dap'.continue()end, "Continue" },
      d = { function() require'dap'.disconnect() end, "Disconnect" },
      e = { function() require'dapui'.eval() end, "Evaluate" },
      g = { function() require'dap'.session() end, "Get Session" },
      h = { function() require'dap.ui.widgets'.hover() end, "Hover Variables" },
      S = { function() require'dap.ui.widgets'.scopes() end, "Scopes" },
      i = { function() require'dap'.step_into() end, "Step Into" },
      o = { function() require'dap'.step_over() end, "Step Over" },
      p = { function() require'dap'.pause.toggle() end, "Pause" },
      q = { function() require'dap'.close() end, "Quit" },
      r = { function() require'dap'.repl.toggle() end, "Toggle Repl" },
      s = { function() require'dap'.continue() end, "Start" },
      t = { function() require'dap'.toggle_breakpoint() end, "Toggle Breakpoint" },
      x = { function() require'dap'.terminate() end, "Terminate" },
      u = { function() require'dap'.step_out() end, "Step Out" },
    }, {
    mode = "n",
    prefix = "<leader>d",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })

  whichkey.register({
    name = "Debug",
    e = { function() require'dapui'.eval() end, "Evaluate" },
  }, {
    mode = "v",
    prefix = "<leader>d",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })
end

return M
