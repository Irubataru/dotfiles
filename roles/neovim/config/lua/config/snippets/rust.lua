local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return {}
end

require("luasnip.session.snippet_collection").clear_snippets("rust")

local snippet = luasnip.snippet
local t = luasnip.text_node

luasnip.add_snippets("rust", {
  snippet({ trig = "aoc", descr = "Advent of code" }, {
    t({
      "use std::env;",
      "use std::fs::File;",
      "use std::io::{prelude::*, BufReader};",
      "",
      "fn main() {",
      "    let args: Vec<String> = env::args().collect();",
      "    let reader = BufReader::new(File::open(&args[1]).unwrap());",
      "",
      "    for line in reader.lines() {",
      "    }",
      "}",
    }),
  }),
})
