-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- For conciseness
local opts = { noremap = true, silent = true }

-- Buffers
keymap.set("n", "<C-Tab>", ":bnext<CR>", opts)
keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", opts)
keymap.set("n", "<C-q>", function()
  Snacks.bufdelete()
end, opts)

-- Navigate between splits
if os.getenv("ZELLIJ_SESSION_NAME") == nil then
  keymap.set("n", "<a-left>", ":wincmd h<CR>", opts)
  keymap.set("n", "<a-down>", ":wincmd j<CR>", opts)
  keymap.set("n", "<a-up>", ":wincmd k<CR>", opts)
  keymap.set("n", "<a-right>", ":wincmd l<CR>", opts)
else
  keymap.set("n", "<a-left>", ":ZellijNavigateLeft<CR>", opts)
  keymap.set("n", "<a-down>", ":ZellijNavigateDown<CR>", opts)
  keymap.set("n", "<a-up>", ":ZellijNavigateUp<CR>", opts)
  keymap.set("n", "<a-right>", ":ZellijNavigateRight<CR>", opts)
end
