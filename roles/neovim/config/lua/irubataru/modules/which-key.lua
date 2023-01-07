local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.config = function()
  require("which-key").setup({
    show_help = false,
    triggers = "auto",
    plugins = {
      spelling = true,
      presets = {
        operators = true,
      },
    },
    key_labels = { ["<leader>"] = "," },
  })
end

return M
