-- The LSP keymaps are loaded by lspconfig[].on_attach and are therefore provided as a function

local M = {}

M.setup = function(bufnr)
  local wk = require("which-key")

  wk.register({
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
  }, { silent = true, noremap = true, buffer = bufnr })

  wk.register({
    -- Normal mode leader keymaps
    c = {
      f = {
        function()
          vim.lsp.buf.format()
        end,
        "Format file",
      },
    },
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
  }, {
    prefix = "<leader>",
    silent = true,
    noremap = true,
    buffer = bufnr,
  })

  wk.register({
    -- Insert mode keymaps
    ["<c-s>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "Show signature help",
    },
  }, {
    mode = "i",
    silent = true,
    noremap = true,
    buffer = bufnr,
  })

  wk.register({
    -- Visual mode keymaps
    c = {
      f = {
        function()
          vim.lsp.buf.range_formatting()
        end,
        "Format file",
      },
    },
  }, {
    mode = "v",
    prefix = "<leader>",
    silent = true,
    noremap = true,
    buffer = bufnr,
  })
end

return M
