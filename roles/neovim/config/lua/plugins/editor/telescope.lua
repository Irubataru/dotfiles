if true then
  return {}
end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, old_opts)
      local actions = require("telescope.actions")

      local opts = {
        defaults = {
          mappings = {
            i = {
              ["<C-w>"] = actions.close,
            },
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-w>"] = actions.delete_buffer,
              },
            },
          },
        },
      }

      return vim.tbl_deep_extend("force", old_opts, opts)
    end,
    keys = function()
      return {
        {
          "<C-b>",
          function()
            require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
          end,
          desc = "Switch Buffer",
        },
        {
          "<leader>F",
          function()
            require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
          end,
          desc = "Grep (Root Dir)",
        },
        { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
        -- find
        { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
        { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
        { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
        { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
        -- git
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
        -- search
        { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
        { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
        { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
        { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
        { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
        { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
        { "<leader>sw", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
        { "<leader>sW", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
        { "<leader>sw", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
        { "<leader>sW", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
        { "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },
        {
          "<leader>ss",
          function()
            require("telescope.builtin").lsp_document_symbols({
              symbols = LazyVim.config.get_kind_filter(),
            })
          end,
          desc = "Goto Symbol",
        },
        {
          "<leader>sS",
          function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols({
              symbols = LazyVim.config.get_kind_filter(),
            })
          end,
          desc = "Goto Symbol (Workspace)",
        },
      }
    end,
  },
}
