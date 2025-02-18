-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- For conciseness
local opts = { noremap = true, silent = true }

-- Buffers
keymap.set("n", "<C-Tab>", ":bnext<CR>", opts)
keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", opts)

keymap.del({ "i", "x", "n", "s" }, "<C-s>")

keymap.set("n", "<leader>bs", "<cmd>w<cr><esc>", { desc = "Save File" })

keymap.set("n", "<leader>bq", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })

-- Tabs
keymap.set("n", "[<tab>", ":tabprevious<CR>", { silent = true, desc = "Previous tab" })
keymap.set("n", "]<tab>", ":tabnext<CR>", { silent = true, desc = "Next tab" })
keymap.set("n", "<leader><tab>q", ":tabclose<CR>", { silent = true, desc = "Close tab" })

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

local is_windows = vim.loop.os_uname().version:match("Windows")
if is_windows then
  vim.defer_fn(function()
    vim.opt.shellslash = false
  end, 5000)
end
