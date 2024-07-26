-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete Global Keymaps
vim.keymap.del({ "n", "t" }, "<C-h>")
vim.keymap.del({ "n", "t" }, "<C-j>")
vim.keymap.del({ "n", "t" }, "<C-k>")
vim.keymap.del({ "n", "t" }, "<C-l>")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>L")
---- mini.diff
vim.keymap.del("o", "gh") -- Hunk range textobject (`vgh`, `o` for operator-pending mode / visual character mode)
vim.keymap.del({ "n", "x" }, "gh") -- Apply hunks (`x` for select mode `gh`)
vim.keymap.del({ "n", "v" }, "gH") -- Reset hunks (`v` for visual mode and select mode)
---- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

local map = LazyVim.safe_keymap_set

-- Move to window
map({ "n", "t" }, "<A-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map({ "n", "t" }, "<A-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map({ "n", "t" }, "<A-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map({ "n", "t" }, "<A-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })

-- Resize window (use edgy's resize)
-- map({ "n", "t" }, "<A-J>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- map({ "n", "t" }, "<A-K>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- map({ "n", "t" }, "<A-H>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- map({ "n", "t" }, "<A-L>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Windows
map("n", "<leader>ww", "<cmd>Telescope windows<cr>", { desc = "Telescope Windows" })
map("n", "<leader>wp", function()
  local window_id = require("window-picker").pick_window()
  if window_id then
    vim.api.nvim_set_current_win(window_id)
  end
end, { desc = "Visual Pick Window" })
map("n", "<C-k>", function()
  local window_id = require("window-picker").pick_window()
  if window_id then
    vim.api.nvim_set_current_win(window_id)
  end
end, { desc = "Visual Pick Window" })
map("n", "<leader>wd", "", { desc = "Delete Window" })
map("n", "<leader>wdd", function()
  local window_id = require("window-picker").pick_window()
  if window_id then
    vim.api.nvim_win_close(window_id, false)
  end
end, { desc = "Visual Close Window" })
map("n", "<leader>wdb", "<cmd>:bd<cr>", { desc = "Delete Window and Buffer" })
map("n", "<leader>wr", "<C-w>p", { desc = "Switch to Recent Window" })
map("n", "<leader>r", "<C-w>p", { desc = "Switch to Recent Window" })
map("n", "<leader>wx", "<C-w>c", { desc = "Delete Current Window" })
map("n", "<leader>wX", "<cmd>only<cr>", { desc = "Delete Other Windows" })
map("n", "<leader>w<tab>", "<C-w>w", { desc = "Switch Windows" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window" })
map("n", "<leader>wz", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
map("n", "<leader>w1", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(1))<CR>", { desc = "Go to Window 1" })
map("n", "<leader>w2", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(2))<CR>", { desc = "Go to Window 2" })
map("n", "<leader>w3", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(3))<CR>", { desc = "Go to Window 3" })
map("n", "<leader>w4", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(4))<CR>", { desc = "Go to Window 4" })
map("n", "<leader>w5", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(5))<CR>", { desc = "Go to Window 5" })
map("n", "<leader>w6", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(6))<CR>", { desc = "Go to Window 6" })
map("n", "<leader>w7", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(7))<CR>", { desc = "Go to Window 7" })
map("n", "<leader>w8", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(8))<CR>", { desc = "Go to Window 8" })
map("n", "<leader>w9", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(9))<CR>", { desc = "Go to Window 9" })
map("n", "<leader>w0", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(1))<CR>", { desc = "First Window" })
map("n", "<leader>w$", ":lua vim.api.nvim_set_current_win(vim.fn.win_getid(vim.fn.winnr('$')))<CR>", { desc = "Last Window" })
map("n", "<C-c>", "<C-w>c", { desc = "Delete Current Window" })
map({ "n", "t" }, "<A-f>", function() LazyVim.toggle.maximize() end, { desc = "Maximize Toggle" })

-- Buffers
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Visual Pick Buffer" })
map("n", "<leader>bb", "<cmd>Telescope scope buffers<cr>", { desc = "Telescope Buffers" })
map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Current Tab Buffers" })
map("n", "<leader>br", "<cmd>e #<cr>", { desc = "Switch to Recent Buffer" })
map("n", "<leader><tab>", "<cmd>e #<cr>", { desc = "Switch to Recent Buffer" })
map("n", "<leader>bs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search Current Buffer" })
map("n", "<leader>bx", "", { desc = "Delete Buffers" })
map("n", "<leader>bxx", LazyVim.ui.bufremove, { desc = "Delete Current Buffer" })
map("n", "<leader>bxX", "<cmd>BufferLineCloseOthers<cr>", { desc = "Delete Other Buffers" })
map("n", "<leader>bx0", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete Buffers to the Left" })
map("n", "<leader>bx$", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete Buffers to the Right" })
map("n", "<leader>bxv", "<cmd>BufferLinePickClose<cr>", { desc = "Visual Delete Buffer" })
map("n", "<leader>bxw", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
map("n", "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bl", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to Buffer 1" })
map("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to Buffer 2" })
map("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to Buffer 3" })
map("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to Buffer 4" })
map("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to Buffer 5" })
map("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to Buffer 6" })
map("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to Buffer 7" })
map("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to Buffer 8" })
map("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to Buffer 9" })
map("n", "<leader>b0", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "First Buffer" })
map("n", "<leader>b$", "<cmd>BufferLineGoToBuffer $<cr>", { desc = "Last Buffer" })
map("n", "<leader>b<", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer To Prev" })
map("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer To Next" })
map("n", "<C-j>", "<cmd>BufferLinePick<cr>", { desc = "Visual Pick Buffer" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<A-,>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<A-.>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map({ "n", "i" }, "<C-x>", LazyVim.ui.bufremove, { desc = "Delete Current Buffer" })
map({ "n", "i" }, "<C-q>", "<cmd>:bd<cr>", { desc = "Delete Current Buffer and Window" })
for n = 1, 9 do
  map("n", "<C-" .. n .. ">", function()
    require("bufferline").go_to_buffer(n, true)
  end, { desc = "Go to Buffer " .. n })
end

-- Tabs
map("n", "<leader>t", "", { desc = "tabs" })
map("n", "<leader>tt", "<cmd>Telescope telescope-tabs list_tabs<cr>", { desc = "Telescope Tabs" })
map("n", "<leader>tr", "g<tab>", { desc = "Switch to Recent Tab" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>tX", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader>te", function()
  vim.cmd.BufferLineTabRename(vim.fn.input("Tab Rename"))
end, { desc = "Tab Rename" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>t0", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>t$", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<A-[>", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "<A-]>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
for n = 1, 9 do
  map("n", "<leader>t" .. n, n .. "gt", { desc = "Go to Tab " .. n })
end

-- File / Find
map("n", "<leader>fa", function()
  print(vim.api.nvim_buf_get_name(0))
end, { desc = "Absolutely Path of Current File" })
---- Add border to lazy term
map("n", "<leader>ft", function()
  LazyVim.terminal(nil, { border = "rounded", cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function()
  LazyVim.terminal(nil, { border = "rounded" })
end, { desc = "Terminal (cwd)" })
