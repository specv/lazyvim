return {
  "olimorris/persisted.nvim",
  lazy = false,
  keys = {
    { "<leader>qs", "<cmd>Telescope persisted<cr>", desc = "Sessions" },
    { "<leader>qc", function()
      local time = os.date("*t")
      local formatted_time = string.format("%04d%02d%02d-%02d%02d%02d", time.year, time.month, time.day, time.hour, time.min, time.sec)
      local cmd = "cp " .. vim.v.this_session .. " " .. vim.v.this_session:gsub("@@","-Snapshot-"..formatted_time.."@@")
      os.execute(cmd)
      print(cmd)
    end, desc = "Snapshot Current Session" },
  },
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal,winpos,localoptions"
    -- https://github.com/olimorris/persisted.nvim/discussions/117
    -- https://github.com/rmagatti/auto-session/issues/224
    local group = vim.api.nvim_create_augroup("PersistedHooks", {})
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "PersistedSavePre",
      group = group,
      callback = function(session)
        require("edgy").close()

        -- Close any tabs with these filetypes
        local fts_to_match = { 'Neogit', 'Diffview' }

        -- Look for any windows with buffers that match fts_to_match
        local function should_close_tab(tabpage)
          local windows = vim.api.nvim_tabpage_list_wins(tabpage)
          for _, window in ipairs(windows) do
            local buffer = vim.api.nvim_win_get_buf(window)
            local filetype = vim.api.nvim_get_option_value('filetype', { buf = buffer })
            for _, v in ipairs(fts_to_match) do
              if string.find(filetype, '^' .. v) then
                return true
              end
            end
          end
          return false
        end

        -- Close any tabs that have the filetypes in fts_to_match
        local tabpages = vim.api.nvim_list_tabpages()
        for _, tabpage in ipairs(tabpages) do
          if should_close_tab(tabpage) then
            local tabNr = vim.api.nvim_tabpage_get_number(tabpage)
            vim.cmd('tabclose ' .. tabNr)
          end
        end
      end
    })
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "PersistedTelescopeLoadPre",
      group = group,
      callback = function(session)
        -- Save the currently loaded session using a global variable
        require("persisted").save({ session = vim.g.persisted_loaded_session })

        -- Delete all of the open buffers
        vim.api.nvim_input("<ESC>:%bd!<CR>")
      end,
    })

    require("persisted").setup {
      autosave = true,
      autoload = true,
      on_autoload_no_session = function()
        vim.cmd.SessionLoadLast()
      end,
      use_git_branch = true,
      telescope = {
        mappings = {
          change_branch = "<c-b>",
          copy_session = "<c-s>",
          delete_session = "<c-d>",
        }
      },
    }
  end,
}
