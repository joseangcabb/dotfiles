-- Integrates Neovim's built-in UI selection (vim.ui.select) with Telescope,
-- allowing a consistent fuzzy dropdown for things like code actions or LSP options.
return {
	"nvim-telescope/telescope-ui-select.nvim",
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
