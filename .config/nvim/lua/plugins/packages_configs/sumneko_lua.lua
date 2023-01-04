return {
	settings = {

		Lua = {
      runtime = {
				version = 'LuaJIT',
				path = {
					'?/init.lua',
					'?.lua'
				}
			},
			diagnostics = {
        enable = true,
        globals = { 'vim', 'awesome', 'client', 'root' }
			},
			workspace = {
        library = {
					'/usr/share/nvim/runtime/lua',
					'/usr/share/nvim/runtime/lua/lsp',
					'/usr/share/awesome/lib'
				}
				-- library = {
				-- 	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				-- 	[vim.fn.stdpath("config") .. "/lua"] = true,
				-- 	'/usr/share/awesome/lib',
				-- },
			},
      completion = {
				enable = true,
			},
		},
	},
}
