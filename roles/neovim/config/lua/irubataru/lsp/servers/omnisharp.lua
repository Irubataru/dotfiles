local pid = vim.fn.getpid()
local omnisharp_bin = "omnisharp"

local M = {}

M.config = {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    filetypes = { 'cs', 'vb' },
}

return M
