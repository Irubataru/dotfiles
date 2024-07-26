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

M.keys = {
  { "<leader>gc", "<cmd>Gcommit<CR>", desc = "git commit" },
  { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "git diff" },
  { "<leader>gg", "<cmd>aboveleft 16split|0Git<CR>", desc = "git status" },
  { "<leader>gr", "<cmd>0Gllog<cr>", desc = "git show file revisions in quickfix list" },
}

M.config = function()
  vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "fugitive://*",
    command = [[set bufhidden=delete]],
  })
end

return M
