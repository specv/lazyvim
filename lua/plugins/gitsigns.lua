return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "LazyFile",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 1000,
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      map({ "n", "v" }, "<leader>gh", "", "Hunk (Gitsigns)")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>gh]", "", "Next Hunk")
      map("n", "<leader>gh[", "", "Prev Hunk")
      map("n", "<leader>gh]h", function() gs.nav_hunk("next") end, "Next Hunk") -- or `]h` `]H` (mini.diff)
      map("n", "<leader>gh[h", function() gs.nav_hunk("prev") end, "Prev Hunk") -- or `[h` `[H` (mini.diff)
      map("n", "<leader>gh]H", function() gs.nav_hunk("last") end, "Last Hunk")
      map("n", "<leader>gh[H", function() gs.nav_hunk("first") end, "First Hunk")
      map('v', '<leader>ghs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Stage Hunk")
      map('v', '<leader>ghr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Reset Hunk")
      map("n", "<leader>ghs", gs.stage_hunk, "Stage Hunk")
      map("n", "<leader>ghr", gs.reset_hunk, "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", '<leader>ght', "", "Toggle")
      map("n", '<leader>ghtb', gs.toggle_current_line_blame, "Toggle Current Line Blame")
      map("n", '<leader>ghtd', gs.toggle_deleted, "Toggle Deleted")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
    end,
  },
}
