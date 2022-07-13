local M = {}

M.config = {
  -- What I want to do is to remove markdown form the list, but there doesn't
  -- seem to be a way to do that. So this is a list of all the filetypes the
  -- server supports except markdown.
  filetypes = {
    "aspnetcorerazor",
    "astro",
    "astro - markdown",
    "blade",
    "django - html",
    "htmldjango",
    "edge",
    "eelixir",
    "ejs",
    "erb",
    "eruby",
    "gohtml",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "html - eex",
    "heex",
    "jade",
    "leaf",
    "liquid",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "sugarss",
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },
}

return M
