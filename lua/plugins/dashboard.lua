return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local projects = {
      action = LazyVim.news.changelog,
      desc = " Lazy Changelog",
      icon = " ",
      key = "L",
    }

    projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
    projects.key_format = "  %s"

    table.insert(opts.config.center, #opts.config.center - 2, projects)
  end,
}
