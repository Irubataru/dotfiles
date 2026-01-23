local M = {}

M.system_prompt = require("config.prompts.system_prompt").prompt

M.library = {
  ["Investigator"] = require("config.prompts.investigator"),
  ["Document"] = require("config.prompts.document"),
}

return M
