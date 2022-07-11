local keymap = vim.api.nvim_set_keymap

-- Use incsearch.vim as default search function
keymap('', '/', '<Plug>(incsearch-forward)', {})
keymap('', '?', '<Plug>(incsearch-backward)', {})
keymap('', 'g/', '<Plug>(incsearch-stay)', {})

-- let incsearch manage hlsearch
vim.opt.hlsearch = true
vim.g['incsearch#auto_nohlsearch'] = 1

keymap('', 'n', '<Plug>(incsearch-nohl-n)', {})
keymap('', 'N', '<Plug>(incsearch-nohl-N)', {})
keymap('', '*', '<Plug>(incsearch-nohl-*)', {})
keymap('', '#', '<Plug>(incsearch-nohl-#)', {})
keymap('', 'g*', '<Plug>(incsearch-nohl-g*)', {})
keymap('', 'g#', '<Plug>(incsearch-nohl-g#)', {})
