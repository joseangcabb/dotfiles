-- Autocompletion plugin for Neovim. Integrates multiple sources like LSP, snippets, buffer, and Copilot.
return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "copilot" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer", keyword_length = 3 },
			}),
			formatting = {
				format = function(entry, item)
					item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						buffer = "[Buf]",
						copilot = "[Copilot]",
					})[entry.source.name]
					return item
				end,
			},
		})
	end,
}
