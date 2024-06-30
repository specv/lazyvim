return {
  "nvimdev/lspsaga.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<S-h>", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
    { "<S-l>", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },

    { "<leader>l", "", desc = "lsp" },
    { "<leader>ld", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
    { "<leader>lD", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
    { "<leader>lh", "<cmd>Lspsaga hover_doc ++keep<cr>", desc = "Hover Doc (pin)" },
    { "<leader>lH", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" },
    { "<leader>lf", "<cmd>Lspsaga finder def+ref+imp<cr>", desc = "Finder" },
    { "<leader>ls", "<cmd>Lspsaga outline<cr>", desc = "Symbols (outline)" },
    { "<leader>li", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming Calls" },
    { "<leader>lo", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing Calls" },
    { "<leader>ln", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "Restart LSP Server" },
    { "<leader>ll", "<cmd>LspInfo<cr>", desc = "LSP Info" },
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      },
      symbol_in_winbar = {
        enable = false,
      },
      outline = {
        layout = "float",
      },
      lightbulb = {
        enable = false,
      },
      diagnostic = {
        show_code_action = false,
        jump_num_shortcut = false,
      },
      finder = {
        keys = {
          edit = "<C-o>",
          vsplit = "<C-v>",
          split = "<C-x>",
          tabe = "<C-t>",
          quit = "q",
          close = "<C-c>",
        },
      },
      definition = {
        keys = {
          edit = "<C-o>",
          vsplit = "<C-v>",
          split = "<C-x>",
          tabe = "<C-t>",
          quit = "q",
          close = "<C-c>",
        },
      },
    })
  end,
}
