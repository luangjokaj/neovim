return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "html" },
    },
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

      -- `vim` used to be declared in .luarc.json, but that file makes lua_ls
      -- ignore the settings lazydev sends at runtime, so it lives here now
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            -- `missing-fields` fires on plugin opts tables whose type
            -- annotations mark practically-optional fields as required
            -- (nvim-treesitter's TSConfig being the usual offender)
            diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
          },
        },
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
