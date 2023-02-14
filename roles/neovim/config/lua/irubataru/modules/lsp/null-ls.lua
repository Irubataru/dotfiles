local M = {}

function M.setup(options)
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettierd.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "jsonc",
          "yaml",
          "markdown.mdx",
          "graphql",
          "handlebars",
        },
      }),
      null_ls.builtins.formatting.stylua.with({
        extra_args = { "--config-path", vim.fn.expand("~/.config/stylua/stylua.toml") },
      }),
      null_ls.builtins.formatting.black,
      -- null_ls.builtins.formatting.yapf,
    },
    on_attach = options.on_attach,
  })
end

return M
