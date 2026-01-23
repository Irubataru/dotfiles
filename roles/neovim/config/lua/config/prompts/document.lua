return {
  strategy = "inline",
  description = "Add documentation to the code",
  opts = {
    is_slash_cmd = false,
    modes = { "v" },
    short_name = "document",
    auto_submit = true,
    user_prompt = false,
    stop_context_insertion = true,
  },
  prompts = {
    {
      role = "system",
      content = [[When asked to add documentation to code, follow these steps

1. Identify the programming language.
2. Add documentation headers to functions, classes, ... where appropriate using the @editor tool

Use the natural documenentation formatting for different languages. For example
- Lua uses luals annotations
- C# uses the standard XML documentation
- Typescript uses TSDoc and optionally JSDoc where necessary]],
      opts = {
        visible = false,
      },
    },
    {
      role = "user",
      content = function(context)
        local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

        return string.format(
          [[Please add docstrings to this code from buffer %d:

```%s
%s
```
]],
          context.bufnr,
          context.filetype,
          code
        )
      end,
      opts = {
        contains_code = true,
      },
    },
  },
}
