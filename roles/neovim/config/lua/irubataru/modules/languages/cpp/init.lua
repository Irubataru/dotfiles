return {
  require("irubataru.modules.languages.cpp.enhanced-highlight"),
  require("irubataru.modules.languages.cpp.clang-format"),

  -- Vim plugin that displays tags in a window, ordered by scope
  {
    "preservim/tagbar",
    ft = { "cpp" },
  },
}
