local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

M.config = function()
  local dashboard = require("alpha.themes.dashboard")

  dashboard.section.buttons.val = {
    dashboard.button(
      "f",
      "  Find file",
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    ),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", "<cmd>Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", "<cmd>Telescope live_grep <CR>"),
    dashboard.button("g", "  Git status", "<cmd>DiffviewOpen<CR>"),
    dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
  }

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
