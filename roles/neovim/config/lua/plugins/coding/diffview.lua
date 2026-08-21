return {
  {
    "dlyongemallo/diffview-plus.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewToggle",
      "DiffviewFileHistory",
    },
    keys = {
      {
        "<leader>ge",
        "<cmd>DiffviewToggle<cr>",
        desc = "Git explorer (diffview)",
      },
      {
        "<leader>gE",
        "<cmd>DiffviewOpen main<cr>",
        desc = "Diff explorer against main",
      },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
    },
    opts = {
      view = {
        merge_tool = {
          layout = "diff4_mixed",
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
        },
      },
      file_history_panel = {
        win_config = {
          position = "top",
          height = 10,
        },
      },
      keymaps = {
        view = {
          ["q"] = function()
            require("diffview.actions").goto_file_edit_close()
          end,
        },
        file_panel = {
          ["q"] = function()
            vim.cmd("DiffviewClose")
          end,
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ge", false },
    },
  },
}
