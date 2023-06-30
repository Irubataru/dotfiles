local M = {
  scheme = {
    id = "kanagawa",
    name = "kanagawa",
  },
}

M.setup = function()
  vim.g.seoul256_srgb = 1

  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. M.scheme.name)

  if not status_ok then
    vim.notify("colourscheme " .. M.scheme.name .. " not found")
    vim.cmd([[
    colorscheme default
    set background=dark
  ]])
    return
  end
end

return M
