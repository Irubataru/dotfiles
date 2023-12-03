-- description

local M = {
  "clojure-vim/vim-jack-in",
  cmd = { "Boot", "Clj", "Lein" },
  ft = { "clojure" },
}

M.dependencies = {
  {
    "tpope/vim-dispatch",
    dependencies = {
      "radenling/vim-dispatch-neovim"
    }
  }
}

return M
