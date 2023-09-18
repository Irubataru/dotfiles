-- Wisely add "end" in Ruby, Vimscript, Lua, etc. Tree-sitter aware alternative to tpope's vim-endwise

local M = {
  "RRethy/nvim-treesitter-endwise",
  ft = { "lua", "ruby", "bash", "sh" },
  event = "InsertEnter",
  dependencies = { { "nvim-treesitter/nvim-treesitter" } },
}

M.config = function()
  require("nvim-treesitter.configs").setup({
    endwise = {
      enable = true,
    },
  })
end

return M
