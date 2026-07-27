return {
  "mb6611/claude-multi.nvim",
  dependencies = { "folke/snacks.nvim" },
  event = "VeryLazy",
  opts = {
    layout = "float", -- "float" or "sidebar"
    float_width = 0.9,
    float_height = 0.9,
    keymaps = {
      toggle = "<C-,>",
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
  config = function(_, opts)
    require("claude-multi").setup(opts)
    -- setup() also registers these in terminal mode, so every <Space> typed
    -- in the Claude prompt waits on 'timeoutlen' before reaching the terminal.
    -- The toggle stays: <C-,> is a single key event, no timeout ambiguity.
    local km = opts.keymaps
    for _, lhs in ipairs({ km.new_session, km.new_worktree, km.prev_session, km.next_session, km.close_tab }) do
      pcall(vim.keymap.del, "t", lhs)
    end
  end,
}
