-- A collection of improvements for the quickfix buffer

local M = {
  "stevearc/qf_helper.nvim",
  ft = { "qf" },
  cmd = { "QFToggle", "LLToggle" },
}

M.config = function()
  require("qf_helper").setup({
    prefer_loclist = true, -- Used for QNext/QPrev (see Commands below)
    sort_lsp_diagnostics = false, -- Sort LSP diagnostic results
    quickfix = {
      autoclose = true, -- Autoclose qf if it's the only open window
      default_bindings = false, -- Set up recommended bindings in qf window
      default_options = false, -- Set recommended buffer and window options
      max_height = 10, -- Max qf height when using open() or toggle()
      min_height = 1, -- Min qf height when using open() or toggle()
      track_location = true, -- Keep qf updated with your current location
    },
    loclist = { -- The same options, but for the loclist
      autoclose = true,
      default_bindings = false,
      default_options = false,
      max_height = 10,
      min_height = 1,
      track_location = true,
    },
  })
end

return M
