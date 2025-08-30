return function(lspconfig, capabilities)
  lspconfig.pyright.setup({
    capabilities = capabilities,
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  })

  lspconfig.ruff.setup({
    capabilities = capabilities,

    init_options = {
      settings = {
        logLevel = "debug",
      },
    },

    on_attach = function(client, bufnr)
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end,
  })
end
