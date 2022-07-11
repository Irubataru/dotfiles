local keymap = vim.api.nvim_set_keymap
keymap('n', "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", {noremap = true})
