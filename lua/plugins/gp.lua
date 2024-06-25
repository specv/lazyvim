local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local function get_relevant_agents()
  local gp = require("gp")
  local agents = {}
  local buf = vim.api.nvim_get_current_buf()
  local file_name = vim.api.nvim_buf_get_name(buf)
  local is_chat = gp.not_chat(buf, file_name) == nil
  local current_agent, agent_list

  if is_chat then
    current_agent = gp._state.chat_agent
    agent_list = gp._chat_agents
  else
    current_agent = gp._state.command_agent
    agent_list = gp._command_agents
  end

  for _, name in ipairs(agent_list) do
    if name == current_agent then
      table.insert(agents, "* " .. name)
    else
      table.insert(agents, "  " .. name)
    end
  end

  return agents, is_chat
end

local function select_agent()
  local gp = require("gp")
  local agents, is_chat = get_relevant_agents()
  local prompt_title = is_chat and 'Select Chat Agent' or 'Select Command Agent'

  pickers.new({}, {
    prompt_title = prompt_title,
    finder = finders.new_table {
      results = agents
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local agent_name = selection[1]:sub(3)
        gp.cmd.Agent({ args = agent_name })
      end)
      return true
    end,
  }):find()
end

local HOOKS = {
  UnitTests = {
    desc = "Writes unit tests for the selected code",
    selection = true,
    fn = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
          .. "```{{filetype}}\n{{selection}}\n```\n\n"
          .. "Please respond by writing table driven unit tests for the code above."
      local agent = gp.get_command_agent()
      gp.Prompt(params, gp.Target.enew, nil, agent.model, template, agent.system_prompt)
    end,
  },
  Explain = {
    desc = "Explains the selected code",
    selection = true,
    fn = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
          .. "```{{filetype}}\n{{selection}}\n```\n\n"
          .. "Please respond by explaining the code above."
      local agent = gp.get_chat_agent()
      gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
    end,
  },
  CodeReview = {
    desc = "Analyze for code smells and suggest improvements for selected code",
    selection = true,
    fn = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
          .. "```{{filetype}}\n{{selection}}\n```\n\n"
          .. "Please analyze for code smells and suggest improvements."
      local agent = gp.get_chat_agent()
      gp.Prompt(params, gp.Target.enew("markdown"), nil, agent.model, template, agent.system_prompt)
    end,
  },
  Translator = {
    desc = "Translate between English and Chinese",
    selection = false,
    fn = function(gp, params)
      local agent = gp.get_command_agent()
      local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
      gp.cmd.ChatNew(params, agent.model, chat_system_prompt)
    end,
  },
}

function gp_pick_command(mode)
  local command_names = {}
  for name, cmd in pairs(HOOKS) do
    if mode == 'v' or (mode == 'n' and not cmd.selection) then
      table.insert(command_names, name .. " - " .. cmd.desc)
    end
  end

  pickers.new({}, {
    prompt_title = 'Select Command',
    finder = finders.new_table {
      results = command_names
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local command = selection[1]:match("^(%S+)")
        if mode == "v" then
          command = ":<C-u>'<,'>Gp" .. command .. "<CR>"
        else
          command = ":Gp" .. command .. "<CR>"
        end

        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), "c", true)  -- 执行选中的命令
      end)
      return true
    end,
  }):find()
end

return {
  "robitx/gp.nvim",
  lazy = false,
  keys = {
    { "<leader>i", "", desc = "gpt", mode = { "n", "v" } },
    { "<leader>ie", "<cmd>GpChatFinder<cr>", desc = "Chat Explorer" },
    { "<leader>ii", "<cmd>GpChatToggle<cr>", desc = "Chat Toggle", mode = "n" },
    { "<leader>ii", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Chat Toggle", mode = "v" },
    { "<leader>ir", "<cmd>GpAppend<cr>", desc = "Rewrite", mode = "n" },
    { "<leader>ir", ":<C-u>'<,'>GpAppend<cr>", desc = "Rewrite", mode = "v" },
    { "<leader>ic", "<cmd>GpContext<cr>", desc = "Modify Context" },
    { "<leader>is", "<cmd>GpStop<cr>", desc = "Stop Generating" },
    { "<leader>ia", select_agent, desc = "Select Agent" },
    { "<leader>if", function() gp_pick_command("n") end, desc = "Select Function", mode = "n" },
    { "<leader>if", ':<C-u>lua gp_pick_command("v")<cr>', desc = "Select Function", mode = "v" },
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

    local hooks = {}
    for k, v in pairs(HOOKS) do
      hooks[k] = v.fn
    end
    require("gp").setup {
      openai_api_endpoint = os.getenv("OPENAI_API_HOST") .. "/v1/chat/completions",
      -- [feat: add option to set chat buftype to prompt](https://github.com/Robitx/gp.nvim/issues/94)
      chat_prompt_buf_type = false,
      hooks = hooks,
    }
  end
}
