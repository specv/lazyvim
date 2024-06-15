-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Move to window
map({ "n", "t" }, "<A-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map({ "n", "t" }, "<A-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map({ "n", "t" }, "<A-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map({ "n", "t" }, "<A-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })

-- Resize window
map({ "n", "t" }, "<A-J>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map({ "n", "t" }, "<A-K>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map({ "n", "t" }, "<A-H>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map({ "n", "t" }, "<A-L>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Windows
map("n", "<leader>ww", "<cmd>Telescope windows<cr>", { desc = "Windows" })
map("n", "<leader>wr", "<C-w>p", { desc = "Switch to Recent Window" })
map("n", "<leader>wx", "<C-w>c", { desc = "Delete Window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window" })
map("n", "<leader>wz", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
map({ "n", "t" }, "<A-f>", LazyVim.toggle.maximize, { desc = "Maximize Toggle" })

-- Buffers
map("n", "<leader>bb", "<cmd>Telescope scope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>bB", "<cmd>Telescope buffers<cr>", { desc = "Current Tab Buffers" })
map("n", "<leader>br", "<cmd>e #<cr>", { desc = "Switch to Recent Buffer" })
map("n", "<leader>r", "<cmd>e #<cr>", { desc = "Switch to Recent Buffer" })
map("n", "<leader>`", "", { desc = "which_key_ignore" })
map("n", "<leader>bs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search Current Buffer" })
map("n", "<leader>bx", LazyVim.ui.bufremove, { desc = "Delete Current Buffer" })
map("n", "<leader>bX", "<cmd>BufferLineCloseOthers<cr>", { desc = "Delete Other Buffers" })
map("n", "<leader>bv", "<cmd>BufferLinePick<cr>", { desc = "Visual Pick Buffer" })
map("n", "<leader>bd", "", { desc = "Delete Buffers" })
map("n", "<leader>bdv", "<cmd>BufferLinePickClose<cr>", { desc = "Visual Delete Buffer" })
map("n", "<leader>bdl", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete Buffers to the Right" })
map("n", "<leader>bdr", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete Buffers to the Left" })
map("n", "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bl", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<A-,>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<A-.>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
for n = 1, 9 do
  map("n", "g" .. n, function() require("bufferline").go_to_buffer(n, true) end, { desc = 'which_key_ignore' })
end

-- Tabs
map("n", "<leader>tt", "<cmd>Telescope telescope-tabs list_tabs<cr>", { desc = "Tabs"})
map("n", "<leader>tr", "g<tab>", { desc = "Switch to Recent Tab" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>tX", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader>te", function() vim.cmd.BufferLineTabRename(vim.fn.input("Tab Rename")) end, { desc = "Tab Rename" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>t0", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>t$", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<A-[>", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "<A-]>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
