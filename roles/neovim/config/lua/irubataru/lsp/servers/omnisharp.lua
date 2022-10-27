local pid = vim.fn.getpid()
local omnisharp_bin = "omnisharp"

local M = {}

M.config = {
    -- cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    cmd = { omnisharp_bin },
    enable_roslyn_analyzers = true,
    filetypes = { 'cs', 'vb' },
}

return M
