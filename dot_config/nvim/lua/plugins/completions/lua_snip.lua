-- Snippet engine written in Lua for Neovim. Enables creation and expansion of dynamic code snippets.
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    -- Integration of LuaSnip with nvim-cmp for snippet completion.
    "saadparwaiz1/cmp_luasnip",

    -- Collection of ready-to-use snippets for 50+ languages.
    "rafamadriz/friendly-snippets",
  },
}
