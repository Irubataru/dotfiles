local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

-- NOTE: Only for debugging
-- require("luasnip.session.snippet_collection").clear_snippets("sh")

local snippet = luasnip.snippet
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("sh", {
  snippet(
    { trig = "template-args", descr = "Argument parsing in bash" },
    fmt(
      [[

#!/usr/bin/env bash

abort() {{
  printf 'Error: %s\n\n' "$1" >&2
  usage >&2
  exit 1
}}

usage() {{
  local cmd="${{0##*/}}"
  local line

  cat <<HELP_TEXT_HEADER
  Usage: ${{cmd}} [OPTIONS] <args>
         ${{cmd}} -h

HELP_TEXT_HEADER

  cat <<HELP_TEXT_BODY
  ${{cmd}} is ...
HELP_TEXT_BODY
}}

arguments=()

# Unpack single-character options bundled together, e.g. -cr, -pr.
for arg in "$@"; do
  if \[\[ "$arg" =~ ^-[^-]. \]\]; then
    index=1
    while option="${{arg:$((index++)):1}}"; do
      if \[\[ -z "$option" \]\]; then
        break
      fi
      arguments+=("-$option")
    done
  else
    arguments+=("$arg")
  fi
  shift
done

set -- "${{arguments[@]}}"
unset arguments

while \[\[ "$#" -ne 0 \]\]; do
  case "$1" in
  -h | --help)
    usage
    exit 0
    ;;
  -*)
    abort "Bad command line option '$1'"
    ;;
  *)
    break
    ;;
  esac
  shift
done

{}
    ]],
      i(1, ">")
    )
  ),
})
