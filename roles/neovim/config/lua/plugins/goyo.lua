local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-g>', ':Goyo<CR>', { noremap=true, silent = true })

vim.g.goyo_width = 100

vim.cmd([[
function! s:goyo_enter()
  " Disable tmux to get a clean window
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z

  " No vim info either
  set noshowmode
  set noshowcmd
  set signcolumn=no
  "set scrolloff=999

  " Also enable Limelight
  Limelight

  " For some reason I have to disable lightline manually
  call lightline#disable()
endfunction

function! s:goyo_leave()
  " Enable tmux again
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z

  " Re-enable vim info
  set showmode
  set showcmd
  set signcolumn=yes
  "set scrolloff=5

  " Turn off Limelight
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
]])
