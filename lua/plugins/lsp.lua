return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        -- mason = false,
      },
      ruff = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      },
    },
  },
}
