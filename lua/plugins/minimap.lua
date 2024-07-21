return {
  "wfxr/minimap.vim",
  lazy = false,
  keys = {
    {
      "<leader>cm",
      "<cmd>MinimapToggle<cr>",
      desc = "Toggle Minimap",
    }
  },
  init = function()
    vim.g.minimap_search_color = "minimapDiffRemoved"
    vim.g.minimap_highlight_search = 1
    vim.g.minimap_highlight_range = 1
    vim.g.minimap_git_colors = 1
    vim.g.minimap_width = 20

    -- TODO: remove this after fixed
    local minimap_group = vim.api.nvim_create_augroup("MiniMapRefresh", { clear = true })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = minimap_group,
      pattern = "*",
      callback = function()
        if vim.g.minimap_opening == 0 then
          vim.cmd("MinimapUpdate")
        end
      end,
    })
  end,
}
