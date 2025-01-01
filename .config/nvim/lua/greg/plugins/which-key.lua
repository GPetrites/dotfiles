return {
  "folke/which-key.nvim",
  event = "VimEnter",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
        spec = {
            { '<leader>f', group = "Find" },
            { '<leader>x', group = "Trouble" },
            { '<leader>s', group = "Splits" },
            { '<leader>g', group = "Git" },
        }
  },
}
