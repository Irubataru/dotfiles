local get_hex = require('cokeline/utils').get_hex
require('cokeline').setup({
  -- cycle_prev_next_mappings = true,
  default_hl = {
    focused = {
      fg = get_hex('Normal', 'fg'),
      bg = get_hex('ColorColumn', 'bg'),
    },
    unfocused = {
      fg = get_hex('Comment', 'fg'),
      bg = get_hex('ColorColumn', 'bg'),
    },
  },
  buffers = {
    filter_valid = function(buffer)
      return
        buffer.type ~= "terminal" and
        buffer.type ~= "quickfix" and
        buffer.filetype ~= "fugitive"
    end,
  },

  mappings = {
    cycle_prev_next = true,
  },

  components = {
    {
      text = '｜',
      hl = {
        fg = function(buffer)
          return
          buffer.is_modified
          and vim.g.terminal_color_3 -- yellow
          or vim.g.terminal_color_2 -- green
        end
      },
    },
    {
      text = function(buffer) return buffer.devicon.icon .. ' ' end,
      hl = {
        fg = function(buffer) return buffer.devicon.color end,
      },
    },
    {
      text = function(buffer) return buffer.index .. ': ' end,
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      hl = {
        fg = get_hex('Comment', 'fg'),
        style = 'italic',
      },
    },
    {
      text = function(buffer) return buffer.filename .. ' ' end,
      hl = {
        style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
    },
    {
      text = ' ',
    },
  },
})
