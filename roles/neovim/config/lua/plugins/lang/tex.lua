return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.keymap.set("n", "<leader>cp", "<cmd>VimtexCompile<cr>", { desc = "Compile latex document" })
    end,
  },
}
