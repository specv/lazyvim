return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.animate = { enabled = false }
    -- table.insert(opts.right, 1, {
    --   title = "Symbols",
    --   ft = "trouble",
    --   pinned = true,
    --   open = "Trouble symbols toggle focus=false",
    -- })
  end
}
