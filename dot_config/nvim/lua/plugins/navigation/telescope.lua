-- Powerful fuzzy finder plugin for Neovim. Allows searching files,
-- grep content, buffers, help tags, etc. via an extensible fuzzy UI.
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>tf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>tg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git" },
    },

    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
}
