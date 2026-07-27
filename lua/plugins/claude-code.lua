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
      -- Ctrl keys work inside the Claude terminal: single key events like the
      -- toggle, so they fire in terminal mode without timeoutlen ambiguity.
      new_session = "<C-.>",
      new_worktree = "<leader>cw",
      -- <C-i> is the same key as <Tab> in nvim, so Tab in the Claude prompt
      -- also triggers prev-session. Accepted trade-off.
      prev_session = "<C-i>",
      next_session = "<C-o>",
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
    for _, lhs in ipairs({ km.new_worktree, km.close_tab }) do
      pcall(vim.keymap.del, "t", lhs)
    end
    -- <C-o>/<C-i> are vim's jumplist motions: keep them session-switchers only
    -- inside the Claude terminal, not globally in normal mode.
    for _, lhs in ipairs({ km.prev_session, km.next_session }) do
      pcall(vim.keymap.del, "n", lhs)
    end
  end,
}
