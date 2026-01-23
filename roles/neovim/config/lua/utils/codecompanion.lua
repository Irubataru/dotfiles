local relative_path = require("utils.file").relative_path

local M = {}

---Adds a file to CodeCompanion chat
---@param path string? The path to the file to add, if not set, use current buffer
---@param chat CodeCompanion.Chat? The chat to add the file to, opens last chat or new chat if not set
M.add_file_to_chat = function(path, chat)
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

return M
