-- The best git plugin

local M = {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gedit",
    "Gsplit",
    "Gdiffsplit",
    "Gvdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
  },
}

M.config = function()
  vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "fugitive://*",
    command = [[set bufhidden=delete]],
  })
end

return M
