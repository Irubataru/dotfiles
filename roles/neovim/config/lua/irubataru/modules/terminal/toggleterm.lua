-- A neovim lua plugin to help easily manage multiple terminal windows

local M = {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm" },
  keys = {
    { "<c-\\>" },
    {
      "<leader>Tn",
      function()
        require("irubataru.modules.toggleterm").node_toggle()
      end,
      desc = "Node",
    },
    {
      "<leader>Tg",
      function()
        require("irubataru.modules.toggleterm").lazy_git_toggle()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>Tp",
      function()
        require("irubataru.modules.toggleterm").python_toggle()
      end,
      desc = "Python",
    },
    {
      "<leader>Tt",
      function()
        require("irubataru.modules.toggleterm").toggle_filetype()
      end,
      desc = "Filetype",
    },
    { "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
    { "<leader>Th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
    { "<leader>Tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
  },
}

M.config = function()
  require("toggleterm").setup({
    size = 15,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })

  -- Setup some predefined terminals
  M.terminals = {
    python = require("toggleterm.terminal").Terminal:new({
      cmd = "python",
      close_on_exit = false,
      direction = "float",
    }),
    node = require("toggleterm.terminal").Terminal:new({
      cmd = "node",
      close_on_exit = false,
      direction = "float",
    }),
  }

  vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = "term://*",
    callback = function()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end,
  })
end

local files = {
  python = "python",
  javascript = "node",
}

-- Toggle a terminal with the correct REPL for the current filetype
M.toggle_filetype = function()
  vim.cmd.w()
  local command = files[vim.bo.filetype]

  if command ~= nil then
    require("toggleterm.terminal").Terminal
      :new({
        cmd = command,
        close_on_exit = false,
        direction = "float",
      })
      :toggle()
  end
end

M.lazy_git_toggle = function()
  require("toggleterm.terminal").Terminal
    :new({
      cmd = "lazygit",
      close_on_exit = true,
      direction = "float",
    })
    :toggle()
end

M.node_toggle = function()
  require("lazy").load({ plugins = { "toggleterm.nvim" } })
  M.terminals.node:toggle()
end

M.python_toggle = function()
  require("lazy").load({ plugins = { "toggleterm.nvim" } })
  M.terminals.python:toggle()
end

return M
