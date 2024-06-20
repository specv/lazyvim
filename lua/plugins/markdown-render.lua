return {
  "MeanderingProgrammer/markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  lazy = false,
  keys = {
    { "<leader>cpi", function() require("render-markdown").toggle() end, ft = "markdown", desc = "Toggle Markdown Preview (Inside)"}
  },
  config = function()
    require("render-markdown").setup {}
  end
}
