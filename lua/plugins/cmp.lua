return {
  "nvim-cmp",
  keys = {
    -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/mapping.lua
    {
      "<C-j>",
      function()
        local cmp = require('cmp')
        local types = require('cmp.types')
        if cmp.visible() then
          cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      mode = "i"
    },
    {
      "<C-k>",
      function()
        local cmp = require('cmp')
        local types = require('cmp.types')
        if cmp.visible() then
          cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      mode = "i"
    },
  }
}
