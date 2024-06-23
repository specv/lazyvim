-- Do some hack to enhance bufferline's appearance in transparent 
-- background by defined a new option `separator_style_tab`
local constants = require("bufferline.constants")
constants.sep_chars.slash = { "", "/" }
constants.sep_chars.backslash = { "", "\\" }
constants.sep_chars.blank = { " ", " " }

local tabpages = require("bufferline.tabpages")
local config = require("bufferline.config")
local o_get = tabpages.get
tabpages.get = function()
  local o_separator_style = config.options.separator_style
  config.options.separator_style = config.options.separator_style_tab
  local result = o_get()
  config.options.separator_style = o_separator_style
  return result
end

-- Override catppuccin's bufferline colorscheme
local palette = require("catppuccin.palettes").get_palette()
local highlights = require("catppuccin.groups.integrations.bufferline").get{ styles = {} }()
highlights.buffer_visible.fg = palette.surface2
highlights.tab_separator_selected.underline = true
highlights.tab_selected.fg = "#ff007f"
highlights.numbers_selected.fg = "#ff007f"
highlights.numbers_visible.fg = "#ff007f"

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
    -- Prev Buffer
    { "<S-h>", false },
    -- Next Buffer
    { "<S-l>", false },
  },
  opts = {
    options = {
      indicator = {
        style = "underline",
      },
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_tab_indicators = true,
      show_close_icon = false,
      separator_style = { "⟩", "⟩" },
      separator_style_tab = "blank",
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
    },
    highlights = highlights,
  },
}
