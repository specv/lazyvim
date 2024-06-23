return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>qs", "<cmd>Telescope session-lens<cr>", desc = "Sessions" },
    { "<leader>qw", function() vim.cmd.SessionSave(vim.fn.input("Session Name")) end, desc = "Save Session As" },
  },
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require("auto-session").setup {
      auto_session_enable_last_session = true,
      auto_session_use_git_branch = false,
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }
  end,
}

