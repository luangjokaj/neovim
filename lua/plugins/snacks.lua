return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      width = 58,
      preset = {
        header = "──────────  R I A N G L E  ──────────",
        -- explicit telescope actions so the dashboard uses the same picker
        -- as the rest of the config (Snacks.dashboard.pick would prefer
        -- the built-in snacks picker over telescope)
        keys = {
          {
            icon = "󰈞 ",
            key = "f",
            desc = "find file",
            action = function()
              require("telescope.builtin").find_files()
            end,
          },
          {
            icon = "󰊄 ",
            key = "g",
            desc = "live grep",
            action = function()
              require("telescope.builtin").live_grep()
            end,
          },
          {
            icon = " ",
            key = "r",
            desc = "recent",
            action = function()
              require("telescope.builtin").oldfiles()
            end,
          },
          { icon = " ", key = "e", desc = "explorer", action = ":Neotree toggle" },
          { icon = "󰊢 ", key = "l", desc = "lazygit", action = ":LazyGit" },
          { icon = " ", key = "q", desc = "quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header", padding = 2 },
        { section = "keys", padding = 2 },
        { icon = " ", title = "recent", section = "recent_files", limit = 3, indent = 2, padding = 2 },
        {
          icon = "󰊢 ",
          title = "git",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          indent = 2,
          ttl = 5 * 60,
        },
        { section = "startup" },
      },
    },
  },
}
