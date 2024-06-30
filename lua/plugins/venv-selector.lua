return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp", -- Use this branch for the new version
  opts = {
    settings = {
      search = {
        anaconda_base = {
          command = "fd '/python$' /opt/homebrew/anaconda3/envs --full-path --color never -E /proc --type symlink",
          type = "anaconda",
        },
      },
      options = {
        notify_user_on_venv_activation = false,
      },
    },
  },
}
