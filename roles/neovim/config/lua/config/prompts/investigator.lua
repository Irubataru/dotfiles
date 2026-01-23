local M = {
  strategy = "workflow",
  description = "Answer coding questions by investigating the repository",
  prompts = {
    {
      {
        name = "Setup investigation",
        role = "user",
        opts = { auto_submit = false },
        content = function()
          vim.g.codecompanion_auto_tool_mode = true

          return [[### Instructions

Your instructions here

### Steps to Follow

You are an expert code and an investigator. You can use tools to analyse the code repository, individual files and configuration, run tests and commands, but NOT change any of the code. You will analyse the code until you have answered the question asked.

Things you can do:
1. Look at the code in the #buffer as that is usually the starting point of the investigation.
2. Use the @cmd_runner tool to look at the respository structure, run tests with `<test_cmd>`, and other useful commands. 
3. Use the @files tool to read necessary files

We'll repeat this cycle until you have found a reasonable answer to the question. Ensure that you under no circumstances edit any of the files.]]
        end,
      },
    },
  },
}

return M
