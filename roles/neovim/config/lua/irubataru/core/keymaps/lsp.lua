-- The LSP keymaps are loaded by lspconfig[].on_attach and are therefore provided as a function

local M = {}

M.keys = {
  normal_mode = {
    -- Normal mode keymaps
    g = {
      name = "+goto",
      d = {
        function()
          vim.lsp.buf.definition()
        end,
        "Definitions",
      },
      -- D = { "<cmd>Trouble lsp_definitions<cr>", "Trouble definition" },
      D = {
        function()
          require("goto-preview").goto_preview_definition({})
        end,
        "Preview definition",
      },
      i = {
        function()
          vim.lsp.buf.implementation()
        end,
        "Implementations",
      },
      I = { "<cmd>Trouble lsp_implementations<cr>", "Toruble implementations" },
      l = {
        function()
          vim.diagnostic.open_float()
        end,
        "Hover diagnostic",
      },
      r = {
        function()
          vim.lsp.buf.references()
        end,
        "References",
      },
      R = { "<cmd>Trouble lsp_references<cr>", "Trouble references" },
      -- s = {
      --   function()
      --     require("telescope.builtin").lsp_document_symbols()
      --   end,
      --   "Symbols (document)",
      -- },
      S = {
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end,
        "Symbols (workspace)",
      },
    },
    K = {
      function()
        vim.lsp.buf.hover()
      end,
      "Lsp hover",
    },
    ["<a-cr>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code actions",
    },
  },
  normal_mode_leader = {
    -- Normal mode leader keymaps
    R = {
      name = "+refactor",
      a = {
        function()
          require("telescope.builtin").lsp_references()
        end,
        "Code actions",
      },
      r = {
        function()
          vim.lsp.buf.rename()
        end,
        "Rename",
      },
    },
  },
  insert_mode = {
    -- Insert mode keymaps
    ["<c-s>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "Show signature help",
    },
  },
  visual_mode = {
    -- Visual mode keymaps
  },
}

M.setup = function(bufnr)
  require("irubataru.core.keymaps").register_buffer_keys(M.keys, bufnr)
end

return M
