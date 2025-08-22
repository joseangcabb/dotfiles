-- Bridges mason.nvim with nvim-lspconfig for automatic LSP setup. Installs and configures
-- LSPs managed by Mason with zero manual setup.
return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pylsp", "kotlin_language_server", "ts_ls" },
    })
  end,
}
