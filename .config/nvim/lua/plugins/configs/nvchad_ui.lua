local present, nvchad_ui = pcall(require, "nvchad_ui")

if not present then
  return
end

nvchad_ui.setup({
  statusline = {
     separator_style = "default", -- default/round/block/arrow
     overriden_modules = nil,
   },

   -- lazyload it when there are 1+ buffers
   tabufline = {
     enabled = true,
     lazyload = true,
     overriden_modules = nil,
   },
})
