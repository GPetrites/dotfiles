return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  },
  config = function()
    local todo_comments = require("todo-comments")
    todo_comments.setup()

    local keymap = vim.keymap

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    keymap.set("n", "<leader>ft", ":TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
