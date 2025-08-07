-- File explorer sidebar with icons, git integration, and filesystem navigation.
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    -- Utility functions used by many Neovim plugins
    "nvim-lua/plenary.nvim",

    -- Adds file icons based on file type.
    "nvim-tree/nvim-web-devicons",

    -- UI component library used by Neo-tree for windows, inputs, etc.
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>no",
      "<cmd>Neotree reveal<CR>",
      desc = "Open Neo-tree and select the current file",
      mode = "n",
    },
    {
      "<leader>nc",
      "<cmd>Neotree close<CR>",
      desc = "Close Neo-tree",
      mode = "n",
    },
  },
}
