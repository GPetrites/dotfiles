return {
  "chrisgrieser/nvim-spider",
  opts = {
    -- skipInsignificantPunctuation = false,
  },
  keys = {
    {
      "<a-w>",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Next word (spider)",
    },
    {
      "<a-e>",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Prev word (spider)",
    },
    {
      "<a-b>",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Next end of word (spider)",
    },
  },
}
