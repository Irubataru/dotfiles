local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
  },
}

M.dependencies = {
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "nvim-treesitter/playground",
  },
}

-- From max397574/omega-nvim
-- M.init = function()
--     if not vim.tbl_contains({ "[packer]", "" }, vim.fn.expand("%")) then
--         require("lazy").load({ plugins = { "nvim-treesitter" } })
--     else
--         vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
--             callback = function()
--                 local file = vim.fn.expand("%")
--                 if not vim.tbl_contains({ "[packer]", "" }, file) then
--                     require("lazy").load({ plugins = { "nvim-treesitter" } })
--                 end
--             end,
--         })
--     end
-- end

M.config = function()
  local treesitter_config = require("nvim-treesitter.configs")

  treesitter_config.setup({
    ensure_installed = "all",
    ignore_install = { "tex", "latex" }, -- list of parsers to ignore installing
    highlight = {
      enable = true,
      disable = { "tex", "latex" }, -- list of languages that will be disabled

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,

      indent = {
        enable = true,
        disable = {}, -- list of languages not to indent for
      },
    },
  })
end

return M
