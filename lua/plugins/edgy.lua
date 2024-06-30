return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.animate = { enabled = false }
    table.insert(opts.left, {
      pinned = true,
      title = "Aerial Symbols",
      ft = "aerial",
      open = "AerialOpen!",
    })
  end,
}
