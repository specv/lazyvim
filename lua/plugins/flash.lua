return {
  "folke/flash.nvim",
  opts = function()
    vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#ff007c", fg = "#c8d3f5", bold = true })
    vim.api.nvim_set_hl(0, "FlashMatch", { bg = "#2e7de9", fg = "#c8d3f5", bold = true })
    vim.api.nvim_set_hl(0, "FlashCurrent", { bg = "#ff966c", fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#545c7e", bold = true })
  end,
}
