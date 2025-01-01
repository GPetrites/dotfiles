vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
--keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- save file
keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
--keymap.set('n', '<C-d>', '<C-d>zz', opts)
--keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
--keymap.set('n', 'n', 'nzzzv')
--keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
keymap.set("n", "<leader>s<Up>", ":resize -2<CR>", opts)
keymap.set("n", "<leader>s<Down>", ":resize +2<CR>", opts)
keymap.set("n", "<leader>s<Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<leader>s<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>q", ":bdelete<CR>", { desc = "Close buffer" }) -- close buffer
--keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", opts)     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts)     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts)     -- make split windows equal width & height
keymap.set("n", "<leader>sq", ":close<CR>", opts) -- close current split window

-- Navigate between splits
keymap.set("n", "<C-left>", ":wincmd k<CR>", opts)
keymap.set("n", "<C-down>", ":wincmd j<CR>", opts)
keymap.set("n", "<C-up>", ":wincmd h<CR>", opts)
keymap.set("n", "<C-right>", ":wincmd l<CR>", opts)

-- Tabs
--keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
--keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
--keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
--keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
--keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "<A-up>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-down>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
--keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
--keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
--keymap.set('n', '<leader>Y', [["+Y]])
