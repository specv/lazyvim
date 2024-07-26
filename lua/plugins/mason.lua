return {
  "williamboman/mason.nvim",
  keys = {
    { "<leader>cm", false },
  },
  opts = {
    ensure_installed = {
      "elixir-ls",
      "pyright",
      "ruff",
      "ruff-lsp",
      "stylua",
      "lua-language-server",
      "typescript-language-server",
      "svelte-language-server",
      "marksman",
      "markdown-toc",
      "markdownlint-cli2",
      "alex",
      "shfmt",
      "json-lsp",
      "taplo",
    }
  },
}
