-- nvim-dap provides Debug Adapter Protocol support for Neovim.
-- Includes a UI via nvim-dap-ui and configuration for debugging Lua within Neovim.
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- UI for debugging
    "nvim-neotest/nvim-nio", -- Support for async operations
  },
  keys = {
    {
      "<leader>dt",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
      mode = "n",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "continue execution",
      mode = "n",
    },
    {
      "<leader>dx",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate debugging",
      mode = "n",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
      mode = "n",
    },
    {
      "<leader>dw",
      function()
        require("dapui").close()
        require("dap").terminate()
      end,
      desc = "Close dap-ui and terminate debugging session",
      mode = "n",
    },
  },
  config = function()
    require("dapui").setup()

    local dap, dapui = require("dap"), require("dapui")

    -- Events to handle opening and closing of dap-ui
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Nvim/Lua debugger
    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    dap.configurations["lua"] = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }
  end,
}
