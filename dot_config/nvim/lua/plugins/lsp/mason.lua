-- Tool manager for LSP servers, DAPs, linters, and formatters. Simplifies installing and
-- managing external dev tools inside Neovim.
return {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    require("mason").setup()
  end,
}
