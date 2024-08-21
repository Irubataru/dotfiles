return {
  {
    "gaoDean/autolist.nvim",
    ft = { "markdown", "text" },
    -- Load this after other apps, default priority is 50
    priority = 0,
    opts = function()
      require("autolist").setup()

      local map = LazyVim.safe_keymap_set

      -- TODO: Fix tab overwrite
      map("i", "<tab>", "<cmd>AutolistTab<cr>")
      map("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
      map("n", "o", "o<cmd>AutolistNewBullet<cr>")
      map("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
      map("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
      -- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")
      --
      require("utils.keymaps").imap_cr()

      -- cycle list types with dot-repeat
      map("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
      map("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

      -- if you don't want dot-repeat
      -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
      -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

      -- functions to recalculate list on edit
      map("n", ">>", ">><cmd>AutolistRecalculate<cr>")
      map("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
      map("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
      map("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
  },
}
