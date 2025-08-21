-- Provides AI-assisted coding, editing, and chat features.
return {
	"yetone/avante.nvim",
	build = "make",
	event = "VeryLazy",
	version = false,
	---@module 'avante'
	---@type avante.Config
	opts = {
		provider = "copilot",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",

		--- The optional dependencies.
		"nvim-telescope/telescope.nvim", -- File selector.
		"hrsh7th/nvim-cmp", -- Autocompletion for avante commands and mentions,
		"stevearc/dressing.nvim", -- UI for user input prompts and dialogs.
		"nvim-tree/nvim-web-devicons", -- Icons for UI elements.
		"zbirenbaum/copilot.lua", -- Enables GitHub Copilot as a provider for Avante.
		{
			-- Avante responses are formatted in Markdown.
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	config = function(_, opts)
		require("avante").setup({
			-- The 'system_prompt' as function ensures LLM always has latest MCP server state.
			-- This is evaluated for every message, even in existing chats.
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,

			-- Using function prevents requiring mcphub before it's loaded
			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,
		})
	end,
}
