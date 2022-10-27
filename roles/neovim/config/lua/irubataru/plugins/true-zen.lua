local status_ok, true_zen = pcall(require, "true-zen")

if not status_ok then
  return
end

true_zen.setup({
  modes = {
    ataraxis = {
      padding = {
        top = 3,
        bottom = 3,
      },
      callbacks = {
        open_pre = function()
          vim.cmd("Barbecue hide")
        end,
        close_pos = function()
          vim.cmd("Barbecue show")
        end,
      },
    },
  },
  integrations = {
    lualine = true,
  },
})
