return {
  name = "Rust build",
  builder = function()
    local file = vim.fn.expand("%:p")
    local outfile = vim.fn.expand("%:p:r")
    return {
      cmd = { "rustc" },
      args = { file, "-o", outfile },
      components = {
        {
          "on_output_quickfix",
          open_on_match = true,
          -- errorformat = [[%Eerror: %\%%(aborting %\|could not compile%\)%\@!%m,]]
          --   .. [[%Eerror[E%n]: %m,]]
          --   .. [[%Inote: %m,]]
          --   .. [[%Wwarning: %\%%(%.%# warning%\)%\@!%m,]]
          --   .. [[%C %#--> %f:%l:%c,]]
          --   .. [[%E  left:%m,%C right:%m %f:%l:%c,%Z,]]
          --   .. [[%.%#panicked at \'%m\'\, %f:%l:%c]],
        },
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
