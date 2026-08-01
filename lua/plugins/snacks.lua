return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ██▀███   ██▓ ▄▄▄       ███▄    █   ▄████  ██▓    ▓█████
▓██ ▒ ██▒▓██▒▒████▄     ██ ▀█   █  ██▒ ▀█▒▓██▒    ▓█   ▀
▓██ ░▄█ ▒▒██▒▒██  ▀█▄  ▓██  ▀█ ██▒▒██░▄▄▄░▒██░    ▒███
▒██▀▀█▄  ░██░░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█  ██▓▒██░    ▒▓█  ▄
░██▓ ▒██▒░██░ ▓█   ▓██▒▒██░   ▓██░░▒▓███▀▒░██████▒░▒████▒
░ ▒▓ ░▒▓░░▓   ▒▒   ▓▒█░░ ▒░   ▒ ▒  ░▒   ▒ ░ ▒░▓  ░░░ ▒░ ░
  ░▒ ░ ▒░ ▒ ░  ▒   ▒▒ ░░ ░░   ░ ▒░  ░   ░ ░ ░ ▒  ░ ░ ░  ░
  ░░   ░  ▒ ░  ░   ▒      ░   ░ ░ ░ ░   ░   ░ ░      ░
   ░      ░        ░  ░         ░       ░     ░  ░   ░  ░]],
        -- explicit telescope actions so the dashboard uses the same picker
        -- as the rest of the config (Snacks.dashboard.pick would prefer
        -- the built-in snacks picker over telescope)
        keys = {
          {
            icon = "󰈞 ",
            key = "f",
            desc = "Find File",
            action = function()
              require("telescope.builtin").find_files()
            end,
          },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = "󰊄 ",
            key = "g",
            desc = "Live Grep",
            action = function()
              require("telescope.builtin").live_grep()
            end,
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = function()
              require("telescope.builtin").oldfiles()
            end,
          },
          { icon = " ", key = "e", desc = "File Explorer", action = ":Neotree toggle" },
          { icon = "󰊢 ", key = "l", desc = "LazyGit", action = ":LazyGit" },
          {
            icon = " ",
            key = "c",
            desc = "Nvim Config",
            action = function()
              require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
            end,
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = "󰊢 ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
