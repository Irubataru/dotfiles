" ---------------------------- "
" javascript specific settings "
" ---------------------------- "

" General settings
" {{{
setlocal foldmethod=syntax
" }}}

" Keymaps
" {{{
nnoremap <leader>cf :Autoformat<CR>
" }}}

" Various javascript conceals
"{{{
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "<"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "#"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
"}}}

" Wrap the conceal characters to their expanded form
"{{{
"inoremap <buffer> <silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>
"inoremap <buffer> <silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>
inoremap <buffer> <silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>
"}}}
