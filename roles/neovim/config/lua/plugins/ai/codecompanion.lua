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

---Save the CodeCompanion buffer to a file in .ai.chats/
---@param bufnr number The buffer number to save
---@return nil
local function save_codecompanion_buffer(bufnr)
  ---Get the directory where files should be saved
  ---@return string # The path to the save directory
  local function get_save_directory()
    -- Try to find git root
    local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")

    local save_dir
    if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
      -- We're in a git repository, use .ai.chats at the root
      save_dir = git_root .. "/.ai.chats/"
    else
      -- Not in a git repository, use ai.chats in current working directory
      save_dir = vim.fn.getcwd() .. "/.ai.chats/"
    end

    -- Create directory if it doesn't exist
    if vim.fn.isdirectory(save_dir) == 0 then
      vim.fn.mkdir(save_dir, "p")
    end
    return save_dir
  end

  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local save_dir = get_save_directory()

  -- Extract the unique ID from the buffer name
  local id = bufname:match("%[CodeCompanion%] (%d+)")
  local date = os.date("%Y-%m-%d")
  local save_path

  if id then
    -- Use date plus ID to ensure uniqueness
    save_path = save_dir .. date .. "_codecompanion_" .. id .. ".md"
  else
    -- Fallback with timestamp to ensure uniqueness if no ID
    save_path = save_dir .. date .. "_codecompanion_" .. os.date("%H%M%S") .. ".md"
  end

  -- Write buffer content to file
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local file = io.open(save_path, "w")
  if file then
    file:write(table.concat(lines, "\n"))
    file:close()
  end
end

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "Davidyz/VectorCode",
        enabled = false,
        version = "*",
        build = "uv tool upgrade vectorcode",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "VectorCode",
        opts = true,
      },
    },
    opts = function()
      -- Autocommand to save code companion chats
      vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "BufLeave", "FocusLost" }, {
        group = vim.api.nvim_create_augroup("CodeCompanionAutoSave", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local bufname = vim.api.nvim_buf_get_name(bufnr)

          if bufname:match("%[CodeCompanion%]") then
            save_codecompanion_buffer(bufnr)
          end
        end,
      })

      return {
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
            -- slash_commands = {
            --   codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
            -- },
            -- tools = {
            --   vectorcode = {
            --     description = "Run VectorCode to retrieve the project context.",
            --     callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
            --   },
            -- },
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
      }
    end,
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
            ["ga"] = "codecompanion_add_files",
          },
        },
      },
    },
  },
}
