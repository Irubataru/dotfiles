local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

-- NOTE: Only for debugging
-- require("luasnip.session.snippet_collection").clear_snippets("html")

local snippet = luasnip.snippet
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("html", {
  snippet(
    { trig = "template-basic", descr = "Basic HTML file template" },
    fmt(
      [[
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{}</title>
  <link rel="stylesheet" href="styles.css">
</head>

<body>
  {}
  <script src="scripts.js"></script>
</body>

</html>
      ]],
      {
        i(1, "Title"),
        i(2, "Content"),
      }
    )
  ),
  snippet(
    { trig = "template-full", descr = "Full HTML file template" },
    fmt(
      [[
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>{}</title>
  <meta name="description" content="A simple HTML5 Template for new projects.">
  <meta name="author" content="SitePoint">

  <meta property="og:title" content="A Basic HTML5 Template">
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://www.sitepoint.com/a-basic-html5-template/">
  <meta property="og:description" content="A simple HTML5 Template for new projects.">
  <meta property="og:image" content="image.png">

  <link rel="icon" href="/favicon.ico">
  <link rel="icon" href="/favicon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">

  <link rel="stylesheet" href="css/styles.css?v=1.0">

</head>

<body>
  {}
  <script src="js/scripts.js"></script>
</body>
</html>
      ]],
      {
        i(1, "Title"),
        i(2, "Content"),
      }
    )
  ),
})
