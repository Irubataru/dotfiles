local M = {}

M.schemas = function ()
  return require("schemastore").json.schemas()
end

return M
