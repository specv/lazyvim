return {
  "jvgrootveld/telescope-zoxide",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>fz", "<cmd>Telescope zoxide list<CR>", desc = "Zoxide" },
  },
}
