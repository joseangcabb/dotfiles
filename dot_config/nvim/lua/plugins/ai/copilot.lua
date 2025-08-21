-- Integrates gitHub copilot into Neovim, enabling AI-powered code completions.
return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      -- It is recommended to disable copilot.lua's suggestion and panel modules,
      -- as they can interfere with completions properly appearing in copilot-cmp.
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
}
