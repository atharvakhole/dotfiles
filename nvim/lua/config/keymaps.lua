-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<Esc>")

-- control backspace deletes word in insert mode
vim.keymap.set("i", "<C-H>", "<C-w>")

-- Visual block move

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Move by display lines in wrapped text
keymap("n", "j", "gj", opts)
keymap("n", "gj", "j", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gk", "k", opts)

-- Tabs
keymap("n", "<leader>c", ":tabclose<CR>", opts)
keymap("n", "<Tab>", ":tabnext<CR>", opts)
keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)

-- Buffers
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bN", ":bprevious<CR>", opts)

-- Force override LazyVim's picker keymaps to use FzfLua
vim.keymap.set(
  "n",
  "<leader>ff",
  "<cmd>FzfLua files<cr>",
  { desc = "Find Files (Root Dir)", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader><space>",
  "<cmd>FzfLua files<cr>",
  { desc = "Find Files (Root Dir)", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>/",
  "<cmd>FzfLua live_grep<cr>",
  { desc = "Grep (Root Dir)", noremap = true, silent = true }
)
