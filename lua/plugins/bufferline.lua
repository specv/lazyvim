local highlights = require("catppuccin.groups.integrations.bufferline").get()()
highlights.tab_selected.fg = "#ff007f"

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
      indicator = {
        style = "underline",
      },
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slant",
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
    },
    highlights = highlights,
    --highlights = {
    --  tab_selected = {
    --    fg = "#ff007f",
    --  },
    --  buffer_selected = {
    --    bold = true,
    --    italic = true,
    --  },
    --},
  },
}
