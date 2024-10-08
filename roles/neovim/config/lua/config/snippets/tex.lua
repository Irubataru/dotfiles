local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

-- NOTE: Only for debugging
-- require("luasnip.session.snippet_collection").clear_snippets("tex")

local snippet = luasnip.snippet
local i = luasnip.insert_node
local fmta = require("luasnip.extras.fmt").fmta

luasnip.add_snippets("tex", {
  snippet(
    { trig = "frame", descr = "Beamer frame" },
    fmta(
      [[
\begin{frame}{<>}
  <>
\end{frame}
      ]],
      {
        i(1, "Frame title"),
        i(2, ""),
      }
    )
  ),
  snippet(
    { trig = "template", descr = "Basic document template" },
    fmta(
      [[
\documentclass[11pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{amsmath,tikz}

\usetikzlibrary{calc}

\begin{document}

<>

\end{document}
      ]],
      i(1, "content")
    )
  ),
  snippet(
    { trig = "template-beamer", descr = "Beamer presentation template" },
    fmta(
      [[
\documentclass[11pt,a4paper]{beamer}
\usepackage{listings,algpseudocode}
\usepackage{amsmath,tikz}

\DeclareGraphicsExtensions{.pdf}


\title[Small Title]{Title}
\author{Aleksandra R. Glesaaen}
\date{\today{}}

\begin{document}

\begin{frame}
\titlepage
\end{frame}

<>

\end{document}
      ]],
      i(1, "content")
    )
  ),
  snippet(
    { trig = "template-tikz", descr = "Standalone tikz figure template" },
    fmta(
      [[
\documentclass[11pt,tikz]{standalone}
\usetikzlibrary{calc}

\begin{document}

\begin{tikzpicture}
<>
\end{tikzpicture}

\end{document}
      ]],
      i(1, "content")
    )
  ),
})
