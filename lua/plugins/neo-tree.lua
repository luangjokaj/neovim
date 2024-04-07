return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = {
            ".git",
            ".vscode",
            ".next",
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
    })
    vim.keymap.set("n", "<c-s>", ":Neotree position=left<CR>", {})
    vim.keymap.set("n", "<leader>show", ":Neotree reveal<CR>", {})
  end,
}
