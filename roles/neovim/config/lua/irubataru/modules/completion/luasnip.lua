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

M.keys = {
  {
    "<c-j>",
    function()
      return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
    end,
    mode = { "i", "s" },
  },
  {
    "<c-k>",
    function()
      return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
    end,
    mode = { "i", "s" },
  },
}

M.config = function()
  local ls = require("luasnip")

  vim.snippet.expand = ls.lsp_expand

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.snippet.active = function(filter)
    filter = filter or {}
    filter.direction = filter.direction or 1

    if filter.direction == 1 then
      return ls.expand_or_jumpable()
    else
      return ls.jumpable(filter.direction)
    end
  end

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.snippet.jump = function(direction)
    if direction == 1 then
      if ls.expandable() then
        return ls.expand_or_jump()
      else
        return ls.jumpable(1) and ls.jump(1)
      end
    else
      return ls.jumpable(-1) and ls.jump(-1)
    end
  end

  vim.snippet.stop = ls.unlink_current

  ls.config.set_config({
    history = false,
    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
  })

  require("luasnip.loaders.from_vscode").lazy_load()

  for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/irubataru/modules/completion/snippets/*.lua", true)) do
    loadfile(ft_path)()
  end
end

return M
