return {
  "folke/noice.nvim",
  -- @param opts cmp.ConfigSchema
  opts = function(_, _)
    local diagnostic_sign_info_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticSignInfo" })
    local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })

    local cmdline_hl = { fg = diagnostic_sign_info_hl.fg, bg = normal_hl.bg }

    vim.api.nvim_set_hl(0, "NoiceCmdLineIcon", cmdline_hl)
    vim.api.nvim_set_hl(0, "NoiceCmdLinePopupBorder", cmdline_hl)

    vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", cmdline_hl)
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", cmdline_hl)

    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", cmdline_hl)
  end,
}
