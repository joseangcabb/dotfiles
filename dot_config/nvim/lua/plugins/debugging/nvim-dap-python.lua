return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap_python = require("dap-python")
    local python_path = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    dap_python.setup(python_path)

    -- Install pytest inside Mason's debugpy virtualenv
    -- ~/.local/share/nvim/mason/packages/debugpy/venv/bin/python -m pip install pytest
    dap_python.test_runner = "pytest"

    vim.keymap.set("n", "<leader>dpm", function()
      dap_python.test_method()
    end, { desc = "Debug python method" })

    vim.keymap.set("n", "<leader>dpc", function()
      dap_python.test_class()
    end, { desc = "Debug python class" })

    vim.keymap.set("v", "<leader>dps", function()
      dap_python.debug_selection({
        config = {
          name = "Debug selection",
        },
        console = "externalTerminal",
      })
    end, { desc = "Debug selection new" })
  end,
}
