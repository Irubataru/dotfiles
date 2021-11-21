-- vim: foldmethod=marker

local keymap = vim.api.nvim_set_keymap

-- Navigation
-- {{{

-- Dont move with the arrows
keymap('n', '<Up>', '<NOP>', {noremap = true})
keymap('n', '<Down>', '<NOP>', {noremap = true})
keymap('n', '<Left>', '<NOP>', {noremap = true})
keymap('n', '<Right>', '<NOP>', {noremap = true})

-- Fold movement
-- Replace the zj zk calls to move to next closed fold
keymap('n', 'zj', ":call NextClosedFold('j')<CR>", {noremap=true, silent=true})
keymap('n', 'zk', ":call NextClosedFold('k')<CR>", {noremap=true, silent=true})

-- Buffer movement
-- keymap('n', '<C-l>', vim.cmd([[:CtrlSpaceGoDown<CR>]]), {noremap=true, silent=true})
-- keymap('n', '<C-h>', vim.cmd([[:CtrlSpaceGoUp<CR>]]), {noremap=true, silent=true})

-- Tab movement
keymap('n', '<C-Left>', ':tabp<CR>', {noremap=true})
keymap('n', '<C-Right>', ':tabn<CR>', {noremap=true})

-- File navigation
-- {{{

-- Start a :e with the dir of the current buffer already filled in
keymap('n', ',e', ':e <C-R>=Get_Relative_Cwd() <CR>', {noremap=true})

-- }}}

-- }}}

-- UI Related
-- {{{

keymap('n', '<Leader><Leader>', 'zz', {noremap=true})
keymap('n', '<Leader>zz', ':let &scrolloff=810-&scrolloff<CR>', {noremap=true})
keymap('n', '<Leader>rf', ':set foldlevel=0<CR>', {noremap=true})

-- Toggles for quickfix consistent with vim-unimpaired
-- Toggle-command from the vim-togglelist plugin
-- keymap('n', 'coq', vim.cmd([[:call ToggleQuickfixList()<CR>]]), {noremap=true, silent=true, script=true})
keymap('n', '[oq', ':copen<cr>', {noremap=true})
keymap('n', ']oq', ':cclose<cr>', {noremap=true})

-- Disable EX mode
keymap('n', 'Q', '<NOP>', {noremap=true})

-- }}}

-- Terminal related
-- {{{

keymap('t', '<Esc>', '<C-\\><C-n>', {noremap=true})

-- }}}

-- Plugin keymaps
-- {{{

--vim.cmd [[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']]
--vim.cmd [[inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>]]

--vim.cmd [[snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>]]
--vim.cmd [[snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>]]

--" coc.nvim
--" {{{

--[[
-- Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

-- Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

-- Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

-- Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format)

-- Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

-- Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

-- Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

-- Use tab for trigger completion with characters ahead and navigate.
-- Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
--inoremap <silent><expr> <TAB>
      --\ pumvisible() ? "\<C-n>" :
      --\ <SID>check_back_space() ? "\<TAB>" :
      --\ coc#refresh()
--inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

-- Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

-- Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
-- Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? --\<C-y>" : "\<C-g>u\<CR>"

-- Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

--]]

--" }}}

--" NERDCommenter
--" {{{
-- let NERDComInsertMap='<C-C>'
--" }}}

-- }}}
