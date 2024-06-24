return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function(_, opts)
      table.insert(opts.sections.lualine_b, {
        "grapple",
        cond = function()
          return package.loaded["grapple"] and require("grapple").exists()
        end
      })
      table.insert(opts.sections.lualine_b, {
        function()
          -- lualine will display a blank placeholder even if we return an empty string
          -- return '%{&ft == "toggleterm" ? "terminal-".b:toggle_number : ""}'
          if vim.bo.filetype == "toggleterm" and vim.b.toggle_number then
            return "terminal-" .. vim.b.toggle_number
          else
            return ""
          end
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin"
      }
    }
  }
}
