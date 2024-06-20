return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      signature = {
        -- disable for lsp-signature
        -- error:
        --   vim.lsp.handlers["textDocument/signatureHelp"] has been overwritten by another plugin?
        --   Either disable the other plugin or set config.lsp.signature.enabled = false in your Noice config.
        enabled = false
      }
    }
  }
}
