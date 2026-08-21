return {
  {
    "CoreyKaylor/diffbandit.nvim",
    config = true,
    cmd = { "DiffBandit", "DiffBanditGit", "DiffBanditGitCurrent", "DiffBanditCommitPanel" },
    keys = {
      { "<leader>gd", "<cmd>DiffBanditGitCurrent<cr>", desc = "Git diff current file" },
    },
  },
}
