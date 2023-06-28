-- The LSP keymaps are loaded by rust-tools.server.on_attach and are therefore provided as a function

local M = {}

M.keys = {
  normal_mode = {
    ["<c-k>"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "Rust hover actions",
    },
    g = {
      p = {
        function()
          require("rust-tools").parent_module.parent_module()
        end,
        "Goto parent module"
      }
    }
  },
  normal_mode_leader = {},
  insert_mode = {},
  visual_mode = {},
}

M.keys = vim.tbl_deep_extend("force", require("irubataru.core.keymaps.lsp").keys, M.keys)

M.setup = function(bufnr)
  require("irubataru.core.keymaps").register_buffer_keys(M.keys, bufnr)
end

return M
