local supported = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",

  -- TODO: Need to check if correct plugins are installed
  -- "vue",
  -- "astro",
  -- "mdx",
  -- "node",
  -- "html",
}

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "eslint_d")
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.eslint_d = {
        condition = function(ctx)
          return vim.fs.find({ "eslint.config.js" }, { path = ctx.filename, upward = true })[1]
        end,
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "eslint_d" } },
  },
}
