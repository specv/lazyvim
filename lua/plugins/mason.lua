return {
  "williamboman/mason.nvim",
  keys = {
    { "<leader>cm", false },
  },
  opts = {
    ensure_installed = {
      "svelte-language-server",
    }
  },
}
