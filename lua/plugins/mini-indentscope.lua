return {
  "echasnovski/mini.indentscope",
  opts = {
    symbol = '╎',
  },
  config = function(_, opts)
    require("mini.indentscope").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "yazi",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end
    })
  end
}
