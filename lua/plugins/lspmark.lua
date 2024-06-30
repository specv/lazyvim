return {
  "tristone13th/lspmark.nvim",
  keys = {
    { "<leader>m", "", desc = "Bookmark" },
    { "<leader>mb", "<cmd>Telescope lspmark<cr>", desc = "Bookmark" },
    {
      "<leader>mn",
      function()
        require("lspmark.bookmarks").toggle_bookmark({ with_comment = false })
      end,
      desc = "Bookmark",
    },
    {
      "<leader>mc",
      function()
        require("lspmark.bookmarks").toggle_bookmark({ with_comment = true })
      end,
      desc = "Bookmark With Comment",
    },
    {
      "<leader>ms",
      function()
        require("lspmark.bookmarks").show_comment()
      end,
      desc = "Show Comment",
    },
    {
      "<leader>me",
      function()
        require("lspmark.bookmarks").modify_comment()
      end,
      desc = "Modify Comment",
    },
    {
      "<leader>md",
      function()
        require("lspmark.bookmarks").delete_line()
      end,
      desc = "Delete Line",
    },
    {
      "<leader>mv",
      function()
        require("lspmark.bookmarks").delete_visual_selection()
      end,
      desc = "Delete Selection",
    },
    {
      "<leader>mp",
      function()
        require("lspmark.bookmarks").paste_text()
      end,
      desc = "Paste Text",
    },
  },
}
