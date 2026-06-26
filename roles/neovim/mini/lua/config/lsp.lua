local configured = {
  "basedpyright",
}

local function init()
  vim.iter(configured):each(vim.schedule_wrap(function(server_name)
    vim.lsp.enable(server_name)
  end))
end

if vim.g.did_very_lazy ~= nil then
  vim.schedule(init)
else
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    once = true,
    callback = vim.schedule_wrap(init),
  })
end
