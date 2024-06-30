return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  keys = {
    { "<leader>gg", "<cmd>lua toggleterm_lazygit_toggle()<CR>", desc = "Lazygit" },
    { "<leader>gG", "", desc = "" },
  },
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = 1,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      insert_mappings = true,
      terminal_mappings = true,
      highlights = {
        -- set border color, link to catppuccin FloatBorder
        FloatBorder = { link = "FloatBorder" },
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      count = 11,
      hidden = true,
      direction = "float",
      float_opts = {
        border = "single",
      },
    })
    function toggleterm_lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
