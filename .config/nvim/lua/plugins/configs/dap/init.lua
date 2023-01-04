local M = {}

local function configure()
  -- local dap_install = require "dap-install"
  -- dap_install.setup {
  --   installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  -- }

  local dap_breakpoint = {
    error = {
      text = "栗",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  local dap = require "dap"
  -- require("config.dap.lua").setup()
  -- require("config.dap.python").setup()
  -- require("config.dap.rust").setup()
  require("plugins.configs.dap.go").setup()

  -- dap.adapters.node2 = {
  --   type = 'executable';
  --   command = 'node',
  --   args = { vim.fn.stdpath "data" .. '/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' };
  -- }

  -- dap.adapters.node2 = {
  --   type = 'executable';
  --   command = 'node',
  --   args = { vim.fn.stdpath "data" .. '/mason/packages/firefox-debug-adapter/firefox-debug-adapter' };
  -- }

  -- dap.adapters.node2 = {
  --   type = 'executable';
  --   command = 'node',
  --   args = { vim.fn.stdpath "data" .. '/mason/packages/vscode-node-debug2/out/src/nodeDebug.js' };
  -- }

  -- dap.adapters.node2 = {
  --   type = 'executable',
  --   command = 'node',
  --   args = { vim.fn.stdpath "data" .. '/mason/packages/js-debug-adapter/out/src/debugServer.js' };
  -- }

  -- table.insert()
  -- dap.configurations.typescript = {
  --   {
  --     type = 'node2',
  --     request = 'launch',
  --     name = 'JS Debug',
  --     program = '${file}',
  --     cwd = vim.fn.getcwd(),
  --   },
  -- }
  -- dap.configurations.javascript = {
  --   {
  --     type = 'node2',
  --     request = 'launch',
  --     name = 'JS Debug',
  --     program = '${file}',
  --     cwd = vim.fn.getcwd(),
  --     sourceMaps = true,
  --     protocol = 'inspector',
  --     console = 'integratedTerminal',
  --     runtimeExecutable = 'google-chrome-stable',
  --   },
  -- }
end

function M.setup()
  require('dap').set_log_level('TRACE')
  configure() -- Configuration
  configure_exts() -- Extensions
  configure_debuggers() -- Debugger
  require("plugins.configs.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

return M

--   dap.configurations.javascript = {
--   {
--     type = 'node2';
--     request = 'launch';
--     program = '${file}';
--     cwd = vim.fn.getcwd();
--     sourceMaps = true;
--     protocol = 'inspector';
--     console = 'integratedTerminal';
--   }
-- }
--
-- dap.configurations.javascript = {
--   {
--     type = 'chrome',
--     request = 'attach',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     port = 9222,
--     webRoot = '${workspaceFolder}'
--   }
-- }
--
-- dap.configurations.javascriptreact = {
--   {
--     type = 'chrome',
--     request = 'attach',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     port = 9222,
--     webRoot = '${workspaceFolder}'
--   }
-- }
--
-- dap.configurations.typescriptreact = {
--   {
--     type = 'chrome',
--     request = 'attach',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     port = 9222,
--     webRoot = '${workspaceFolder}'
--   }
-- }
