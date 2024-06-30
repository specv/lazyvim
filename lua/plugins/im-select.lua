return {
  "keaising/im-select.nvim",
  config = function()
    require("im_select").setup({
      -- disable restore previous IM, as it sometimes fails to work even when the IM is switched
      set_previous_events = {},
    })
  end,
}
