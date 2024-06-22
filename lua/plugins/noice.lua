return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      signature = {
        -- disable for lsp-signature
        -- error:
        --   vim.lsp.handlers["textDocument/signatureHelp"] has been overwritten by another plugin?
        --   Either disable the other plugin or set config.lsp.signature.enabled = false in your Noice config.
        enabled = true
      }
    },
    presets = {
      lsp_doc_border = true,
      long_message_to_split = true,
      bottom_search = true,
      command_palette = true,
    },
    -- routes = {
    --   {
    --     -- Supress "No information available" notification
    --     filter = {
    --       event = "notify",
    --       find = "No information available",
    --     },
    --     opts = { skip = true },
    --   },
    -- },
  }
}
