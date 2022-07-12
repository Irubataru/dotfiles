local M = {
  options = {
    use = false
  }
}

if M.options.use then
  vim.g.copilot_no_tab_map = true
  vim.keymap.set("i", "<M-@>", 'copilot#Accept("")', { silent = true, expr = true })
end

return M
