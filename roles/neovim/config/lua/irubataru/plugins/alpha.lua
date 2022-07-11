local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", "<cmd>Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", "<cmd>Telescope live_grep <CR>"),
  dashboard.button("g", "  Git status", "<cmd>aboveleft 16split|0Git<CR>"),
	dashboard.button("c", "  Configuration", "<cmd>e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
