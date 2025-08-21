-- none-ls.nvim (an updated fork of null-ls) allows using external tools (formatters, linters) as LSP sources.
return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>fl",
      function() vim.lsp.buf.format() end,
      desc = "Format buffer with LSP",
      mode = "n",
    },
  },
  config = function()
    local null_ls = require("null-ls")

    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.ktlint.with({
          extra_args = { "--indent-size=4" },
        }),
      },
    })
  end,
}
