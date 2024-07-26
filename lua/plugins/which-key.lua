return {
  "folke/which-key.nvim",
  opts = {
    delay = 200,
    defaults = {
      --["<leader><tab>"] = { desc = "which_key_ignore" },
    },
    icons = {
      mappings = true,
      rules = {
        { pattern = "gpt", icon = "", color = "red" },
        { pattern = "bookmark", icon = "󰃃", color = "red" },
        { pattern = "yazi", icon = "󰇥", color = "yellow" },
        { pattern = "lsp", icon = "", color = "cyan" },
        { pattern = "keywordprg", icon = "", color = "cyan" },
      },
    },
  },
}
