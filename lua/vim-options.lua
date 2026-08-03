vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- Headless server over mosh: no X clipboard, and nvim's OSC 52 autodetect
-- needs $SSH_TTY, which mosh does not set. Wire it up explicitly instead.
-- Write-only: mosh forwards OSC 52 copies to Ghostty/Blink but cannot read
-- the local clipboard, so p/P paste the last yank; Cmd+V pastes local content.
local osc52 = require("vim.ui.clipboard.osc52")
local function paste_from_unnamed()
  return { vim.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
end
vim.g.clipboard = {
  name = "osc52-write-only",
  copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
  paste = { ["+"] = paste_from_unnamed, ["*"] = paste_from_unnamed },
}
vim.opt.clipboard = "unnamed,unnamedplus"
vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.timeoutlen = 400

-- Navigate vim panes betterop
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<c-w>", ":w<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.keymap.set("n", "<c-x>", ":bd<CR>")
vim.keymap.set("n", "<c-z>", ':echo "Do not exit please"<CR>')
vim.keymap.set("n", "<Esc>", ":noh<CR>")

vim.wo.number = true
