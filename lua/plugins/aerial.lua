return {
  "stevearc/aerial.nvim",
  opts = {
    keymaps = {
      ["<C-j>"] = false,
      ["<C-k>"] = false,
      ["j"] = "actions.down_and_scroll",
      ["k"] = "actions.up_and_scroll",
    },
  },
}
