return {
  {
    "Mofiqul/vscode.nvim",
    -- setup = function(_, opts)
    --   vim.cmd.colorscheme("vscode")
    -- end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "vscode",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      -- theme = "vscode",
    },
  },
  {
    "akinsho/bufferline.nvim",
    optional = true,
    -- opts = function(_, opts)
    --   if (vim.g.colors_name or ""):find("catppuccin") then
    --     opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
    --   end
    -- end,
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slope",
      },
    },
  },
}
