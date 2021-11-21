"LaTeX specific settings

augroup filetype_tex
autocmd!

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=80
let maplocalleader=" "
set conceallevel=2
let g:SuperTabDefaultCompletionType = '<C-x><C-o>'

"setlocal spell
setlocal spelllang=en_gb

"" Keymaps
"" {{{
"nnoremap <Leader>ll :Latexmk<CR>
"nnoremap <Leader>lv :LatexView<CR>
"nnoremap <Leader>lf :LatexFold<CR>
"nnoremap <Leader>lt :LatexTOC<CR>

nnoremap <leader>cf :Autoformat<CR>
"" }}}

augroup END
