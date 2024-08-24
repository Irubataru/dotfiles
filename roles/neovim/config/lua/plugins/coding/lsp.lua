return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- disable keymaps
      keys[#keys + 1] = { "<leader>cr", false } -- rename

      -- add keymaps
      keys[#keys + 1] = { "<leader>rr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      keys[#keys + 1] =
        { "<a-cr>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
    end,
  },
}
