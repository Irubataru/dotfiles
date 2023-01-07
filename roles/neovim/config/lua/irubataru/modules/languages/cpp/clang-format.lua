-- Vim plugin for clang-format

local M = {
  "rhysd/vim-clang-format",
  ft = { "hpp", "cpp", "c" },
}

M.dependencies = {
  { "kana/vim-operator-user" },
}

M.config = function()
  vim.g["clang_format#code_style"] = "llvm"
  vim.g["clang_format#style_options"] = {
    AlwaysBreakTemplateDeclarations = true,
    BreakBeforeBraces = "Allman",
    ConstructorInitializerAllOnOneLineOrOnePerLine = true,
    Standard = "C++11",
  }
end

return M
