" ------------------------
" python specific settings
" ------------------------

" UI
" {{{

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

let g:formatters_python = ['yapf']

" }}}

" Keymaps
" {{{

nnoremap <silent> <F5> :AsyncRun -raw python %<CR>
"autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
nnoremap <leader>cf :Autoformat<CR>

" }}}
