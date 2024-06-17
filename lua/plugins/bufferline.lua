return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  keys = {
    -- Delete Buffers to the Left
    { "<leader>bl", false },
    -- Delete Buffers to the Right
    { "<leader>br", false },
    -- Delete Other Buffers
    { "<leader>bo", false },
  },
  opts = {
    options = {
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
    },
    -- highlights = {
    --   tab_selected = {
    --     fg = "#ff007f",
    --   },
    --   buffer_selected = {
    --     bold = true,
    --     italic = true,
    --   },
    -- },
    highlights = require("catppuccin.groups.integrations.bufferline").get {
      styles = { "italic", "bold" },
    }
  },
}
