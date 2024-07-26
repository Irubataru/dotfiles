local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
}

M.keys = {
  {
    "<C-b>",
    function()
      require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
    end,
    desc = "Find buffer",
  },
  {
    "<leader>F",
    function()
      require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
    end,
    desc = "Find text",
  },
  {
    "<leader>fb",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "Find buffers",
  },
  {
    "<leader>fd",
    function()
      require("telescope.builtin").lsp_definitions()
    end,
    desc = "Find definitions",
  },
  {
    "<leader>fe",
    function()
      require("telescope.builtin").lsp_workspace_diagnostics({ severity = 1 })
    end,
    desc = "Find errors",
  },
  {
    "<leader>fE",
    function()
      require("telescope.builtin").lsp_workspace_diagnostics()
    end,
    desc = "Find all diagnostics",
  },
  {
    "<leader>ff",
    function()
      require("telescope").extensions.smart_open.smart_open()
    end,
    desc = "Find files",
  },
  {
    "<leader>fg",
    function()
      require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
    end,
    desc = "Find text",
  },
  {
    "<leader>fh",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "Find help",
  },
  {
    "<leader>fi",
    function()
      require("telescope.builtin").lsp_implementations()
    end,
    desc = "Find implementations",
  },
  { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find projects" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open recent file" },
  {
    "<leader>fR",
    function()
      require("telescope.builtin").lsp_references()
    end,
    desc = "Find references",
  },
  {
    "<leader>fv",
    function()
      require("irubataru.modules.telescope.search_dotfiles").search_dotfiles()
    end,
    desc = "Vim dotfiles",
  },
  {
    "<leader>fV",
    function()
      require("irubataru.modules.telescope.search_dotfiles").search_dotfiles_grep()
    end,
    desc = "Vim dotfiles text search",
  },
}

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  { "danielfalk/smart-open.nvim" },
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
      smart_open = require("irubataru.modules.telescope.smart-open").fzf_options,
    },
  })

  telescope.load_extension("ui-select")
  telescope.load_extension("projects")
end

return M
