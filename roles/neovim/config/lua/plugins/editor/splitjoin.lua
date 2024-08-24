return {
  {
    -- A plugin to split and join arguments
    "echasnovski/mini.splitjoin",
    opts = {
      mappings = {
        toggle = "",
        split = "",
        join = "",
      },
    },
  },
  {
    -- A plugin for splitting/joining blocks of code
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "gS", nil, mode = { "n", "v" }, desc = "Toggle split" },
    },
    config = function()
      -- Combine treesj with mini.splitjoin
      -- https://github.com/echasnovski/mini.nvim/discussions/36#discussioncomment-8382869

      local tsj = require("treesj")

      tsj.setup({
        use_default_keymaps = false,
        max_join_length = 512,
      })

      local function get_pos_lang(_)
        local c = vim.api.nvim_win_get_cursor(0)
        local range = { c[1] - 1, c[2], c[1] - 1, c[2] }
        local buf = vim.api.nvim_get_current_buf()
        local ok, parser = pcall(vim.treesitter.get_parser, buf, vim.treesitter.language.get_lang(vim.bo[buf].ft))
        if not ok then
          return ""
        end
        local current_tree = parser:language_for_range(range)
        return current_tree:lang()
      end

      local function toggle_split()
        local tsj_langs = require("treesj.langs")["presets"]
        local lang = get_pos_lang()
        if lang ~= "" and tsj_langs[lang] then
          require("treesj").toggle()
        else
          require("mini.splitjoin").toggle()
        end
      end

      vim.keymap.set({ "n", "v" }, "gS", toggle_split, { desc = "Toggle split" })
    end,
  },
}
