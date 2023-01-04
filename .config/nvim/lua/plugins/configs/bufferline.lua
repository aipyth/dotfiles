require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      }
    },
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    separator_style = 'thick',
    enforce_regular_tabs = false,
  }
}
