-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Move to window
map("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window
map("n", "<A-J>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-K>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-H>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<A-L>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Buffers
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>br", "<cmd>e #<cr>", { desc = "Switch to Recent Buffer" })
map("n", "<leader>bs", "<cmd>:ls<cr>", { desc = "List Buffers" })
map("n", "<leader>bx", "<cmd>:bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<A-,>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<A-.>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Tabs
map("n", "<leader>tt", "<cmd>Telescope telescope-tabs list_tabs<cr>", { desc = "Tabs"})
map("n", "<leader>tr", "g<tab>", { desc = "Switch to Recent Tab" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>tX", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>t0", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>t$", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<A-[>", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "<A-]>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
