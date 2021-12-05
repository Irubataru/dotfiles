local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")

require('telescope').setup({
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-x>"] = actions.delete_buffer,
        },
      },
    },
    lsp_workspace_diagnostics = {

    },
  },
})

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true})
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true})
keymap('n', '<leader>fv', "<cmd>lua require('plugins.telescope').search_dotfiles()<cr>", {noremap = true})

keymap('n', '<leader>fe', "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics({severity = 1})<cr>", {noremap = true})
keymap('n', '<leader>fE', "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
keymap('n', '<C-b>', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true})

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.config/nvim/",
        hidden = true,
    })
end

return M;
