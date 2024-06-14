return {
  "tiagovla/scope.nvim",
  dependencies = {
    "akinsho/bufferline.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("scope").setup()
  end,
}
