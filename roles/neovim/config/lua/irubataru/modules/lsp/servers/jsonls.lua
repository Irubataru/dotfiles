local M = {}

M.config = {
  settings = {
    json = {
      schemas = require("irubataru.modules.languages.json.schemas").schemas(),
    },
  },
}

return M
