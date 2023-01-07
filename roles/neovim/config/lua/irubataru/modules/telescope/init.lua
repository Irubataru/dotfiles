local M = {
  "nvim-telescope/telescope.nvim",
}

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}

M.config = function()
  local telescope = require("telescope")

  require("trouble.providers.telescope")

  local actions = require("telescope.actions")
  local themes = require("telescope.themes")
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
end

return M
