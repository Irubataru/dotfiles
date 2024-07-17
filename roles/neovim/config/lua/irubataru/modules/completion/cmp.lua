-- A completion plugin for neovim coded in Lua.tr

local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
}

M.dependencies = {
  -- nvim-cmp source for neovim builtin LSP client
  { "hrsh7th/cmp-nvim-lsp" },
  -- nvim-cmp source to display function signatures
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  -- nvim-cmp source for nvim lua
  { "hrsh7th/cmp-nvim-lua" },
  -- nvim-cmp source for buffer words
  { "hrsh7th/cmp-buffer" },
  -- nvim-cmp source for path
  { "hrsh7th/cmp-path" },
  -- nvim-cmp source for vim's cmdline
  { "hrsh7th/cmp-cmdline" },
  -- luasnip completion source for nvim-cmp
  { "saadparwaiz1/cmp_luasnip" },
  -- nvim-cmp source for omnifunc
  { "hrsh7th/cmp-omni" },
  -- TabNine plugin for hrsh7th/nvim-cmp
  -- {
  --   "tzachar/cmp-tabnine",
  --   build = "./install.sh",
  -- },
  -- Git source for nvim-cmp
  {
    "petertriho/cmp-git",
    requires = "nvim-lua/plenary.nvim",
    opts = {
      gitlab = {
        hosts = {
          "gitlab.sintef.no",
        },
      },
      trigger_actions = {
        -- NOTE: To disable the commits action, I need to specify the rest
        -- {
        --     debug_name = "git_commits",
        --     trigger_character = ":",
        --     action = function(sources, trigger_char, callback, params, git_info)
        --         return sources.git:get_commits(callback, params, trigger_char)
        --     end,
        -- },
        {
            debug_name = "gitlab_issues",
            trigger_character = "#",
            action = function(sources, trigger_char, callback, params, git_info)
                return sources.gitlab:get_issues(callback, git_info, trigger_char)
            end,
        },
        {
            debug_name = "gitlab_mentions",
            trigger_character = "@",
            action = function(sources, trigger_char, callback, params, git_info)
                return sources.gitlab:get_mentions(callback, git_info, trigger_char)
            end,
        },
        {
            debug_name = "gitlab_mrs",
            trigger_character = "!",
            action = function(sources, trigger_char, callback, params, git_info)
                return sources.gitlab:get_merge_requests(callback, git_info, trigger_char)
            end,
        },
        {
            debug_name = "github_issues_and_pr",
            trigger_character = "#",
            action = function(sources, trigger_char, callback, params, git_info)
                return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
            end,
        },
        {
            debug_name = "github_mentions",
            trigger_character = "@",
            action = function(sources, trigger_char, callback, params, git_info)
                return sources.github:get_mentions(callback, git_info, trigger_char)
            end,
        },
      },
    },
  },
  -- vscode-like pictograms for neovim lsp completion items
  { "onsails/lspkind-nvim" },
  -- Gitmojis for Neovim
  {
    "Dynge/gitmoji.nvim",
    opts = {
      completion = {
        append_space = true,
      },
    },
    ft = "gitcommit",
  },
}

M.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  require("luasnip.loaders.from_vscode").load()

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local source_mapping = {
    luasnip = "[Snip]",
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    -- cmp_tabnine = "[TN]",
    path = "[Path]",
    git = "[]",
  }

  cmp.setup({

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "luasnip" },
      { name = "path" },
      -- { name = "cmp_tabnine" },
      { name = "git" },
    }, {
      { name = "buffer", keyword_length = 4 },
    }),

    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-up>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-down>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

      ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      -- ["<C-Space>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      ["<C-Space>"] = cmp.mapping({
        i = cmp.mapping.complete({}),
        c = function(
          _ --[[fallback]]
        )
          if cmp.visible() then
            if not cmp.confirm({ select = true }) then
              return
            end
          else
            cmp.complete()
          end
        end,
      }),

      -- With automatic tab completion
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          else
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          end
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<c-y>"] = cmp.mapping(
        cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        { "i", "c" }
      ),

      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = lspkind.presets.default[vim_item.kind]

        local menu = source_mapping[entry.source.name]

        if not menu then
          menu = string.format("[%s]", entry.source.name)
        end

        if entry.source.name == "cmp_tabnine" then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. " " .. menu
          end
          -- vim_item.kind = ''
        end

        vim_item.menu = menu
        return vim_item
      end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    experimental = {
      -- ghost_text = true
    },
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Setup cmp for lua files
  cmp.setup.filetype("lua", {
    sources = cmp.config.sources({
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "path" },
    }, {
      { name = "buffer", keyword_length = 4 },
    }),
  })

  -- Setup cmp for latex files
  cmp.setup.filetype("tex", {
    sources = cmp.config.sources({
      { name = "omni" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "path" },
    }, {
      { name = "buffer", keyword_length = 4 },
    }),
  })

  -- Setup cmp_get for gitconfig files
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "git" },
      { name = "gitmoji" },
    }, {
      { name = "buffer" },
    }),
  })
end

return M
