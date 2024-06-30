return {
  "neovim/nvim-lspconfig",
  opts = function()
    -- disable keymaps below, auto popup is enough
    --   { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
    --   { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
    -- [Customizing LSP Keymaps](https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }
  end,
}
