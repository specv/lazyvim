return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {"<leader>fb", false},
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
          ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
        }
      }
    },
    extensions = {
      zoxide = {
        mappings = {
          ["<CR>"] = { action = function(selection)
            vim.cmd.Neotree(selection.path)
            vim.cmd.tcd(selection.path)
          end },
        }
      }
    }
  },
}
