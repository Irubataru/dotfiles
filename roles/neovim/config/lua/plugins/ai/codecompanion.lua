local relative_path = require("utils.file").relative_path

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
    },
    config = {
      opts = {
        log_level = "DEBUG",
      },
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
        },
        inline = {
          adapter = "anthropic",
        },
      },
      prompt_library = {
        ["Docstring"] = {
          strategy = "inline",
          description = "Generate docstrings for functions and variables",
          opts = {
            is_slash_cmd = true,
            modes = { "n" },
          },
          prompts = {
            {
              role = "system",
              content = [[]],
            },
            {
              role = "user",
              content = function(context) end,
            },
          },
        },
      },
    },
    cmd = { "CodeCompanion", "CodeCompanionChat" },
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
          "<leader>ac",
          function()
            require("codecompanion").actions({})
          end,
          mode = "n",
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
            ["oa"] = "codecompanion_add_files",
          },
        },
      },
    },
  },
}
