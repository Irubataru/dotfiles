local M = {}

M.setup = function(client)
  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
      au! * <buffer>
      autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]]
  end
end

return M
