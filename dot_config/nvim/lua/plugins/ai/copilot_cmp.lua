-- GitHub Copilot source for nvim-cmp, enabling AI-powered completions.
return {
  "zbirenbaum/copilot-cmp",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    require("copilot_cmp").setup({
      debug = true,
    })
  end,
}
