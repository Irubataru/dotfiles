local relative_path = require("utils.file").relative_path

local system_prompt = [[[
You are an AI programming assistant named "CodeCompanion", working within the Neovim text editor.

You can answer general programming questions and perform the following tasks:
* Answer general programming questions.
* Explain how the code in a Neovim buffer works.
* Review the selected code from a Neovim buffer.
* Generate unit tests for the selected code.
* Propose fixes for problems in the selected code.
* Scaffold code for a new workspace.
* Find relevant code to the user's query.
* Propose fixes for test failures.
* Answer questions about Neovim.


Follow the user's requirements carefully and to the letter.
Use the context and attachments the user provides.
Keep your answers short and impersonal, especially if the user's context is outside your core tasks.
All non-code text responses must be written in the ${language} language.
Use Markdown formatting in your answers.
Do not use H1 or H2 markdown headers.
When suggesting code changes or new content, use Markdown code blocks.
To start a code block, use 4 backticks.
After the backticks, add the programming language name as the language ID.
To close a code block, use 4 backticks on a new line.
If the code modifies an existing file or should be placed at a specific location, add a line comment with 'filepath:' and the file path.
If you want the user to decide where to place the code, do not add the file path comment.
In the code block, use a line comment with '...existing code...' to indicate code that is already present in the file.
Code block example:
````languageId
// filepath: /path/to/file
// ...existing code...
{ changed code }
// ...existing code...
{ changed code }
// ...existing code...
````
Ensure line comments use the correct syntax for the programming language (e.g. "#" for Python, "--" for Lua).
For code blocks use four backticks to start and end.
Avoid wrapping the whole response in triple backticks.
Do not include diff formatting unless explicitly asked.
Do not include line numbers in code blocks.

Response guidelines:
* Skip pleasantries, greetings, and unnecessary politeness. Get straight to the point.
* Be critical and analytical. Assume the user is asking because they suspect issues or want rigorous review, not validation.
* Keep responses concise. Don't summarize unless explicitly asked.
* For architectural or conceptual questions, omit code examples unless they're essential to explain the concept. The user will ask for code if needed.
* Focus on potential problems, edge cases, and better alternatives rather than affirming existing solutions.
* Be direct about flaws, inefficiencies, or misconceptions.

When given a task:
1. Think step-by-step and, unless the user requests otherwise or the task is very simple, describe your plan in pseudocode.
2. When outputting code blocks, ensure only relevant code is included, avoiding any repeating or unrelated code.
3. End your response with a short suggestion for the next user turn that directly supports continuing the conversation.

Additional context:
The current date is ${date}.
The user's Neovim version is ${version}.
The user is working on a ${os} machine. Please respond with system specific commands if applicable.
]]

---Adds a file to CodeCompanion chat
---@param path string? The path to the file to add, if not set, use current buffer
---@param chat CodeCompanion.Chat? The chat to add the file to, opens last chat or new chat if not set
local function add_file_to_chat(path, chat)
  path = relative_path(path)

  local codecompanion = require("codecompanion")
  chat = chat or codecompanion.last_chat() or codecompanion.chat()

  -- Unable to assign a chat
  if chat == nil then
    return
  end

  for _, ref in ipairs(chat.refs) do
    if ref.path == path then
      return print("Already added")
    end
  end

  chat.references:add({
    id = "<file>" .. path .. "</file>",
    path = path,
    source = "codecompanion.strategies.chat.slash_commands.file",
    opts = {
      pinned = true,
    },
  })
end

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            schema = {
              extended_thinking = {
                default = false,
              },
            },
          })
        end,
      },
      display = {
        chat = {
          show_settings = false,
        },
        diff = {
          provider = "mini_diff",
        },
      },
      strategies = {
        chat = {
          adapter = "anthropic",
          model = "claude-sonnet-4-5",
          opts = {
            system_prompt = system_prompt,
          },
        },
        inline = {
          adapter = "anthropic",
          model = "claude-sonnet-4-5",
        },
      },
      prompt_library = {
        ["Investigator"] = {
          strategy = "workflow",
          description = "Answer coding questions by investigating the repository",
          prompts = {
            {
              {
                name = "Setup investigation",
                role = "user",
                opts = { auto_submit = false },
                content = function()
                  vim.g.codecompanion_auto_tool_mode = true

                  return [[### Instructions

Your instructions here

### Steps to Follow

You are an expert code and an investigator. You can use tools to analyse the code repository, individual files and configuration, run tests and commands, but NOT change any of the code. You will analyse the code until you have answered the question asked.

Things you can do:
1. Look at the code in the #buffer as that is usually the starting point of the investigation.
2. Use the @cmd_runner tool to look at the respository structure, run tests with `<test_cmd>`, and other useful commands. 
3. Use the @files tool to read necessary files

We'll repeat this cycle until you have found a reasonable answer to the question. Ensure that you under no circumstances edit any of the files.]]
                end,
              },
            },
          },
        },
        ["Document"] = {
          strategy = "inline",
          description = "Add documentation to the code",
          opts = {
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "document",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = [[When asked to add documentation to code, follow these steps

1. Identify the programming language.
2. Add documentation headers to functions, classes, ... where appropriate using the @editor tool

Use the natural documenentation formatting for different languages. For example
- Lua uses luals annotations
- C# uses the standard XML documentation
- Typescript uses TSDoc and optionally JSDoc where necessary]],
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return string.format(
                  [[Please add docstrings to this code from buffer %d:

```%s
%s
```
]],
                  context.bufnr,
                  context.filetype,
                  code
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
      extensions = {

        history = {
          enabled = true,
          opts = {
            -- Keymap to open history from chat buffer (default: gh)
            keymap = "gh",
            -- Keymap to save the current chat manually (when auto_save is disabled)
            save_chat_keymap = "sc",
            -- Save all chats by default (disable to save only manually using 'sc')
            auto_save = true,
            -- Number of days after which chats are automatically deleted (0 to disable)
            expiration_days = 0,
            -- Picker interface (auto resolved to a valid picker)
            picker = "default", --- ("telescope", "snacks", "fzf-lua", or "default")
            ---Optional filter function to control which chats are shown when browsing
            chat_filter = nil, -- function(chat_data) return boolean end
            -- Customize picker keymaps (optional)
            picker_keymaps = {
              rename = { n = "r", i = "<M-r>" },
              delete = { n = "d", i = "<M-d>" },
              duplicate = { n = "<C-y>", i = "<C-y>" },
            },
            ---Automatically generate titles for new chats
            auto_generate_title = true,
            title_generation_opts = {
              ---Number of user prompts after which to refresh the title (0 to disable)
              refresh_every_n_prompts = 5, -- e.g., 3 to refresh after every 3rd user prompt
              ---Maximum number of times to refresh the title (default: 3)
              max_refreshes = 3,
            },
            ---On exiting and entering neovim, loads the last chat on opening chat
            continue_last_chat = false,
            ---When chat is cleared with `gx` delete the chat from history
            delete_on_clearing_chat = false,
            ---Directory path to save the chats
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",

            -- Summary system
            summary = {
              -- Keymap to generate summary for current chat (default: "gcs")
              create_summary_keymap = "gcs",
              -- Keymap to browse summaries (default: "gbs")
              browse_summaries_keymap = "gbs",

              generation_opts = {
                context_size = 90000, -- max tokens that the model supports
                include_references = true, -- include slash command content
                include_tool_outputs = true, -- include tool execution results
                system_prompt = nil, -- custom system prompt (string or function)
                format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
              },
            },

            -- -- Memory system (requires VectorCode CLI)
            -- memory = {
            --   -- Automatically index summaries when they are generated
            --   auto_create_memories_on_summary_generation = true,
            --   -- Path to the VectorCode executable
            --   vectorcode_exe = "vectorcode",
            --   -- Tool configuration
            --   tool_opts = {
            --     -- Default number of memories to retrieve
            --     default_num = 10,
            --   },
            --   -- Enable notifications for indexing progress
            --   notify = true,
            --   -- Index all existing memories on startup
            --   -- (requires VectorCode 0.6.12+ for efficient incremental indexing)
            --   index_on_startup = false,
            -- },
          },
        },
      },
    },
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
  },
  {
    optional = true,
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.right = opts.right or {}
      table.insert(opts.right, {
        ft = "codecompanion",
        title = "CodeCompanion",
        size = { width = 80 },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "+ai", icon = { icon = " ", color = "green" } },
        {
          "<leader>aa",
          function()
            require("codecompanion").toggle()
          end,
          mode = "n",
          desc = "CodeCompanion chat",
          icon = { icon = " ", color = "green" },
        },
        {
          "<leader>aA",
          function()
            require("codecompanion").chat()
          end,
          mode = "n",
          desc = "CodeCompanion chat (new)",
          icon = { icon = " ", color = "green" },
        },
        {
          "<leader>ac",
          function()
            require("codecompanion").actions({})
          end,
          mode = "n",
          desc = "CodeCompanion actions",
          icon = { icon = " ", color = "green" },
        },
        {
          "<leader>ac",
          "<cmd>'<,'>CodeCompanionActions<cr>",
          mode = "v",
          desc = "CodeCompanion actions",
          icon = { icon = " ", color = "green" },
        },
        {
          "<cmd>CodeCompanion /document<cr>",
          "<leader>agd",
          mode = "v",
          desc = "CodeCompanion actions",
          icon = { icon = " ", color = "green" },
        },
        {
          "<leader>ad",
          "<cmd>CodeCompanionChat Add<cr>",
          mode = "v",
          desc = "CodeCompanion add to chat",
          icon = { icon = " ", color = "green" },
        },
        {
          "<leader>ad",
          function()
            add_file_to_chat()
          end,
          mode = "n",
          desc = "CodeCompanion add current buffer to chat",
          icon = { icon = " ", color = "green" },
        },
        {
          "<leader>ae",
          "<cmd>CodeCompanion #buffer /explain<cr>",
          mode = "n",
          desc = "CodeCompanion explain current buffer",
          icon = { icon = " ", color = "orange" },
        },
        {
          "<leader>ae",
          "<cmd>CodeCompanion /explain<cr>",
          mode = "v",
          desc = "CodeCompanion explain selection",
          icon = { icon = " ", color = "orange" },
        },
        { "<leader>ag", group = "+generate", icon = { icon = " ", color = "green" } },
        -- {
        --   "<leader>agd",
        --   function() end,
        --   mode = "v",
        --   desc = "Generate documentation",
        --   icon = { icon = "󰷈 ", color = "white" },
        -- },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        commands = {
          codecompanion_add_files = function(state)
            ---Traverses a directory recursively and performs operations on each file/directory.
            ---@param path string The directory path to traverse
            ---@param chat CodeCompanion.Chat The chat instance to use for processing or logging
            local function traverse_directory(path, chat)
              local handle, err = vim.uv.fs_scandir(path)
              if not handle then
                return print("Error scanning directory: " .. err)
              end

              while true do
                local name, type = vim.uv.fs_scandir_next(handle)
                if not name then
                  break
                end

                local item_path = path .. "/" .. name
                if type == "file" then
                  add_file_to_chat(item_path, chat)
                elseif type == "directory" then
                  -- recursive call for a subdirectory
                  traverse_directory(item_path, chat)
                end
              end
            end

            local node = state.tree:get_node()
            local absolute_path = node:get_id()

            local codecompanion = require("codecompanion")
            local chat = codecompanion.last_chat() or codecompanion.chat()

            -- Unable to create new chat session
            if chat == nil then
              return
            end

            local attr = vim.uv.fs_stat(absolute_path)
            if attr and attr.type == "directory" then
              traverse_directory(absolute_path, chat)
            else
              add_file_to_chat(absolute_path, chat)
            end
          end,
        },
        window = {
          mappings = {
            ["ga"] = "codecompanion_add_files",
          },
        },
      },
    },
  },
}
