local M = {}

M.config = {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
}

return M
