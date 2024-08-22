return {
  {
    "L3MON4D3/LuaSnip",
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = "luasnip" })
        end,
      },
    },

    keys = {
      {
        "<c-j>",
        function()
          return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
        end,
        mode = { "i", "s" },
      },
      {
        "<c-k>",
        function()
          return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
        end,
        mode = { "i", "s" },
      },
    },

    config = function(opts)
      local ls = require("luasnip")

      vim.snippet.expand = ls.lsp_expand

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.snippet.active = function(filter)
        filter = filter or {}
        filter.direction = filter.direction or 1

        if filter.direction == 1 then
          return ls.expand_or_jumpable()
        else
          return ls.jumpable(filter.direction)
        end
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.snippet.jump = function(direction)
        if direction == 1 then
          if ls.expandable() then
            return ls.expand_or_jump()
          else
            return ls.jumpable(1) and ls.jump(1)
          end
        else
          return ls.jumpable(-1) and ls.jump(-1)
        end
      end

      vim.snippet.stop = ls.unlink_current

      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/config/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end

      ls.setup(opts)
    end,
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      update_events = "TextChanged,TextChangedI",
    },
  },
  {
    "garymjr/nvim-snippets",
    enabled = false,
  },
}
