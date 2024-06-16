return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>fy",
      function()
        require("yazi").yazi()
      end,
      desc = "Open the Yazi",
    },
    {
      "<leader>fY",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the Yazi in working directory" ,
    },
  },
  opts = {
      open_for_directories = false,
  },
}
