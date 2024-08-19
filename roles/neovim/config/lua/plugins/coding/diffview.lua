return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>ge", "<cmd>DiffviewOpen<CR>", desc = "Git explorer" },
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
    },
  },
}
