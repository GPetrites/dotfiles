vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('n', '<leader>e', '<cmd>Neotree source=filesystem reveal=true position=float<cr>')
