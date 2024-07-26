-- Git integration for buffers

local M = {
  "lewis6991/gitsigns.nvim",
}

M.keys = {
  {
    "<leader>gb",
    function()
      require("gitsigns").blame_line()
    end,
    desc = "Blame",
  },
  {
    "<leader>gj",
    function()
      require("gitsigns").next_hunk()
    end,
    desc = "Next hunk",
  },
  {
    "<leader>gk",
    function()
      require("gitsigns").prev_hunk()
    end,
    desc = "Prev hunk",
  },
}

-- from max397574/omega-nvim
M.init = function()
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = vim.api.nvim_create_augroup("gitsign_load", {}),
    callback = function()
      local function onexit(code, _)
        if code == 0 then
          vim.schedule(function()
            require("lazy").load({ plugins = { "gitsigns.nvim" } })
          end)
        end
      end

      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      if lines ~= { "" } then
        vim.loop.spawn("git", {
          args = {
            "ls-files",
            "--error-unmatch",
            vim.fn.expand("%"),
          },
        }, onexit)
      end
    end,
  })
end

M.opts = {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "契" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },
}

return M
