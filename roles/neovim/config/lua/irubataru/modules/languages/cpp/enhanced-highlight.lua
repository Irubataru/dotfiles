-- Additional Vim syntax highlighting for C++ (including C++11/14/17)

local M = {
  "octol/vim-cpp-enhanced-highlight",
  ft = { "cpp", "hpp" },
}

M.config = function()
  vim.g.cpp_experimental_template_highlight = 1
end

return M
