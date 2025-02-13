return {
  {
    "fnune/recall.nvim",
    version = "*",
    opts = true,
    keys = {
      { "<leader>m", "", desc = "+marks" },
      { "<leader>mm", ":RecallToggle<CR>", silent = true, desc = "Toggle Mark" },
      { "<leader>mn", ":RecallNext<CR>", silent = true, desc = "Next Mark" },
      { "<leader>mp", ":RecallPrevious<CR>", silent = true, desc = "Previous Mark" },
      { "<leader>mc", ":RecallClear<CR>", silent = true, desc = "Clear All Marks" },
      {
        "<leader>ms",
        ":Telescope recall layout_config={'prompt_position':'top'} sorting_strategy=ascending<CR>",
        silent = true,
        desc = "Search Marks",
      },
    },
  },
}
