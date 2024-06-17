return {
  "echasnovski/mini.indentscope",
  opts = {
    symbol = '╎',
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "yazi",
        "dashboard",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end
    })
  end
}
