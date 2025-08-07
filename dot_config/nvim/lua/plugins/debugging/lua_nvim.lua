-- DAP adapter for debugging Lua code within Neovim using nvim-dap.
return {
  "jbyuki/one-small-step-for-vimkind",
  keys = {
    {
      "<leader>dl",
      function()
        require("osv").launch({ port = 8086 })
      end,
      desc = "Launch lua nvim adapter",
      mode = "n",
    },
  },
}
