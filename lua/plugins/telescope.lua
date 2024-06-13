return {
  "nvim-telescope/telescope.nvim",
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
  },
}
