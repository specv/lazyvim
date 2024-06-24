return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    linters = {
      markdownlint = {
        -- disable markdown lint in gp.nvim
        condition = function(ctx)
          return not (string.find(ctx.filename, "/gp/chats") and string.match(ctx.filename, "%.md$"))
        end
      }
    }
  }
}
