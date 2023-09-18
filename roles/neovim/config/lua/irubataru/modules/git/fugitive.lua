-- The best git plugin

local M = {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gllog",
    "Gclog",
    "Gedit",
    "Gsplit",
    "Gdiffsplit",
    "Gvdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "Glgrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRename",
  },
}

M.config = function()
  vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "fugitive://*",
    command = [[set bufhidden=delete]],
  })
end

return M
