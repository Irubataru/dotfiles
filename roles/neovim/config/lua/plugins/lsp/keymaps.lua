local buf_keymap = vim.api.nvim_buf_set_keymap

local telescope_map = function(key, f)
  buf_keymap(
    0,
    "n",
    key,
    string.format("<cmd>lua require('telescope.builtin').%s()<cr>", f),
    { noremap = true }
  )
end

local M = {}
M.setup = function()
  buf_keymap(
    0,
    "i",
    "<c-s>",
    "<cmd>lua vim.lsp.buf.signature_help()<cr>",
    { noremap = true }
  )

  buf_keymap(
    0,
    "n",
    "<leader>cr",
    "<cmd>lua vim.lsp.buf.rename()<cr>",
    { noremap = true }
  )
  telescope_map("<a-cr>", "lsp_code_actions")
  telescope_map("<leader>ca", "lsp_code_actions")

  buf_keymap(
    0,
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<cr>",
    { noremap = true }
  )
  -- buf_keymap(
  --   0,
  --   "n",
  --   "gD",
  --   "<cmd>lua vim.lsp.buf.declaration()<cr>",
  --   { noremap = true }
  -- )
  buf_keymap(
    0,
    "n",
    "gT",
    "<cmd>lua vim.lsp.buf.type_definition()<cr>",
    { noremap = true }
  )
  buf_keymap(
    0,
    "n",
    "K",
    "<cmd>lua vim.lsp.buf.hover()<cr>",
    { noremap = true }
  )

  --buf_nnoremap { "<space>gI", handlers.implementation }
  --buf_nnoremap { "<space>lr", "<cmd>lua R('tj.lsp.codelens').run()<CR>" }
  --buf_nnoremap { "<space>rr", "LspRestart" }

  telescope_map("gr", "lsp_references")
  telescope_map("gI", "lsp_implementations")
  --telescope_mapper("<space>wd", "lsp_document_symbols", { ignore_filename = true }, true)
  --telescope_mapper("<space>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)
end

return M
