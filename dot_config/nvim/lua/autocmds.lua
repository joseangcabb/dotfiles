local autocmd = vim.api.nvim_create_autocmd

-- Define indent settings per filetype group.
local indent_settings = {
  {
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
    size = 2,
  },
  {
    filetypes = { "kotlin" },
    size = 4,
  },
}

-- Apply indent.
for _, setting in ipairs(indent_settings) do
  autocmd("FileType", {
    pattern = setting.filetypes,
    callback = function()
      vim.opt_local.tabstop = setting.size
      vim.opt_local.softtabstop = setting.size
      vim.opt_local.shiftwidth = setting.size
    end,
    desc = string.format("Set indent to %d spaces", setting.size),
  })
end
