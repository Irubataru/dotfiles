return {
  name = "Rust build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "rustc" },
      args = { file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "rust" },
  },
}
