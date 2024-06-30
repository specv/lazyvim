return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader><cr>",
      function()
        require("yazi").yazi()
      end,
      desc = "Yazi",
    },
    {
      "<leader>fy",
      function()
        require("yazi").yazi()
      end,
      desc = "Yazi",
    },
    {
      "<leader>fY",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Yazi (cwd)",
    },
  },
  opts = {
    open_for_directories = false,
  },
}
