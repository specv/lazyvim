return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.01,
        },
        term_colors = true,
        integrations = {
          mini = {
            enabled = true,
            indentscope_color = "green",
          },
        }
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
