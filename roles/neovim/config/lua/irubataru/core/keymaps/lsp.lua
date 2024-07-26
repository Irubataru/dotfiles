-- The LSP keymaps are loaded by lspconfig[].on_attach and are therefore provided as a function

local M = {}

M.setup = function(bufnr)
  local wk = require("which-key")

  wk.add({
    buffer = bufnr,
    {
      "gd",
      function()
        vim.lsp.buf.definition()
      end,
      desc = "Definitions",
    },
    {
      "gD",
      function()
        require("goto-preview").goto_preview_definition({})
      end,
      desc = "Preview definition",
    },
    {
      "gi",
      function()
        vim.lsp.buf.implementation()
      end,
      desc = "Implementations",
    },
    { "gI", "<cmd>Trouble lsp_implementations<cr>", desc = "Toruble implementations" },
    {
      "gl",
      function()
        vim.diagnostic.open_float()
      end,
      desc = "Hover diagnostic",
    },
    {
      "gr",
      function()
        vim.lsp.buf.references()
      end,
      desc = "References",
    },
    { "gR", "<cmd>Trouble lsp_references<cr>", desc = "Trouble references" },
    -- { "gs", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Symbols (document)"},
    {
      "gS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end,
      desc = "Symbols (workspace)",
    },
    {
      "K",
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Lsp hover",
    },
    {
      "<a-cr>",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code actions",
    },
  })

  -- Refactor
  wk.add({
    buffer = bufnr,
    { "<leader>R", group = "refactor" },
    {
      "<leader>Ra",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "Code actions",
    },
    {
      "<leader>Rr",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
    },
  })

  wk.add({
    mode = "i",
    buffer = bufnr,
    {
      "<c-s>",
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = "Show signature help",
    },
  })
end

return M
