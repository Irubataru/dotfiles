--- Utility methods for defining keymaps

local M = {}

--- Imap <cr> function when both autolist and mini.pairs is active
M.autolist_cr = function()
  local timeoutms = 0
  vim.loop.new_timer():start(
    timeoutms,
    0,
    vim.schedule_wrap(function()
      require("autolist").new_bullet()
    end)
  )

  return require("mini.pairs").cr()
end

--- Map the <cr> button depending on which plugins that are loaded
M.imap_cr = function()
  local map = LazyVim.safe_keymap_set
  local opts = { expr = true, replace_keycodes = false }

  if require("utils.lazy").is_loaded("mini.pairs") then
    if require("utils.lazy").is_loaded("autolist.nvim") then
      opts.desc = "Autolist + MiniPairs <CR>"
      map("i", "<cr>", require("utils.keymaps").autolist_cr, opts)
    else
      opts.desc = "MiniPairs <CR>"
      map("i", "<cr>", require("mini.pairs").cr, opts)
    end
  else
    if require("utils.lazy").is_loaded("autolist.nvim") then
      opts.desc = "Autolist <CR>"
      map("i", "<cr>", require("autolist").new_bullet, opts)
    end
  end
end

return M
