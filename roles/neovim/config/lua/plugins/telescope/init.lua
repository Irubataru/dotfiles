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

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.config/nvim/",
        hidden = true,
    })
end

return M;
