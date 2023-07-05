return {
  name = "Rust build and run",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local outfile = vim.fn.expand("%:p:r")
    return {
      cmd = { outfile },
      components = {
        {
          "dependencies",
          task_names = {
            { cmd = "rustc", args = { file, "-o", outfile } },
          },
        },
        { "on_output_quickfix", open = true },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "rust" },
  },
}
