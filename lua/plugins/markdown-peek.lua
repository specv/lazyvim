return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  ft = "markdown",
  keys = {
    { "<leader>cpp", "<cmd>MarkdownPeekToggle<cr>", ft = "markdown", desc = "Toggle Markdown Preview (App)" },
  },
  config = function()
    require("peek").setup {
      auto_load = true,
      close_on_bdelete = true,
      syntax = true,
      update_on_change = true,
      theme = "dark",
      app = "webview",
      filetype = { "markdown" }
    }
    vim.api.nvim_create_user_command("MarkdownPeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("MarkdownPeekClose", require("peek").close, {})
    vim.api.nvim_create_user_command("MarkdownPeekToggle", function()
      local peek = require("peek")
      if peek.is_open() then
        peek.close()
      else
        peek.open()
      end
    end, {})
  end
}
