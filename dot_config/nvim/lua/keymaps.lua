-- Select all (normal mode).
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Copy absolute file path to system clipboard.
vim.api.nvim_set_keymap(
  "n", "<C-c>", ":let @+ = expand('%:p')<CR>", { noremap = true, silent = true })
