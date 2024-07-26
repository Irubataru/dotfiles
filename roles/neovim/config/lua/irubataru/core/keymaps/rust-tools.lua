-- The LSP keymaps are loaded by rust-tools.server.on_attach and are therefore provided as a function

local M = {}

M.setup = function(bufnr)
  require("irubataru.core.keymaps.lsp").setup(bufnr)

  local wk = require("which-key")

  wk.add({
    buffer = bufnr,
    {
      "<c-k>",
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      desc = "Rust hover actions",
    },
    {
      "gp",
      function()
        require("rust-tools").parent_module.parent_module()
      end,
      desc = "Goto parent module",
    },
  })

end

return M
