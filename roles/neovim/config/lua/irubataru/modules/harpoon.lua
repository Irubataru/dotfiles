-- Getting you where you want with the fewest keystrokes

local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = true,
}

M.config = function ()
  require("harpoon").setup()
  require("telescope").load_extension("harpoon")
end

return M
