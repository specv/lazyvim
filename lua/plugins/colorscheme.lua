return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.01,
        },
        term_colors = true,
        integrations = {
          bufferline = false,
          mini = {
            enabled = true,
            indentscope_color = "green",
          },
          diffview = true,
          window_picker = true,
          ufo = true,
        },
        custom_highlights = function(colors)
          return {
            TabLineSel = { bg = "#ff007f" },
          }
        end
      }
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
