local add_file_to_chat = require("utils.codecompanion").add_file_to_chat

return {
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
}
