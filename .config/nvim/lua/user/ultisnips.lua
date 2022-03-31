local status_ok, cmp_nvim_ultisnips = pcall(require, "cmp_nvim_ultisnips")
if not status_ok then
    vim.notify("cmp_nvim_ultisnips not loaded")
    return
end

cmp_nvim_ultisnips.setup {
  filetype_source = "treesitter",
  show_snippets = "all",
  documentation = function(snippet)
    return snippet.description
  end
}
