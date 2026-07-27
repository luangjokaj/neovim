return {
  "mb6611/claude-multi.nvim",
  dependencies = { "folke/snacks.nvim" },
  event = "VeryLazy",
  opts = {
    layout = "float", -- "float" or "sidebar"
    float_width = 0.9,
    float_height = 0.9,
    keymaps = {
      toggle = "<leader>cc",
      new_session = "<leader>cn",
      new_worktree = "<leader>cw",
      prev_session = "<leader>ch",
      next_session = "<leader>cl",
      close_tab = "<leader>cx",
      -- disabled: needs the `recall` CLI, and <leader>cr is LSP references
      recall = false,
      recall_worktree = false,
    },
  },
}
