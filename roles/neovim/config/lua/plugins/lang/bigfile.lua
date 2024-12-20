return {
  -- Make editing big files faster 🚀
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = function()
      require("bigfile").setup()

      -- TODO: Cleanup: want better granularity, e.g. disable LSP at filesize N, then treesitter at filesize M

      ---@param bufnr number
      ---@return integer|nil size in KiB if buffer is valid, nil otherwise
      local function get_buf_size(bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()
        local ok, stats = pcall(function()
          return vim.loop.fs_stat(vim.api.nvim_buf_get_name(bufnr))
        end)
        if not (ok and stats) then
          return
        end
        return math.floor(0.5 + (stats.size / 1024))
      end

      local function pre_bufread_callback(bufnr)
        local status_ok, _ = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_detected")
        if status_ok then
          return -- buffer has already been processed
        end

        local filesize = get_buf_size(bufnr) or 0
        print(filesize)
        if filesize < 800 then
          vim.api.nvim_buf_set_var(bufnr, "bigfile_detected", 0)
          return
        end

        vim.api.nvim_buf_set_var(bufnr, "bigfile_detected", 1)

        vim.api.nvim_create_autocmd({ "LspAttach" }, {
          buffer = bufnr,
          callback = function(args)
            vim.schedule(function()
              vim.lsp.buf_detach_client(bufnr, args.data.client_id)
            end)
          end,
        })
      end

      local augroup = vim.api.nvim_create_augroup("bigfile2", {})
      vim.api.nvim_create_autocmd("BufReadPre", {
        pattern = "*",
        group = augroup,
        callback = function(args)
          pre_bufread_callback(args.buf)
        end,
        desc = "[bigfile.nvim] Performance rule for handling files over 1MiB",
      })
    end,
  },
}
