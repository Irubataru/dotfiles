-- A simple usecase of floating window to help you focus.

-- TODO: Make 'q' quit neozoom
local M = {
  "nyngwang/NeoZoom.lua",
  cmd = { "NeoZoomToggle" },
  keys = {
    { "<F-11>", "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
    { "<leader>wz", "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
    { "<C-W>z", "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
  },
  opts = {
    winopts = {
      offset = {
        width = 0.9,
        height = 0.85,
        top = nil,
        left = nil,
      },
      border = "rounded",
    },
    exclude_buftypes = { "terminal" },
    presets = {
      {
        filetypes = { "dapui_.*", "dap-repl" },
        config = {
          top = 0.25,
          left = 0.6,
          width = 0.4,
          height = 0.65,
        },
        callbacks = {
          -- function()
          --   vim.wo.wrap = true
          -- end,
        },
      },
    },
  },
}

return M
