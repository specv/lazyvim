return {
  "robitx/gp.nvim",
  lazy = false,
  keys = {
    { "<leader>i", "", desc = "gpt", mode = { "n", "v" } },
    { "<leader>if", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
    { "<leader>ii", "<cmd>GpChatToggle<cr>", desc = "Chat Toggle", mode = "n" },
    { "<leader>ii", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Chat Toggle", mode = "v" },
    { "<leader>ir", "<cmd>GpAppend<cr>", desc = "Rewrite", mode = "n" },
    { "<leader>ir", ":<C-u>'<,'>GpAppend<cr>", desc = "Rewrite", mode = "v" },
    { "<leader>ic", "<cmd>GpContext<cr>", desc = "Modify Context" },
    { "<leader>is", "<cmd>GpStop<cr>", desc = "Stop Generating" },
    { "<leader>ia", pick_agent, desc = "Pick Agent" },
  },
  config = function()
    local gp = require("gp")
    local o_open_buf = gp.open_buf
    gp.open_buf = function(...)
      local buf = o_open_buf(...)
      -- disable cmp
      require("cmp.config").set_buffer( { enabled = false }, buf )
      -- disable spell check
      vim.api.nvim_buf_set_option(buf, "spell", false)
      -- disable markdownlint (also in nvim-lint.lua)
      -- vim.api.nvim_buf_set_lines(buf, 1, 1, false, { "<!-- markdownlint-disable -->" })

      return buf
    end
    require("gp").setup {
      openai_api_endpoint = os.getenv("OPENAI_API_HOST") .. "/v1/chat/completions",
      -- [feat: add option to set chat buftype to prompt](https://github.com/Robitx/gp.nvim/issues/94)
      chat_prompt_buf_type = false,
      hooks = {
        -- example of adding command which writes unit tests for the selected code
        UnitTests = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please respond by writing table driven unit tests for the code above."
          local agent = gp.get_command_agent()
          gp.Prompt(params, gp.Target.enew, nil, agent.model, template, agent.system_prompt)
        end,
        -- example of adding command which explains the selected code
        Explain = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please respond by explaining the code above."
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
        end,
        -- example of usig enew as a function specifying type for the new buffer
        CodeReview = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please analyze for code smells and suggest improvements."
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.enew("markdown"), nil, agent.model, template, agent.system_prompt)
        end,
        -- example of adding command which opens new chat dedicated for translation
        Translator = function(gp, params)
          local agent = gp.get_command_agent()
          local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
          gp.cmd.ChatNew(params, agent.model, chat_system_prompt)
        end,
        -- example of making :%GpChatNew a dedicated command which
        -- opens new chat with the entire current buffer as a context
        BufferChatNew = function(gp, _)
            -- call GpChatNew command in range mode on whole buffer
            vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        end,
      }
    }
  end
}
