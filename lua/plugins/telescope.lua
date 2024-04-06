return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
      vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "AdvancedGitSearch" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
      vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          advanced_git_search = {
            diff_plugin = "fugitive",
            show_builtin_git_pickers = false,
            entry_default_author_or_date = "author", -- one of "author" or "date"
            keymaps = {
              toggle_date_author = "<C-a>",
              open_commit_in_browser = "<C-o>",
              copy_commit_hash = "<C-y>",
            },
          },
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("advanced_git_search")
    end,
  },
}
