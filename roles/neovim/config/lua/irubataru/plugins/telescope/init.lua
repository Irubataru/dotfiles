local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local themes = require("telescope.themes")
local trouble = require("trouble.providers.telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        ["<C-w>"] = actions.close,
      },
      n = {
        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-w>"] = actions.delete_buffer,
        },
      },
    },
    colorscheme = {
      enable_preview = true,
      theme = "ivy",
    },
  },
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown({}),
    },
  },
})

telescope.load_extension("ui-select")
telescope.load_extension("projects")

local M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "~/.config/nvim/",
    hidden = true,
  })
end

return M
