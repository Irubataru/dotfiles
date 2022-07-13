local luasnip = require("luasnip")

luasnip.config.set_config({
  history = false,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI",
})

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.add_snippets("ansible", require("irubataru.snippets.ansible"))
luasnip.add_snippets("yaml", require("irubataru.snippets.yaml"))
