-- Simplifies configuring built-in LSP support in Neovim. Provides pre-defined setups
-- for many language servers without installing them.
return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			filetypes = { "lua" },
		})

		lspconfig.pylsp.setup({
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						autopep8 = {
							enabled = false,
						},
						flake8 = {
							enabled = true,
						},
					},
				},
			},
		})

		lspconfig.kotlin_language_server.setup({
			filetypes = { "kotlin", "kt" },
			settings = {
				kotlin = {
					lint = {
						enabled = true,
					},
				},
			},
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = {
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"typescriptreact",
			},
			init_options = {
				html = {
					options = {
						-- For possible options.
						-- https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
					},
				},
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, {})
	end,
}
