-- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

local M = {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
  },
}

M.dependencies = {
  { "nvim-lua/plenary.nvim" },
}

M.keys = {
  { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "git file history" },
  { "<leader>gl", "<cmd>DiffviewOpen<CR>", desc = "git diff log" },
}

M.opts = {
  file_panel = {
    listing_style = "tree",
    tree_options = {
      flatten_dirs = true,
      folder_statuses = "only_folded",
    },
    win_config = {
      position = "top",
      height = 16,
    },
  },
  file_history_panel = {
    win_config = {
      position = "top",
      height = 10,
    },
  },
}

return M
