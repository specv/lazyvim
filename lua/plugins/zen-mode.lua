return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      options = {
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        signcolumn = "no",
        foldcolumn = "0",
        list = false,
      }
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      alacritty = {
        enabled = true,
        font = "20",
      },
    },
  },
}
