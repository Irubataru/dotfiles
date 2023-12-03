-- Interactive evaluation for Neovim

local M = {
  "Olical/conjure",
  ft = { "clojure", "fennel" },
}

M.dependencies = {
  {
    "PaterJason/cmp-conjure",
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, {
        name = "buffer",
        option = {
          sources = {
            { name = "conjure" },
          },
        },
      })
      cmp.setup(config)
    end,
  },
}

M.config = function()
  require("conjure.main").main()
  require("conjure.mapping")["on-filetype"]()
end

M.init = function()
  -- Set configuration options here
  vim.g["conjure#log#jump_to_latest#enabled"] = true
  vim.g["conjure#log#jump_to_latest#cursor_scroll_position"] = "bottom"

  -- Disable keymaps that interfere with others I have
  vim.g["conjure#client#clojure#nrepl#mapping#connect_port_file"] = false
  vim.g["conjure#client#clojure#nrepl#mapping#refresh_changed"] = false
end

return M
