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
        "on_output_summarize",
        "on_exit_set_status",
        "on_complete_dispose",
      },
    }
  end,
  condition = {
    filetype = { "rust" },
    callback = require("irubataru.modules.overseer.templates.rust.utilites").not_cargo_project,
  },
}
