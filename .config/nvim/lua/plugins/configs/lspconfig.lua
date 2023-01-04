local present, lspconfig = pcall(require, "lspconfig")

if not present then print('lspconfig is not present')
  return
end

require("base46").load_highlight "lsp"
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  if vim.g.vim_version > 7 then
    -- nightly
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    -- stable
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  local lsp_mappings = utils.load_config().mappings.lspconfig
  utils.load_mappings({ lsp_mappings }, { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = { properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

lspconfig.sumneko_lua.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

local ls = require 'plugins.packages'
-- print(ls)
local servers = {}
for _, server_name in pairs(ls.lsp) do
  servers[#servers+1] = server_name
end

local package_settings = require 'plugins.packages_configs'
-- print(vim.inspect(package_settings))

local setup_server = function (server_name)
  local opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }
  if package_settings[server_name] ~= nil then
    opts = vim.tbl_deep_extend("force", package_settings[server_name], opts)
  end
  -- print(server_name, opts)
  lspconfig[server_name].setup(opts)
end

for _, lsp in ipairs(servers) do
  setup_server(lsp)
end

-- require "lsp_signature".setup({
--   bind = true, -- This is mandatory, otherwise border config won't get registered.
--   handler_opts = {
--     border = "rounded"
--   }
-- })

return M
