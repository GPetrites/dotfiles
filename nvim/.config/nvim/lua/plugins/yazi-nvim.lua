return {
  {
    "mikavilpas/yazi.nvim",
    keys = {
      { "<leader>y", "", desc = "+Yazi", mode = { "n", "v" } },
      { "<leader>e", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Yazi" },
      { "<leader>yy", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Current file directory" },
      { "<leader>yY", "<cmd>Yazi cwd<cr>", mode = { "n", "v" }, desc = "Current working directory" },
      { "<leader>yr", "<cmd>Yazi toggle<cr>", mode = { "n", "v" }, desc = "Resume last session" },
    },
  },
}
