-- Improves syntax highlighting, indentation, and code understanding in Neovim using tree-sitter parsers.
-- Enables better editing features like smart selection, folding, text objects, and integrates with other
-- tools like auto-tag and context commenting.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "kotlin" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
