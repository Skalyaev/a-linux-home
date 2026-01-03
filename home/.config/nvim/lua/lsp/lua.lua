return {
	settings = { Lua = {} },

	on_init = function(client)
		local base = client.config.settings.Lua

		local runtime = { version = "LuaJIT" }
		local library = {
			vim.env.VIMRUNTIME,
			"${3rd}/luv/library",
			"${3rd}/busted/library",
		}
		local workspace = {
			library = library,
			checkThirdParty = false,
		}
		local extend = {
			runtime = runtime,
			workspace = workspace,
		}
		client.config.settings.Lua = vim.tbl_deep_extend("force", base, extend)
	end,
}
