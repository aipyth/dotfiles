local M = {}

-- look up to this list to make the M.lsp table
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

M.lsp = {
-- Lua
['lua-language-server'] = 'sumneko_lua',
-- Web
['css-lsp'] = 'cssls',
['html-lsp'] = 'html',
['typescript-language-server'] = 'tsserver',
['json-lsp'] = 'jsonls',
['eslint-lsp'] = 'eslint',
-- Go
['gopls'] = 'gopls',
-- C
['clangd'] = 'clangd',
-- Zig
['zls'] = 'zls',
-- Rust
['rust_analyzer'] = 'rust_analyzer',
-- Docker
['dockerfile-language-server'] = 'dockerls',
-- YAML
['yaml-language-server'] = 'yamlls',
['python-lsp-server'] = 'pylsp',
-- ['pyright'] = 'pyright',
['texlab'] = 'texlab',
}

M.dap = {}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
M.linter = {
  -- ['codespell'] = {
  --   method = 'diagnostics',
  --   command = 'codespell',
  -- },
  ['golangci-lint'] = {
    method = 'diagnostics',
    command = 'golangci_lint',
  },
  ['shellcheck'] = {
    method = 'code_actions',
    command = 'shellcheck',
  },
}

M.formatter = {
  ['goimports'] = {
    method = 'formatting',
    command = 'goimports',
  },
  ['stylua'] = {
    method = 'formatting',
    command = 'stylua',
  },
}

return M
