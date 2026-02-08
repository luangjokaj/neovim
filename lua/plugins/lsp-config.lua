return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        init_options = {
          preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
        commands = {
          ["_typescript.applyCodeActionCommand"] = function(command, ctx)
            local clients = vim.lsp.get_clients({ bufnr = ctx.bufnr, name = "ts_ls" })
            if #clients == 0 then
              return
            end
            local client = clients[1]
            local arguments = command.arguments or {}
            for _, arg in ipairs(arguments) do
              client:request_sync("workspace/executeCommand", {
                command = arg.command,
                arguments = arg.arguments,
              }, 5000, ctx.bufnr)
            end
          end,
        },
      })

      vim.lsp.config("solargraph", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>cs", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
    end,
  },
}
