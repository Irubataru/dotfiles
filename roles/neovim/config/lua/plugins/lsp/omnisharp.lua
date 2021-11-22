local pid = vim.fn.getpid()
local omnisharp_bin = "/home/glesaaen/Downloads/omnisharp-linux-x64/run"

local M = {}

M.config = {
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    filetypes = { 'cs', 'vb' },
}

return M
