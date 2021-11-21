" ---------------------
" C++ specific settings
" ---------------------

" UI
" {{{
set foldmethod=syntax
set foldlevelstart=0
set foldlevel=0

"let &colorcolumn="80,".join(range(120,999),",")

"set tabstop=2
"set expandtab
"set shiftwidth=2
" }}}

" Keymaps
" {{{

nnoremap <leader>rf :set foldlevel=0<CR>
nnoremap <leader>rF :set foldlevel=1<CR>
nnoremap <leader>ll :Make<CR>
nnoremap <leader>LL :Make!<CR>

"" vim-clang-format
"" {{{
autocmd FileType c,cpp nnoremap <buffer><Leader>= :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>= :ClangFormat<CR>
"" }}}

" }}}
