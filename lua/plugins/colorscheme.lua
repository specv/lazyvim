return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "soft"
      vim.opt.background = "dark"
      vim.cmd.colorscheme("gruvbox-material")
    end,
    keys = {
      {
        "<leader>wt",
        function()
          if vim.o.background == "light" then
            vim.o.background = "dark"
          else
            vim.o.background = "light"
          end
        end,
        desc = "Toggle Dark and Light Theme",
      },
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  }
}
