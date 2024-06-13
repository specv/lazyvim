return {
  "folke/which-key.nvim",
  opts = {
    triggers_nowait = {
      -- spelling
      "z=",
    },
    defaults = {
      ["<leader><tab>"] = { name = "<deprecated>" },
      ["<leader>t"] = { name = "tabs" },
    }
  },
}
