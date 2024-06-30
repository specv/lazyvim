return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { "<leader>H", false },
    {
      "<leader>0",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon File",
    },
  },
}
