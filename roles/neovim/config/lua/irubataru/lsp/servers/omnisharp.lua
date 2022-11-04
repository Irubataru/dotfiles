local pid = vim.fn.getpid()
local omnisharp_bin = "omnisharp"

local M = {}

M.config = {
    -- cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    cmd = { omnisharp_bin },
    filetypes = { 'cs', 'vb' },

    -- Set defaults to off so that we can configure them ourselves
    enable_editorconfig_support = false,
    sdk_include_prereleases = false,
}

return M
