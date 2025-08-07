-- Simplifies configuring built-in LSP support in Neovim. Provides pre-defined setups
-- for many language servers without installing them.
return {
	"neovim/nvim-lspconfig",
	keys = {
		{
			"K",
			function()
				vim.lsp.buf.hover()
			end,
			desc = "LSP hover",
      mode = "n",
		},
		{
			"<leader>ld",
			function()
				vim.lsp.buf.definition()
			end,
			desc = "LSP go to definition",
      mode = "n",
		},
		{
			"<leader>la",
			function()
				vim.lsp.buf.code_action()
			end,
			mode = { "n", "v" },
			desc = "LSP code action",
		},
	},
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

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
