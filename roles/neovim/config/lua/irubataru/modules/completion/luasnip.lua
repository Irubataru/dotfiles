-- Snippet Engine for Neovim written in Lua.

local M = {
  "L3MON4D3/LuaSnip",
}

M.dependencies = {
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },
}

M.config = function()
  local luasnip = require("luasnip")

  luasnip.config.set_config({
    history = false,
    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
  })

  require("luasnip.loaders.from_vscode").lazy_load()

  luasnip.add_snippets("lua", require("irubataru.modules.completion.snippets.lua"))
  luasnip.add_snippets("ansible", require("irubataru.modules.completion.snippets.ansible"))
  luasnip.add_snippets("yaml", require("irubataru.modules.completion.snippets.yaml"))
  luasnip.add_snippets("rust", require("irubataru.modules.completion.snippets.rust"))
  luasnip.add_snippets("html", require("irubataru.modules.completion.snippets.html"))
  luasnip.add_snippets("sh", require("irubataru.modules.completion.snippets.bash"))
  luasnip.add_snippets("tex", require("irubataru.modules.completion.snippets.tex"))
end

return M
